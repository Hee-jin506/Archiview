package bitcamp.acv.web.member;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import bitcamp.acv.domain.Follow;
import bitcamp.acv.domain.Member;
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
    if (memberService.active(no) == 0) {
      throw new Exception("해당 회원이 존재하지 않습니다.");
    }
    return "redirect:list";
  }
  
  @RequestMapping("inactive")
  public String inactive(int no) throws Exception {
    if (memberService.inactive(no) == 0) {
      throw new Exception("해당 번호의 회원이 없습니다.");
    } else {
      return "redirect:list";
    }
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
  public ModelAndView detail(int no) throws Exception {

    Member member = memberService.get(no);

    if (member == null) {
      throw new Exception("해당 회원이 없습니다.");
    }

    ModelAndView mv = new ModelAndView();
    mv.addObject("member", member);
    mv.setViewName("member/detail");
    return mv;
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

  @RequestMapping("multipleDelete")
  public String multipleDelete(String[] members, HttpServletResponse response)
      throws Exception {
    int count = 0;
    if (members != null) {
      for (String memberNo : members) {
        count += memberService.inactive(Integer.parseInt(memberNo));
      }
    }

    if (count == 0) {
      throw new Exception("<p>해당 회원이 존재하지 않습니다.</p>\n");
    } else {
      return "redirect:list";
    }
  }

  @RequestMapping("multipleActive")
  protected String multipleActive(String[] members, HttpServletResponse response)
      throws Exception {
    int count = 0;
    if (members != null) {
      for (String memberNo : members) {
        count += memberService.active(Integer.parseInt(memberNo));
      }
    }

    if (count == 0) {
      throw new Exception("해당 번호의 회원이 없습니다.");
    } else {
      return "redirect:list";
    }
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

  //특정멤버의 팔로잉 리스트
  @GetMapping("followingList")
  public void followingList(HttpSession session, int no, Model model) throws Exception {
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
 
    // 특정 멤버가 팔로우한 리스트
    List<Follow> followings = followService.listMyFollowingList(no);
    // 로그인유저의 팔로잉 리스트
    List<Follow> followingsOfLoginUser = followService.listMyFollowingList(loginUser.getNo());
    List<Integer> followingMembersOfLoginUserNoList = new ArrayList<>();
    List<Integer> followingTagsOfLoginUserNoList = new ArrayList<>();
    
    List<Member> targetMemberlist = new ArrayList<>();
    List<Tag> targetTaglist = new ArrayList<>();
 
    for (Follow f : followingsOfLoginUser) {
      if (f.getFollowedType() == 1) {
        followingMembersOfLoginUserNoList.add(f.getTargetMember().getNo());
      } else {
        followingTagsOfLoginUserNoList.add(f.getTargetTag().getNo());
      }
    }
    
    for (Follow follow : followings) {
      if(follow.getFollowedType() == 1) {
        if(followingMembersOfLoginUserNoList.contains(follow.getTargetMember().getNo())) {
          // true면 버튼 색깔 회색
          follow.getTargetMember().setFollowingState(true);
        }
        targetMemberlist.add(follow.getTargetMember());
      } else {
        if(followingTagsOfLoginUserNoList.contains(follow.getTargetTag().getNo())) {
          // true면 버튼 색깔 회색
          follow.getTargetTag().setFollowingState(true);
        }
        targetTaglist.add(follow.getTargetTag());
      }
    }
    model.addAttribute("targetMemberlist", targetMemberlist);
    model.addAttribute("targetTaglist", tagService.getThumbnailStillCut(targetTaglist));
  }
  
  
 
  // 특정멤버의 팔로워 리스트
  @GetMapping("followerList")
  public void followerList(HttpSession session, int no, Model model) throws Exception {
 
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
    
    // 특정멤버의 팔로워리스트
    List<Follow> followers = followService.listMyFollowerList(no);
    // 로그인유저의 팔로잉리스트
    List<Follow> followingsOfLoginUser = followService.listMyFollowingList(loginUser.getNo());
    List<Integer> followingsOfLoginUserNoList = new ArrayList<>();
 
    List<Member> targetMemberlist = new ArrayList<>();
    
    for (Follow f : followingsOfLoginUser) {
      if (f.getFollowedType() == 1) {
        followingsOfLoginUserNoList.add(f.getTargetMember().getNo());
      }
    }
 
    for (Follow follow : followers) {
      if(follow.getFollowedType() == 1) {
        if(followingsOfLoginUserNoList.contains(follow.getTargetMember().getNo())) {
          // true면 버튼 색깔 회색
          follow.getTargetMember().setFollowingState(true);
        }
        targetMemberlist.add(follow.getTargetMember());
      }
    }
    
    model.addAttribute("targetMemberlist", targetMemberlist);
  }
  
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