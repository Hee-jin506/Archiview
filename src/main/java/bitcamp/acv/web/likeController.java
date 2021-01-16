package bitcamp.acv.web;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import bitcamp.acv.domain.Like;
import bitcamp.acv.domain.Member;
import bitcamp.acv.service.CommentService;
import bitcamp.acv.service.LikeService;
import bitcamp.acv.service.MemberService;
import bitcamp.acv.service.ReviewService;

@Controller
@RequestMapping("/like")
@SessionAttributes("loginUser")
public class likeController {

  @Autowired LikeService likeService;
  @Autowired ReviewService reviewService;
  @Autowired CommentService commentService;
  @Autowired MemberService memberService;

  // 리뷰 좋아요
  @GetMapping("likeReview")
  public String likeReview(Like like,
      @ModelAttribute("loginUser") Member loginUser,
      HttpServletRequest request
      ) throws Exception {
    
    like.setLikingMember(loginUser);
    likeService.addReview(like);

    String referer = request.getHeader("REFERER");
    String[] r = referer.split("app");
    return "redirect:.." + r[1];
  }

  @GetMapping("dislikeReview")
  public String dislikeReview(Like like,
      @ModelAttribute("loginUser") Member loginUser,
      HttpServletRequest request
      ) throws Exception {
    
    like.setLikingMember(loginUser);
    likeService.deleteReview(like);

    String referer = request.getHeader("REFERER");
    String[] r = referer.split("app");
    return "redirect:.." + r[1];
  }

  // 코멘트 좋아요

  @GetMapping("likeComment")
  public String addComment(Like like,
      @ModelAttribute("loginUser") Member loginUser,
      HttpServletRequest request
      ) throws Exception {
    
    like.setLikingMember(loginUser);
    likeService.addComment(like);

    String referer = request.getHeader("REFERER");
    String[] r = referer.split("app");
    return "redirect:.." + r[1];
  }

  @GetMapping("dislikeComment")
  public String deleteComment(Like like,
      @ModelAttribute("loginUser") Member loginUser,
      HttpServletRequest request
      ) throws Exception {
    
    like.setLikingMember(loginUser);
    likeService.deleteComment(like);

    String referer = request.getHeader("REFERER");
    String[] r = referer.split("app");
    return "redirect:.." + r[1];
  }

}
