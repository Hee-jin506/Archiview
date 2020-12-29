package bitcamp.acv.web.Review;

import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import bitcamp.acv.domain.Member;
import bitcamp.acv.domain.Review;
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


  @RequestMapping("bestReviewSearch")
  public ModelAndView detail(String keyword) throws Exception {
    List<Review> reviewList = reviewService.listByKeywordTagTitle(keyword);

    ModelAndView mv = new ModelAndView();
    mv.addObject("reviewList", reviewList);
    mv.setViewName("review/bestReviewSearch");
    return mv;
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
  public void detailForUser(int reviewNo, HttpSession session, Model model) throws Exception {
    Member loginUser = (Member) session.getAttribute("loginUser");
    model.addAttribute("review", reviewService.get(reviewNo, loginUser.getNo()));
  }
}
