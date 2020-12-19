package bitcamp.acv.web.main;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import bitcamp.acv.domain.Member;
import bitcamp.acv.domain.Movie;
import bitcamp.acv.domain.Tag;
import bitcamp.acv.service.MemberService;
import bitcamp.acv.service.MovieService;
import bitcamp.acv.service.TagService;

@Controller
@RequestMapping("/main")
public class MainController {

  @Autowired MemberService memberService;
  @Autowired TagService tagService;
  @Autowired MovieService movieService;

  @RequestMapping("")
  public ModelAndView main(HttpSession session) throws Exception {

    Member member = (Member) session.getAttribute("loginUser");
    ModelAndView mv = new ModelAndView();
    mv.addObject("loginUser", member);
    mv.setViewName("/main/home.jsp");
    return mv;
  }

  @RequestMapping("search")
  public ModelAndView search(String keyword, String selectedTagTitle) throws Exception {

    ModelAndView mv = new ModelAndView();
    if (keyword != null) {
      // 키워드 맨 앞글자가 '#'이 아니면 topBarNonTagSearch.jsp를 include
      if(keyword.toCharArray()[0] != '#') {
        System.out.println(keyword);
        mv.addObject("keyword", keyword);
        mv.setViewName("/main/topBarNonTagSearch.jsp");
      } else {
        // 맨 앞글자가 '#'이면 topBarTagSearch.jsp를 include
        // #을 뗀다
        mv.addObject("keyword", keyword.substring(1));
        mv.setViewName("/main/topBarTagSearch.jsp");
      }
    } else {
      // 태그를 선택한 후(keyword는 null임)
      mv.addObject("selectedTagTitle", selectedTagTitle);
      mv.setViewName("/main/topBarBestReviewSearch.jsp");
    }
    return mv;
  }

  @RequestMapping("sidebar")
  public ModelAndView sidebar() throws Exception {
    System.out.println("sidebar 실행!");
    List<Member> members = memberService.listByPop();
    List<Movie> movies = movieService.listByPop();
    List<Tag> tags = tagService.listByPop();
    ModelAndView mv = new ModelAndView();

    Member[] topMembers = new Member[3];
    for (int i = 0; i < 3; i++) {
      topMembers[i] = members.get(i);
    }

    Movie[] topMovies = new Movie[3];
    for (int i = 0; i < 3; i++) {
      topMovies[i] = movies.get(i);
    }

    Tag[] topTags = new Tag[3];
    for (int i = 0; i < 3; i++) {
      topTags[i] = tags.get(i);
    }

    mv.addObject("topMembers", topMembers);
    mv.addObject("topMovies", topMovies);
    mv.addObject("topTags", topTags);
    mv.setViewName("/main/sidebar.jsp");
    return mv;
  }

  @RequestMapping("topbar")
  public ModelAndView topbar(Member loginUser, HttpSession session) throws Exception {
    System.out.println("topbar 실행!");
    ModelAndView mv = new ModelAndView();
    if (loginUser == null) {
      mv.addObject("loginUser", session.getAttribute("loginUser"));
    }
    mv.setViewName("/main/topbar.jsp");
    return mv;
  }
}