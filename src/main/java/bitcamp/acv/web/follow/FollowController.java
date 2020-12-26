package bitcamp.acv.web.follow;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import bitcamp.acv.domain.Follow;
import bitcamp.acv.domain.Member;
import bitcamp.acv.domain.Tag;
import bitcamp.acv.service.FollowService;
import bitcamp.acv.service.MemberService;
import bitcamp.acv.service.MovieService;
import bitcamp.acv.service.TagService;


@Controller
@RequestMapping("/follow")
@SessionAttributes("loginUser")
public class FollowController {

  @Autowired MemberService memberService;
  @Autowired MovieService movieService;
  @Autowired FollowService followService;
  @Autowired TagService tagService;

  // 멤버 팔로우
  @GetMapping("addUser")
  public String addUser(Follow follow,
      @ModelAttribute("loginUser") Member loginUser) throws Exception {
    follow.setFollowingMember(loginUser);

    followService.addUser(follow);
    return "redirect:../main";
  }

  @GetMapping("deleteUser")
  public String deleteUser(Follow follow,
      @ModelAttribute("loginUser") Member loginUser) throws Exception {
    follow.setFollowingMember(loginUser);

    followService.deleteUser(follow);
    return "redirect:../main";
  }

  // 태그 팔로우
  @GetMapping("addTag")
  public String addTag(Follow follow,
      @ModelAttribute("loginUser") Member loginUser) throws Exception {
    follow.setFollowingMember(loginUser);

    followService.addTag(follow);
    return "redirect:list";
  }

  @PostMapping("active")
  public String active(int no) throws Exception {
    if (followService.active(no) == 0) {
      throw new Exception("해당 회원이 존재하지 않습니다.");
    }
    return "redirect:list";
  }

  @PostMapping("inactive")
  public String inactive(int no) throws Exception {
    if (followService.inactive(no) == 0) {
      throw new Exception("해당 회원이 존재하지 않습니다.");
    } else {
      return "redirect:list";
    }
  }

  // 팔로잉 리스트
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

  // 특정멤버의 팔로워 리스트
  @GetMapping("followerList")
  public void followerList(@ModelAttribute("loginUser") Member loginUser,
      int no,
      Model model) throws Exception {

    // 사이드바
    model.addAttribute("topMembers", memberService.listByPop3());
    model.addAttribute("topMovies", movieService.listByPop3());
    model.addAttribute("topTags", tagService.listByPop3());

    // 바디(나를 팔로워하는 리스트)
    List<Follow> followList = followService.list3(no);
    List<Member> targetMemberlist = new ArrayList<>();
    List<Tag> targetTaglist = new ArrayList<>();

    for (Follow follow : followList) {
      System.out.println(follow.getNo());
      System.out.println(follow.getFollowedType());

      if(follow.getFollowedType() == 1) {
        targetMemberlist.add(follow.getTargetMember());
      } else {
        targetTaglist.add(follow.getTargetTag());
      }
    }
    for (Tag t : targetTaglist) {
      System.out.println(t.getNo());
    }

    model.addAttribute("targetMemberlist", targetMemberlist);
    model.addAttribute("targetTaglist", tagService.getThumbnailStillCut(targetTaglist));
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
