package bitcamp.acv.web.comment;

import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import bitcamp.acv.domain.Comment;
import bitcamp.acv.domain.Member;
import bitcamp.acv.service.CommentService;
import bitcamp.acv.service.MemberService;
import bitcamp.acv.service.ReviewService;

@Controller
@RequestMapping("/comment")
public class CommentController {

  @Autowired CommentService commentService;
  @Autowired ReviewService reviewService;
  @Autowired MemberService memberService;
  @Autowired ServletContext servletContext;

  // 관리자 화면
  @RequestMapping("list")
  protected ModelAndView list(String keyword) throws Exception {
    List<Comment> list = commentService.list(keyword);
    ModelAndView mv = new ModelAndView();
    mv.addObject("list", list);
    mv.setViewName("/comment/list.jsp");
    return mv;
  }


  // 사용자 화면
  @RequestMapping("view")
  protected ModelAndView view(
      int reviewNo,
      HttpServletRequest request) throws Exception {
    List<Comment> view = commentService.getByReviewNo(reviewNo);
    ModelAndView mv = new ModelAndView();

    HttpSession session = request.getSession();
    Member loginUser = (Member) session.getAttribute("loginUser");

    mv.addObject("view", view);
    mv.addObject("member", loginUser);
    mv.setViewName("/comment/view.jsp");
    return mv;
  }

  @RequestMapping("add")
  public String add(
      int reviewNo,
      int order,
      int level,
      int memberNo,
      String content,
      HttpServletRequest request
      ) throws Exception {

    // 리퀘스트에 저장된 정보를  가져온다.
    HttpSession session = request.getSession();

    // 코멘트 객체를 만든다.
    Comment comment = new Comment();

    // 댓글을 달 대상 댓글의 order를 가져온다.

    // 대상 댓글보다 1이 증가된 것이 댓글의 order = newOrder
    // newOder과 같거나 더 큰 order 들은 전부 +1을 해준다.

    // 만약 level이 0 이라면 1을 증가시킨다.
    if (Integer.parseInt(request.getParameter("level")) == 0) {
      comment.setLevel(1);
    }

    comment.setReviewNo(Integer.parseInt(request.getParameter("reviewNo")));
    comment.setContent(request.getParameter("content"));

    Member loginUser = (Member) session.getAttribute("loginUser");
    int loginUserNo = loginUser.getNo();
    comment.setMemberNo(loginUserNo);

    commentService.add(comment);

    return "redirect:../comment/view";
  }
}
