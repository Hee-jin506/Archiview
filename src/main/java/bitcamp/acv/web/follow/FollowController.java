package bitcamp.acv.web.follow;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
  @RequestMapping("addUser/{email}")
  public String addUser(@PathVariable String email,
      int followedType,
      HttpSession session,
      HttpServletRequest request)
      throws Exception {

    // 새로운 팔로우 객체 생성
    Follow follow = new Follow();

    // 현재 유저
    follow.setFollowingMember(((Member)session.getAttribute("loginUser")));

    follow.setFollowedType(Integer.parseInt(request.getParameter("followedType")));
    follow.setFollowedNo((Member)request.setAttribute("name", email);;

    followService.addUser(follow);
    return "redirect:../member/detail?" + request.getHeader("Referer");
  }

  // 유저 언팔로우
  @RequestMapping("deleteUser")
  public String delete(Follow follow, HttpSession session, HttpServletRequest request)
      throws Exception {

    follow.setFollowingMember(((Member)session.getAttribute("loginUser")));

    followService.deleteUser(follow);
    return "redirect:" + request.getHeader("Referer");
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

  // 사용자 팔로잉(내가 팔로잉 하는 사람) 리스트
  @RequestMapping(value = {"/view"}, method = RequestMethod.GET)
  protected ModelAndView view(HttpSession session,
      Follow follow,
      Member member,
      Tag tag) throws Exception {

    // 현재 로그인유저 세션에서 가져오기
    Member loginUser = (Member) session.getAttribute("loginUser");

    Map<String, Object> map = new HashMap<String, Object>();
    map.put("loginUser", loginUser);

    if (follow == null) {
      throw new Exception("해당 회원이 없습니다!");
    }

    ModelAndView mv = new ModelAndView();

    // targer .jsp 불러오기
    Object target = followService.getTarget(follow);

    System.out.println(target instanceof Member);
    System.out.println(target instanceof Tag);

    if (target instanceof Member) {
      mv.addObject("member", target);
      mv.addObject("follower", "memberTarget.jsp");
    } else if (target instanceof Tag) {
      mv.addObject("tag", target);
      mv.addObject("follower", "tagTarget.jsp");
    }

    follow.setFollowingMember(loginUser);
    mv.addObject("follow", follow);
    mv.setViewName("/follow/view.jsp");
    return mv;
  }

  // 팔로우 요청
  //  @PostMapping("/follow/{id}")
  //  public String follow(@PathVariable String id,
  //        HttpSession session,
  //        Model model) throws Exception {
  //
  //      logger.info("/follow/" + id + " : 팔로우 요청 ");
  //
  //
  //      Object object = session.getAttribute("loginUser");
  //      Member activeUser = (Member) object;
  //      passiveUser = usersService.inquiryOfUserById(id);
  //
  //      Follow follow = new Follow();
  //      follow.setActiveUser(activeUser.getUserNo());
  //      follow.setPassiveUser(passiveUser.getUserNo());
  //
  //      // followService.follow(follow);
  //
  //      return "FollowOK";
  //  }
}
