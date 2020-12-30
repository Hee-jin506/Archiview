package bitcamp.acv.web.main;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import bitcamp.acv.domain.Member;
import bitcamp.acv.domain.Movie;
import bitcamp.acv.domain.Review;
import bitcamp.acv.service.FollowService;
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
  @Autowired FollowService followService;

  @GetMapping("search")
  public ModelAndView search(
      String keyword,
      HttpSession session,
      Model model)
          throws Exception {
    ModelAndView mv = new ModelAndView();

    // 탑바
    Member loginUser = (Member) session.getAttribute("loginUser");
    model.addAttribute("loginUser", loginUser);

    // 사이드바
    model.addAttribute("topMembers", memberService.listByPop3());
    model.addAttribute("topMovies", movieService.listByPop3());
    model.addAttribute("topTags", tagService.listByPop3());

    // 메인피드

    if (keyword == "") {
      mv.setViewName("redirect:../../app/main");
      return mv;
    }

    if (keyword.length() != 0) {

      if(keyword.toCharArray()[0] != '#') {

        List<Movie> movies = movieService.listByKeywordTitle(keyword);
        List<Member> members = memberService.listByKeywordNickName(keyword);

        mv.addObject("movies", movies);
        mv.addObject("members", members);

        //        for (Member m : members) {
        //
        //          // 바디
        //          Member member = memberService.get(m.getNo());
        //          System.out.println(m.getFollowing());
        //          // 팔로잉 여부 검사 : 팔로우버튼 색깔바꿈
        //          List<Follow> followings = followService.list2(loginUser.getNo());
        //          List<Integer> followingNoList = new ArrayList<>();
        //          for (Follow f : followings) {
        //            if (f.getFollowedType() == 1) {
        //              followingNoList.add(f.getTargetMember().getNo());
        //            }
        //          }
        //          boolean following = false;
        //          if (followingNoList.contains(member.getNo())) {
        //            following = true;
        //          }
        //          mv.addObject("following", following);
        //
        //        }

      } else {

        List<Review> reviews = reviewService.listByKeywordTagTitle(keyword);
        mv.addObject("reviews", reviews);

      }
    }

    mv.setViewName("main/search");
    return mv;
  }
}

