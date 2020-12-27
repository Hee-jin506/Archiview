package bitcamp.acv.web.main;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import bitcamp.acv.domain.Comment;
import bitcamp.acv.domain.Follow;
import bitcamp.acv.domain.Like;
import bitcamp.acv.domain.Member;
import bitcamp.acv.domain.Review;
import bitcamp.acv.service.CommentService;
import bitcamp.acv.service.FollowService;
import bitcamp.acv.service.LikeService;
import bitcamp.acv.service.MemberService;
import bitcamp.acv.service.MovieService;
import bitcamp.acv.service.ReviewService;
import bitcamp.acv.service.TagService;

@Controller
@RequestMapping("/main")
@SessionAttributes("loginUser")
public class MainNewsFeadController {

  @Autowired LikeService likeService;
  @Autowired ReviewService reviewService;
  @Autowired CommentService commentService;
  @Autowired MemberService memberService;
  @Autowired MovieService movieService;
  @Autowired TagService tagService;
  @Autowired FollowService followService;

  // 사용자 화면
  @RequestMapping("newsfeed")
  protected ModelAndView view(
      HttpServletRequest request,
      HttpSession session,
      String keyword,
      Model model
      ) throws Exception {

    Member loginUser = (Member) session.getAttribute("loginUser");
    ModelAndView mv = new ModelAndView();

    // 사이드바
    model.addAttribute("topMembers", memberService.listByPop3());
    model.addAttribute("topMovies", movieService.listByPop3());
    model.addAttribute("topTags", tagService.listByPop3());

    // 메인피드
    Map<String, Object> map = new HashMap<>();
    map.put("userNo", loginUser.getNo());
    map.put("row", 0);
    model.addAttribute("list", reviewService.getMainFeed(map));

    Map<String, Object> likeMap = new HashMap<>();
    List<Like> likes = likeService.getTime(likeMap);
    Map<Integer, String> times = new HashMap<>();
    for (Like like : likes) {

      Calendar cal = new GregorianCalendar(Locale.KOREA);
      long now = cal.getTimeInMillis();
      long diff = now - like.getLikedDate().getTime();
      if (diff / 1000 / 60 < 1) {
        times.put(like.getNo(), "방금 전");
      } else if (diff / 1000 / 60 / 60 < 1) {
        times.put(like.getNo(), diff / 1000 / 60 + "분 전");
      } else if (diff/ 1000 / 60 / 60 / 24 < 1) {
        times.put(like.getNo(), diff/ 1000 / 60 / 60 + "시간 전");
      } else if (diff/ 1000 / 60 / 60 / 24 / 7 < 1) {
        times.put(like.getNo(), diff/ 1000 / 60 / 60 / 24 + "일 전");
      } else if (diff/ 1000 / 60 / 60 / 24 / 7 / 30 < 1) {
        times.put(like.getNo(), diff/ 1000 / 60 / 60 / 24 / 7 + "주 전");
      } else if (diff/ 1000 / 60 / 60 / 24 / 365 < 1) {
        times.put(like.getNo(), Calendar.MONTH - like.getLikedDate().getMonth() + "달 전");
      } else {
        times.put(like.getNo(), Calendar.YEAR - like.getLikedDate().getYear() + "년 전");
      }
    }

    List<Like> list = likeService.list();
    List<Review> reviews = reviewService.getByMemberNo(loginUser.getNo());
    mv.addObject("reviews", reviews);


    List<Comment> comments = commentService.getByMemberNo(loginUser.getNo());

    mv.addObject("comments", comments);


    List<Follow> follows = followService.list3(loginUser.getNo());

    mv.addObject("times", times);
    mv.addObject("list", list);
    mv.addObject("follows", follows);

    mv.setViewName("main/newsfeed");
    return mv;
  }
}
