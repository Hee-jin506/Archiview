package bitcamp.acv.web.follow;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import bitcamp.acv.domain.Follow;
import bitcamp.acv.domain.Member;
import bitcamp.acv.domain.Tag;
import bitcamp.acv.service.FollowService;
import bitcamp.acv.service.MemberService;
import bitcamp.acv.service.TagService;


@Controller
@RequestMapping("/follow")
public class FollowController {

  @Autowired MemberService memberService;
  @Autowired FollowService followService;
  @Autowired TagService tagService;

  // 유저 팔로우
  @RequestMapping("addUser")
  public String addUser(
      HttpSession session,
      HttpServletRequest request)
          throws Exception {

    // 새로운 팔로우 객체 생성
    Follow follow = new Follow();

    // 현재 로그인 멤버
    follow.setFollowingMember(((Member)session.getAttribute("loginUser")));

    // 타입에 MEMBER = 1 일경우
    // 현재 전체 멤버 리스트를 가져온다.
    List<Member> memberList = memberService.list(null);
    if (follow.getFollowedType() == Follow.MEMBER) {
      System.out.println(memberList);
    }

    followService.addUser(follow);
    return "redirect:list";
  }

  @RequestMapping("active")
  public String active(int no) throws Exception {
    if (followService.active(no) == 0) {
      throw new Exception("해당 회원이 존재하지 않습니다.");
    }
    return "redirect:list";
  }

  @RequestMapping("inactive")
  public String inactive(int no) throws Exception {
    if (followService.inactive(no) == 0) {
      throw new Exception("해당 번호의 회원이 없습니다.");
    } else {
      return "redirect:list";
    }
  }

  // 팔로우 리스트
  @RequestMapping("list")
  protected ModelAndView list() throws Exception {
    List<Follow> list = followService.list();
    ModelAndView mv = new ModelAndView();
    mv.addObject("list", list);
    mv.setViewName("/follow/list.jsp");
    return mv;
  }

  // 팔로우 상세
  @RequestMapping("detail")
  protected ModelAndView view(int no,
      Member member,
      Tag tag) throws Exception {

    Follow follow = followService.get(no);
    ModelAndView mv = new ModelAndView();

    // targer .jsp 불러오기
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