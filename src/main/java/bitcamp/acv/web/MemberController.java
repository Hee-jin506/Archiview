package bitcamp.acv.web;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import bitcamp.acv.domain.Follow;
import bitcamp.acv.domain.Member;
import bitcamp.acv.domain.Review;
import bitcamp.acv.domain.Tag;
import bitcamp.acv.service.FollowService;
import bitcamp.acv.service.MemberService;
import bitcamp.acv.service.MovieService;
import bitcamp.acv.service.TagService;

@Controller
@RequestMapping("/member")
public class MemberController {


  @Autowired MemberService memberService;
  @Autowired TagService tagService;
  @Autowired MovieService movieService;
  @Autowired FollowService followService;
  @Autowired ServletContext servletContext;

  @RequestMapping("active")
  public String active(int no) throws Exception {
    return "redirect:list";
  }
  
  @RequestMapping("inactive")
  public String inactive(int no) throws Exception {
    return "redirect:list";
  }

  @RequestMapping("delete")
  public ModelAndView delete(String password, HttpServletRequest request)
      throws Exception {

    ModelAndView mv = new ModelAndView();
    HttpSession session = request.getSession();
    boolean wrongInput = false;

    if (request.getMethod().equals("GET")) {
      Member member = (Member) session.getAttribute("loginUser");

      if (member == null) {
        throw new Exception("로그인 되어있지 않습니다.");
      } else {
        mv.addObject("wrongInput", wrongInput);
        mv.setViewName("member/withdrawForm");
        return mv;
      }
    }

    String inputPassword = request.getParameter("password");
    Member member = (Member) session.getAttribute("loginUser");

    String email = member.getEmail();

    Member m = memberService.get(email, inputPassword);

    if (m == null) {
      wrongInput = true;
      mv.addObject("wrongInput", wrongInput);
      mv.setViewName("member/withdrawForm");
    } else {
      memberService.delete(m.getNo());
      mv.setViewName("redirect:/app/auth/login");
    }
    return mv;
  }

  @RequestMapping("detail")
  public void detail(int no, Model model) throws Exception {
    model.addAttribute("member", memberService.get(no));
  }

  @RequestMapping("list")
  public void list(Model model, String keyword) throws Exception {
    List<Member> list = memberService.list(keyword);
    List<Follow> follows = followService.list();

    Follow[] myFollow = new Follow[follows.size()];
    for (int i = 0; i < myFollow.length; i++) {
      myFollow[i] = follows.get(i);
    }

    // 사이드바
    model.addAttribute("topMembers", memberService.listByPop3());
    model.addAttribute("topMovies", movieService.listByPop3());
    model.addAttribute("topTags", tagService.listByPop3());

    model.addAttribute("follows", follows);
    model.addAttribute("list", list);
  }

  @RequestMapping("search")
  public ModelAndView search(String keyword) throws Exception {
    List<Member> memberList = memberService.listByKeywordNickName(keyword);
    ModelAndView mv = new ModelAndView();
    mv.addObject("memberList", memberList);
    mv.setViewName("member/memberSearch");
    return mv;
  }

  @RequestMapping("update")
  public String update(Member member) throws Exception {
    memberService.update(member);
    return "redirect:list";
  }
  
  
  //프로필 화면(프로필 + 본인이 작성한 리뷰들이 나옴)
   @RequestMapping("profile")
   public void profile(int no, HttpSession session, Model model) throws Exception {
     // 탑바
     Member loginUser = (Member) session.getAttribute("loginUser");
     model.addAttribute("loginUser", loginUser);
  
     // 사이드바
     model.addAttribute("topMembers", memberService.listByPop3());
     model.addAttribute("topMovies", movieService.listByPop3());
     model.addAttribute("topTags", tagService.listByPop3());
  
     // 바디
     model.addAttribute("member", memberService.get(no));
     System.out.println(memberService.get(no));
     model.addAttribute("followerListSize",followService.listMyFollowerList(no).size());
     model.addAttribute("followingListSize",followService.listMyFollowingList(no).size());
     model.addAttribute("isFollowedByLoginUser", isFollowedByLoginUser(loginUser.getNo(), no));
   }
  
   // 프로필 화면(프로필 + 본인이 저장한! 리뷰들이 나옴)
   @RequestMapping("savedReviews")
   public void savedReviews(Model model, HttpSession session, int no) throws Exception {
     // 탑바
     Member loginUser = (Member) session.getAttribute("loginUser");
     model.addAttribute("loginUser", loginUser);
  
     // 사이드바
     model.addAttribute("topMembers", memberService.listByPop3());
     model.addAttribute("topMovies", movieService.listByPop3());
     model.addAttribute("topTags", tagService.listByPop3());
  
     // 바디
     model.addAttribute("member", memberService.get(no));
     model.addAttribute("followerListSize",followService.listMyFollowerList(no).size());
     model.addAttribute("followingListSize",followService.listMyFollowingList(no).size());
     model.addAttribute("isFollowedByLoginUser", isFollowedByLoginUser(loginUser.getNo(), no));
   }
   
   
  // 멤버가 loginUser에게 팔로우 당하고있는지 검사
  private boolean isFollowedByLoginUser(int loginUserNo, int memberNo) throws Exception {
    List<Follow> followings = followService.listMyFollowingList(loginUserNo);
    List<Integer> followingNoList = new ArrayList<>();
    for (Follow f : followings) {
      if (f.getFollowedType() == 1) {
        followingNoList.add(f.getTargetMember().getNo());
      }
    }
    if (followingNoList.contains(memberNo)) {
      return true;
    }
    return false;
  }
}