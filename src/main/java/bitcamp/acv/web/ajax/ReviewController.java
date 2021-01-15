package bitcamp.acv.web.ajax;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.acv.domain.Comment;
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
    
    List<Comment> comments = commentService.getByReviewNo(reviewNo);
    
    for (Comment comment : comments) {

      Calendar cal = new GregorianCalendar(Locale.KOREA);
      long now = cal.getTimeInMillis();
      long diff = now - comment.getRegisteredDate().getTime();
      if (diff / 1000 / 60 < 1) {
        comment.setRdtFromNow("방금 전");
      } else if (diff / 1000 / 60 / 60 < 1) {
        comment.setRdtFromNow(diff / 1000 / 60 + "분 전");
      } else if (diff/ 1000 / 60 / 60 / 24 < 1) {
        comment.setRdtFromNow(diff/ 1000 / 60 / 60 + "시간 전");
      } else if (diff/ 1000 / 60 / 60 / 24 / 7 < 1) {
        comment.setRdtFromNow(diff/ 1000 / 60 / 60 / 24 + "일 전");
      } else if (diff/ 1000 / 60 / 60 / 24 / 7 / 30 < 1) {
        comment.setRdtFromNow(diff/ 1000 / 60 / 60 / 24 / 7 + "주 전");
      } else if (diff/ 1000 / 60 / 60 / 24 / 365 < 1) {
        comment.setRdtFromNow(Calendar.MONTH - comment.getRegisteredDate().getMonth() + "달 전");
      } else {
        comment.setRdtFromNow(Calendar.YEAR - comment.getRegisteredDate().getYear() + "년 전");
      }
    }
    
    for (Comment comment : comments) {
      System.out.println(comment.getRdtFromNow());
    }
    model.addAttribute("view", comments);
  }


  @RequestMapping("moreFeed")
  public void moreFeed(int pageNo, HttpSession session, Model model) throws Exception {
    Member loginUser = (Member) session.getAttribute("loginUser");
    model.addAttribute("loginUser", loginUser);
    model.addAttribute("list", reviewService.getMainFeed(loginUser.getNo(), pageNo));
  }
  
  @RequestMapping("moreFollowingFeed")
  public void moreFollowingFeed(int pageNo, HttpSession session, Model model) throws Exception {
    Member loginUser = (Member) session.getAttribute("loginUser");
    model.addAttribute("loginUser", loginUser);
    model.addAttribute("list", reviewService.getFollowingFeed(loginUser.getNo(), pageNo));
  }
}
