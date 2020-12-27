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
import bitcamp.acv.service.MovieService;
import bitcamp.acv.service.ReviewService;
import bitcamp.acv.service.TagService;

@Controller
@RequestMapping("/comment")
public class CommentController {

  @Autowired CommentService commentService;
  @Autowired ReviewService reviewService;
  @Autowired MemberService memberService;
  @Autowired ServletContext servletContext;
  @Autowired MovieService movieService;
  @Autowired TagService tagService;

  // 관리자 화면
  @RequestMapping("list")
  protected ModelAndView list(String keyword) throws Exception {
    List<Comment> list = commentService.list(keyword);
    ModelAndView mv = new ModelAndView();
    mv.addObject("list", list);
    mv.setViewName("comment/list");
    return mv;
  }


  // 사용자 화면
  @RequestMapping("view")
  protected ModelAndView view(
      int reviewNo,
      HttpServletRequest request) throws Exception {

    List<Comment> view = commentService.getByReviewNo(reviewNo);
    ModelAndView mv = new ModelAndView();

    mv.addObject("view", view);
    mv.setViewName("comment/view");
    return mv;
  }

  @RequestMapping("add")
  public String add(
      int groupNo,
      int reviewNo,
      String content,
      HttpServletRequest request
      ) throws Exception {

    // 리퀘스트에 저장된 정보를  가져온다.
    HttpSession session = request.getSession();

    // 코멘트 객체를 만든다.
    Comment comment = new Comment();

    // 만약 level이 1 이라면 2를 넣는다.
    if (Integer.parseInt(request.getParameter("level")) == 1) {
      comment.setLevel(2);
    } else {
      comment.setLevel(1);
    }

    comment.setReviewNo(Integer.parseInt(request.getParameter("reviewNo")));
    comment.setContent(request.getParameter("content"));
    comment.setGroupNo(Integer.parseInt(request.getParameter("groupNo")));

    Member loginUser = (Member) session.getAttribute("loginUser");
    comment.setMemberNo(loginUser.getNo());

    commentService.add(comment);

    return "redirect:../comment/view?reviewNo=" + request.getParameter("reviewNo");
  }

  @RequestMapping("/update")
  public String update(Comment comment, HttpServletRequest request) throws Exception {
    if (commentService.update(comment) == 0) {

      throw new Exception("해당 댓글이 없습니다.");
    }

    return "redirect:../comment/view?reviewNo=" + request.getParameter("reviewNo");
  }

  @RequestMapping("/delete")
  public String delete(int no, int reviewNo, HttpServletRequest request) throws Exception {
    if (commentService.delete(no) == 0) {

      throw new Exception("해당 댓글이 없습니다.");
    }

    return "redirect:../comment/view?reviewNo=" + request.getParameter("reviewNo");
  }
}
