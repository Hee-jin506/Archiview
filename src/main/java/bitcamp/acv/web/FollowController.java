package bitcamp.acv.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.acv.service.MemberService;


@Controller
@RequestMapping("/follow")
public class FollowController {

  @Autowired MemberService memberService;

  //팔로우 요청
  //  @PostMapping("/follow/{id}")
  //  public String follow(@PathVariable String id,
  //      HttpSession session,
  //      Model model) throws Exception {
  //
  //    logger.info("/follow/" + id + " : 팔로우 요청 ");
  //
  //
  //    Object object = session.getAttribute("loginUser");
  //    Member activeUser = (Member) object;
  //     passiveUser = usersService.inquiryOfUserById(id);
  //
  //    Follow follow = new Follow();
  //    follow.setActiveUser(activeUser.getUserNo());
  //    follow.setPassiveUser(passiveUser.getUserNo());
  //
  //    // followService.follow(follow);
  //
  //    return "FollowOK";
  //}
}
