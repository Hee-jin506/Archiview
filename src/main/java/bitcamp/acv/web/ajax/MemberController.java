package bitcamp.acv.web.ajax;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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

@Controller("ajax.MemberController")
@RequestMapping("ajax/member")
@SessionAttributes("loginUser")
public class MemberController {


  @Autowired MemberService memberService;
  @Autowired TagService tagService;
  @Autowired MovieService movieService;
  @Autowired FollowService followService;
  @Autowired ServletContext servletContext;

  @RequestMapping("ajaxMyReviews")
  public void ajaxMyReviews(int no, Model model) throws Exception {
    model.addAttribute("member", memberService.get(no));
  }
   @RequestMapping("ajaxSavedReviews")
   public void ajaxSavedReviews(int no, Model model) throws Exception {
     model.addAttribute("member", memberService.get(no));
   }
   @RequestMapping("ajaxFollowerList")
   public void ajaxFollowerList(int no, Model model, HttpSession session) throws Exception {
     Member loginUser = (Member) session.getAttribute("loginUser");
     model.addAttribute("loginUser", loginUser);
     
     model.addAttribute("member", memberService.get(no));
     model.addAttribute("targetMemberlist", 
         isFollowedByLoginUser(followService.listMyFollowerList(no), followService.listMyFollowingList(loginUser.getNo()))
           .get("targetMemberList"));

   }
   
  @SuppressWarnings("unchecked")
  @RequestMapping("ajaxFollowingList")
   public void ajaxFollowingList(int no, Model model, HttpSession session) throws Exception {
     Member loginUser = (Member) session.getAttribute("loginUser");
     model.addAttribute("loginUser", loginUser);
     
     model.addAttribute("member", memberService.get(no));
     model.addAttribute("targetMemberlist", 
         isFollowedByLoginUser(followService.listMyFollowingList(no), followService.listMyFollowingList(loginUser.getNo()))
           .get("targetMemberList"));
     model.addAttribute("targetTaglist", 
         tagService.getThumbnailStillCut(
             (List<Tag>) isFollowedByLoginUser(followService.listMyFollowingList(no), followService.listMyFollowingList(loginUser.getNo()))
               .get("targetTagList")));
   }

 
 

  //특정멤버의 팔로잉 리스트
  @SuppressWarnings("unchecked")
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
    
    model.addAttribute("targetMemberlist", 
        isFollowedByLoginUser(followService.listMyFollowingList(no), followService.listMyFollowingList(loginUser.getNo()))
          .get("targetMemberList"));
    model.addAttribute("targetTaglist", 
        tagService.getThumbnailStillCut(
            (List<Tag>) isFollowedByLoginUser(followService.listMyFollowingList(no), followService.listMyFollowingList(loginUser.getNo()))
              .get("targetTagList")));
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
    
    model.addAttribute("targetMemberlist", 
        isFollowedByLoginUser(followService.listMyFollowerList(no), followService.listMyFollowingList(loginUser.getNo()))
          .get("targetMemberList"));
  }
  
  
  
  // 한 멤버가 loginUser에게 팔로우 당하고있는지 검사
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
  
  // 여러 멤버나 태그가 loginUser에게 팔로우 당하고있는지 검사
  private Map<String,List<?>> isFollowedByLoginUser(
      List<Follow> list,
      List<Follow> followingsOfLoginUser) {
    
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
    
    for (Follow follow : list) {
      if(follow.getFollowedType() == 1) {
        if(followingMembersOfLoginUserNoList.contains(follow.getTargetMember().getNo())) {
          // true면 버튼 색깔 회색
          follow.getTargetMember().setFollowingState(true);
        }
        targetMemberlist.add(follow.getTargetMember());
      } else {
        if(follow.getTargetTag() != null && followingTagsOfLoginUserNoList.contains(follow.getTargetTag().getNo())) {
          // true면 버튼 색깔 회색
          follow.getTargetTag().setFollowingState(true);
        }
        targetTaglist.add(follow.getTargetTag());
      }
    }
    
    Map<String, List<?>> targetListMap = new HashMap<String, List<?>>();
    
    targetListMap.put("targetMemberList", targetMemberlist);
    targetListMap.put("targetTagList", targetTaglist);
    
    return targetListMap;
  }
}