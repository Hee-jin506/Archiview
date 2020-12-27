package bitcamp.acv.web.like;

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
      @ModelAttribute("loginUser") Member loginUser
      ) throws Exception {
    like.setLikingMember(loginUser);
    like.setLikedNo(like.getLikedNo());


    likeService.addReview(like);
    return "redirect:../main";
  }

  @GetMapping("dislikeReview")
  public String dislikeReview(Like like,
      @ModelAttribute("loginUser") Member loginUser) throws Exception {
    like.setLikingMember(loginUser);

    likeService.deleteReview(like);
    return "redirect:../main";
  }

  // 코멘트 좋아요

  @GetMapping("addComment")
  public String addComment(Like like,
      @ModelAttribute("loginUser") Member loginUser
      ) throws Exception {
    like.setLikingMember(loginUser);

    likeService.addComment(like);
    return "redirect:../main";
  }

  @GetMapping("deleteComment")
  public String deleteComment(Like like,
      @ModelAttribute("loginUser") Member loginUser) throws Exception {
    like.setLikingMember(loginUser);

    likeService.deleteComment(like);
    return "redirect:../main";
  }

  //  @PostMapping("active")
  //  public String active(int no) throws Exception {
  //    if (likeService.active(no) == 0) {
  //      throw new Exception("해당 글이 존재하지 않습니다.");
  //    }
  //    return "redirect:newsfeed";
  //  }
  //
  //  @PostMapping("inactive")
  //  public String inactive(int no) throws Exception {
  //    if (likeService.inactive(no) == 0) {
  //      throw new Exception("해당 글이 존재하지 않습니다.");
  //    } else {
  //      return "redirect:newsfeed";
  //    }
  //  }



}
