package bitcamp.acv.web.main;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
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
import bitcamp.acv.domain.Follow;
import bitcamp.acv.domain.Like;
import bitcamp.acv.domain.Member;
import bitcamp.acv.domain.NewsFeed;
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

    List<Like> newsFeedLikeList = likeService.list2(loginUser.getNo());
    List<Follow> newsFeedFollowList = followService.list3(loginUser.getNo());
    List<NewsFeed> newsFeedList = new ArrayList<>();

    for(Like l : newsFeedLikeList) {
      NewsFeed n = new NewsFeed();
      if (l.getLikedType() ==1 && l.getRvmno() ==loginUser.getNo() ) {
        n.setNo(l.getLikingMember().getNo());
        n.setNick(l.getLikingMember().getNickName());
        n.setPhoto(l.getLikingMember().getPhoto());
        n.setDate(l.getLikedDate());
        n.setTargetNo(l.getLikedNo());
        n.setTargetType(1); // 게시물
        newsFeedList.add(n);
      } else if (l.getLikedType() == 2 && l.getCmno() == loginUser.getNo()) {
        n.setNo(l.getLikingMember().getNo());
        n.setNick(l.getLikingMember().getNickName());
        n.setPhoto(l.getLikingMember().getPhoto());
        n.setDate(l.getLikedDate());
        n.setTargetNo(l.getLikedNo());
        n.setTargetType(2); // 댓글
        newsFeedList.add(n);
      }
    }

    for(Follow f : newsFeedFollowList) {
      NewsFeed n = new NewsFeed();
      if(f.getFollowedType() == 1) {
        n.setNo(f.getTargetMember().getNo());
        n.setNick(f.getTargetMember().getNickName());
        n.setPhoto(f.getTargetMember().getPhoto());
        n.setDate(f.getFollowedDate());
        n.setTargetNo(f.getTargetMember().getNo());
        n.setTargetType(3); // 멤버
        newsFeedList.add(n);
      }
    }


    class DateCompare implements Comparator<NewsFeed> {

      @Override
      public int compare(NewsFeed arg0, NewsFeed arg1) {
        return arg1.getDate().compareTo(arg0.getDate());
      }
    }

    Collections.sort(newsFeedList, new DateCompare());
    System.out.printf("\n\n===== 정렬 =====\n");
    for (NewsFeed newsfeed : newsFeedList) {
      System.out.println(newsfeed.getNick());
      System.out.println(newsfeed.getPhoto());
      System.out.println(newsfeed.getTargetType());
      System.out.println(newsfeed.getDate());
    }

    mv.addObject(newsFeedList);

    //    List<Like> likes = likeService.getTime(likeMap);
    Map<Integer, String> times = new HashMap<>();
    for (NewsFeed newsFeed : newsFeedList) {

      Calendar cal = new GregorianCalendar(Locale.KOREA);
      long now = cal.getTimeInMillis();
      long diff = now - newsFeed.getDate().getTime();
      if (diff / 1000 / 60 < 1) {
        times.put(newsFeed.getNo(), "방금 전");
      } else if (diff / 1000 / 60 / 60 < 1) {
        times.put(newsFeed.getNo(), diff / 1000 / 60 + "분 전");
      } else if (diff/ 1000 / 60 / 60 / 24 < 1) {
        times.put(newsFeed.getNo(), diff/ 1000 / 60 / 60 + "시간 전");
      } else if (diff/ 1000 / 60 / 60 / 24 / 7 < 1) {
        times.put(newsFeed.getNo(), diff/ 1000 / 60 / 60 / 24 + "일 전");
      } else if (diff/ 1000 / 60 / 60 / 24 / 7 / 30 < 1) {
        times.put(newsFeed.getNo(), diff/ 1000 / 60 / 60 / 24 / 7 + "주 전");
      } else if (diff/ 1000 / 60 / 60 / 24 / 365 < 1) {
        times.put(newsFeed.getNo(), Calendar.MONTH - newsFeed.getDate().getMonth() + "달 전");
      }
    }

    mv.addObject("times", times);
    mv.setViewName("main/newsfeed");
    return mv;
  }
}
