package bitcamp.acv.web.main;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import bitcamp.acv.domain.Member;
import bitcamp.acv.domain.Movie;
import bitcamp.acv.domain.Review;
import bitcamp.acv.service.MemberService;
import bitcamp.acv.service.MovieService;
import bitcamp.acv.service.ReviewService;
import bitcamp.acv.service.TagService;

@Controller
@RequestMapping("/main")
@SessionAttributes("loginUser")
public class MainSearchController {

  @Autowired ReviewService reviewService;
  @Autowired MemberService memberService;
  @Autowired MovieService movieService;
  @Autowired TagService tagService;

  @GetMapping("search")
  public void search(
      String keyword,
      HttpSession session,
      Model model) throws Exception {

    // 탑바
    Member loginUser = (Member) session.getAttribute("loginUser");
    model.addAttribute("loginUser", loginUser);

    // 사이드바
    model.addAttribute("topMembers", memberService.listByPop3());
    model.addAttribute("topMovies", movieService.listByPop3());
    model.addAttribute("topTags", tagService.listByPop3());


    if (keyword.length() != 0) {
      if(keyword.toCharArray()[0] != '#') {
        System.out.println("일반 검색");

        List<Movie> movies = movieService.listByKeywordTitle(keyword);
        model.addAttribute("movies");

        List<Member> members = memberService.listByKeywordNickName(keyword);
        model.addAttribute("members");


      } else {
        System.out.println("태그 검색");
        List<Review> reviews = reviewService.listByKeywordTagTitle(keyword);
        model.addAttribute("reviews");

      }
    }
  }
}

