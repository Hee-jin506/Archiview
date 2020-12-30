package bitcamp.acv.web.ajax;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.acv.domain.Member;
import bitcamp.acv.service.CommentService;
import bitcamp.acv.service.MemberService;
import bitcamp.acv.service.ReviewService;

@Controller("ajax.reviewController")
@RequestMapping("/ajax/review")
public class ReviewController {

  @Autowired ReviewService reviewService;
  @Autowired MemberService memberService;
  @Autowired CommentService commentService;

  @RequestMapping("detailForUser")
  public void detailForUser(int reviewNo, HttpSession session, Model model) throws Exception {
    Member loginUser = (Member) session.getAttribute("loginUser");

    model.addAttribute("loginUser", loginUser);
    model.addAttribute("review", reviewService.get(reviewNo, loginUser.getNo()));
    model.addAttribute("view", commentService.getByReviewNo(reviewNo));
  }


}
