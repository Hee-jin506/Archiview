package bitcamp.acv.web.Review;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import bitcamp.acv.domain.Comment;
import bitcamp.acv.domain.Member;
import bitcamp.acv.domain.Review;
import bitcamp.acv.service.CommentService;
import bitcamp.acv.service.FollowService;
import bitcamp.acv.service.MemberService;
import bitcamp.acv.service.MovieService;
import bitcamp.acv.service.ReviewService;
import bitcamp.acv.service.TagService;

@Controller
@RequestMapping("/review")
public class ReviewController {

  @Autowired ReviewService reviewService;
  @Autowired MovieService movieService;
  @Autowired MemberService memberService;
  @Autowired TagService tagService;
  @Autowired ServletContext servletContext;
  @Autowired CommentService commentService;
  @Autowired FollowService followService;


  @RequestMapping("bestReviewSearch")
  public void detail(String keyword, Model model) throws Exception {
    model.addAttribute("reviewList", reviewService.listByKeywordTagTitle(keyword));
  }

  @GetMapping("followingFeed")
  public void followingFeed(HttpSession session, Model model) throws Exception {
    // 탑바
    Member loginUser = (Member) session.getAttribute("loginUser");
    model.addAttribute("loginUser", loginUser);

    // 사이드바
    model.addAttribute("topMembers", memberService.listByPop3());
    model.addAttribute("topMovies", movieService.listByPop3());
    model.addAttribute("topTags", tagService.listByPop3());

    // 메인피드
    model.addAttribute("list", reviewService.getFollowingFeed(loginUser.getNo(), 1));
  }

  @GetMapping("detailForUser")
  public void detailForUser(
      int reviewNo, 
      @ModelAttribute("loginUser") Member loginUser, 
      Model model) throws Exception {
    
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

    model.addAttribute("view", comments);
  }

  @RequestMapping("delete")
  public String inactive(int no) throws Exception {
    if (reviewService.delete(no) == 0) {
      throw new Exception("해당 리뷰가 없습니다.");
    } else {
      return "redirect:../main";
    }
  }
}
