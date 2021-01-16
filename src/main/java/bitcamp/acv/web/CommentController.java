package bitcamp.acv.web;

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
  public ModelAndView add(
      String targetNo,
      int reviewNo,
      String content,
      HttpServletRequest request,
      HttpSession session
      ) throws Exception {
    ModelAndView mv = new ModelAndView();

    // 코멘트 객체를 만든다.
    Comment comment = new Comment();
    comment.setReviewNo(Integer.parseInt(request.getParameter("reviewNo")));
    comment.setLevel(Integer.parseInt(request.getParameter("level")));
    comment.setContent(request.getParameter("content"));
    Member loginUser = (Member) session.getAttribute("loginUser");
    comment.setMemberNo(loginUser.getNo());

    if (targetNo != null) {
      comment.setGroupNo(Integer.parseInt(targetNo));
    } else {
      comment.setGroupNo(0);
    }
    commentService.add(comment);
    mv.setViewName("redirect:../main");
    return mv;
  }

  @RequestMapping("/update")
  public String update(Comment comment, HttpServletRequest request) throws Exception {
    if (commentService.update(comment) == 0) {

      throw new Exception("해당 댓글이 없습니다.");
    }

    return "redirect:../comment/view?reviewNo=" + request.getParameter("reviewNo");
  }

  @RequestMapping("/delete")
  public ModelAndView delete(int no, int reviewNo, HttpServletRequest request) throws Exception {
    if (commentService.delete(no) == 0) {

      throw new Exception("해당 댓글이 없습니다.");
    }

    ModelAndView mv = new ModelAndView();
    mv.addObject("reviewNo", reviewNo);
    mv.setViewName("redirect:Archiview/app/main");
    return mv;
  }
}
