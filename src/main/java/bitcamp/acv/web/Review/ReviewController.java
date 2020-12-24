package bitcamp.acv.web.Review;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import bitcamp.acv.domain.Member;
import bitcamp.acv.domain.Review;
import bitcamp.acv.domain.Tag;
import bitcamp.acv.service.ReviewService;
import bitcamp.acv.service.TagService;

@Controller
@RequestMapping("/review")
public class ReviewController {

  @Autowired ReviewService reviewService;
  @Autowired TagService tagService;
  @Autowired ServletContext servletContext;


  @RequestMapping("bestReviewSearch")
  public ModelAndView detail(String keyword) throws Exception {
    List<Review> reviewList = reviewService.listByKeywordTagTitle(keyword);

    ModelAndView mv = new ModelAndView();
    mv.addObject("reviewList", reviewList);
    mv.setViewName("review/bestReviewSearch");
    return mv;
  }

  @RequestMapping("mainFeed")
  public ModelAndView mainFeed(HttpSession session) throws Exception {
    Member loginUser = (Member) session.getAttribute("loginUser");
    Map<String, Object> map = new HashMap<>();
    map.put("userNo", loginUser.getNo());
    map.put("row", 0);

    List<Review> list = reviewService.getMainFeed(map);
    Map<Integer, String> times = new HashMap<>();
    for (Review review : list) {

      Calendar cal = new GregorianCalendar(Locale.KOREA);
      long now = cal.getTimeInMillis();
      long diff = now - review.getRegisteredDate().getTime();
      System.out.println(review.getRegisteredDate());
      if (diff / 1000 / 60 < 1) {
        times.put(review.getNo(), "방금 전");
      } else if (diff / 1000 / 60 / 60 < 1) {
        times.put(review.getNo(), diff / 1000 / 60 + "분 전");
      } else if (diff/ 1000 / 60 / 60 / 24 < 1) {
        times.put(review.getNo(), diff/ 1000 / 60 / 60 + "시간 전");
      } else if (diff/ 1000 / 60 / 60 / 24 / 7 < 1) {
        times.put(review.getNo(), diff/ 1000 / 60 / 60 / 24 + "일 전");
      } else if (diff/ 1000 / 60 / 60 / 24 / 7 / 30 < 1) {
        times.put(review.getNo(), diff/ 1000 / 60 / 60 / 24 / 7 + "주 전");
      } else if (diff/ 1000 / 60 / 60 / 24 / 365 < 1) {
        times.put(review.getNo(), Calendar.MONTH - review.getRegisteredDate().getMonth() + "달 전");
      } else {
        times.put(review.getNo(), Calendar.YEAR - review.getRegisteredDate().getYear() + "년 전");
      }
    }

    ModelAndView mv = new ModelAndView();
    mv.addObject("times", times);
    mv.addObject("loginUser", loginUser);
    mv.addObject("list", list);

    mv.setViewName("review/mainFeed");
    return mv;
  }
}
