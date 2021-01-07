package bitcamp.acv.web.follow;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import bitcamp.acv.domain.Follow;
import bitcamp.acv.domain.Member;
import bitcamp.acv.domain.Tag;
import bitcamp.acv.service.FollowService;
import bitcamp.acv.service.MemberService;
import bitcamp.acv.service.MovieService;
import bitcamp.acv.service.ReviewService;
import bitcamp.acv.service.TagService;


@Controller
@RequestMapping("/follow")
@SessionAttributes("loginUser")
public class FollowController {

  @Autowired ReviewService reviewService;
  @Autowired MemberService memberService;
  @Autowired MovieService movieService;
  @Autowired FollowService followService;
  @Autowired TagService tagService;

  // 멤버 팔로우
  @RequestMapping("addUser")
  public String addUser(Model model,
      HttpSession session,
      Follow follow,
      int followedNo,
      HttpServletRequest request,
      @RequestParam(defaultValue="1") int followedType) throws Exception {

    // 사이드바
    model.addAttribute("topMembers", memberService.listByPop3());
    model.addAttribute("topMovies", movieService.listByPop3());
    model.addAttribute("topTags", tagService.listByPop3());

    Member loginUser = (Member) session.getAttribute("loginUser");

    follow.setFollowingMember(loginUser);
    follow.setFollowedType(followedType);
    follow.setFollowedNo(followedNo);
    followService.addUser(follow);
    String referer = request.getHeader("REFERER");

    String[] r = referer.split("app");

    return "redirect:../main";
  }

  @RequestMapping("deleteUser")
  public String deleteUser(Follow follow,
      HttpSession session,
      HttpServletRequest request,
      Model model) throws Exception {

    Member loginUser = (Member) session.getAttribute("loginUser");

    follow.setFollowingMember(loginUser);
    followService.deleteUser(follow);
    String referer = request.getHeader("REFERER");

    String[] r = referer.split("app");

    return "redirect:../main";
  }

  // 태그 팔로우
  @RequestMapping("addTag")
  public String addTag(Model model,
      HttpSession session,
      Follow follow,
      int followedNo,
      HttpServletRequest request,
      @RequestParam(defaultValue="2") int followedType) throws Exception {

    Member loginUser = (Member) session.getAttribute("loginUser");

    follow.setFollowingMember(loginUser);

    follow.setFollowedType(followedType);
    follow.setFollowedNo(followedNo);
    followService.addUser(follow);

    String referer = request.getHeader("REFERER");

    String[] r = referer.split("app");

    return "redirect:.." + r[1];
  }
  
  // 태그 언팔
  @RequestMapping("deleteTag")
  public String deleteTag(Follow follow,
      HttpSession session,
      HttpServletRequest request,
      Model model) throws Exception {

    Member loginUser = (Member) session.getAttribute("loginUser");

    follow.setFollowingMember(loginUser);
    followService.deleteTag(follow);
    String referer = request.getHeader("REFERER");

    String[] r = referer.split("app");

    return "redirect:../main";
  }

  
  
  


  // 리스트
  @GetMapping("list")
  public void list(@ModelAttribute("loginUser") Member loginUser,
      Model model) throws Exception {

    List<Follow> list = followService.list();

    // 사이드바
    model.addAttribute("topMembers", memberService.listByPop3());
    model.addAttribute("topMovies", movieService.listByPop3());
    model.addAttribute("topTags", tagService.listByPop3());
    model.addAttribute("list", list);
  }

  // 전체 리스트 상세
  @GetMapping("detail")
  public ModelAndView view(int no,
      Member member,
      Tag tag) throws Exception {

    Follow follow = followService.get(no);
    ModelAndView mv = new ModelAndView();

    // targer .jsp 불러오기.
    Object target = followService.getTarget(follow);
    System.out.println(target instanceof Member);
    System.out.println(target instanceof Tag);

    if (follow == null) {
      throw new Exception("해당 회원이 없습니다!");
    }  else {
      if (target instanceof Member) {
        mv.addObject("member", target);
        mv.addObject("follower", "memberTarget.jsp");
      } else if (target instanceof Tag) {
        mv.addObject("tag", target);
        mv.addObject("follower", "tagTarget.jsp");
      } else {
        throw new Exception("팔로우 상세정보 처리 중 오류 발생!");
      }

      mv.addObject("follow", follow);
      mv.setViewName("/follow/detail.jsp");
      return mv;
    }
  }
  
}
