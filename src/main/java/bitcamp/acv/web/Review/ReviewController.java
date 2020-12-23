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

  @RequestMapping("active")
  public String active(int no) throws Exception {
    if (reviewService.active(no) == 0) {
      throw new Exception("해당 리뷰가 존재하지 않습니다.");
    }
    return "redirect:list";
  }

  @RequestMapping("multipleActive")
  public String multipleActive(String[] reviews, HttpServletResponse response)
      throws Exception {
    int count = 0;
    if (reviews != null) {
      for (String tagNo : reviews) {
        count += reviewService.active(Integer.parseInt(tagNo));
      }
    }

    if (count == 0) {
      throw new Exception("해당 리뷰가 존재하지 않습니다.\n");
    } else {
      return "redirect:list";
    }
  }

  @RequestMapping("delete")
  public String inactive(int no) throws Exception {
    if (reviewService.delete(no) == 0) {
      throw new Exception("해당 리뷰가 없습니다.");
    } else {
      return "redirect:list";
    }
  }

  @RequestMapping("multipleDelete")
  public String multipleDelete(String[] reviews, HttpServletResponse response)
      throws Exception {
    int count = 0;
    if (reviews != null) {
      for (String reviewNo : reviews) {
        count += reviewService.delete(Integer.parseInt(reviewNo));
      }
    }

    if (count == 0) {
      throw new Exception("해당 리뷰가 존재하지 않습니다\n");
    } else {
      return "redirect:list";
    }
  }



  @RequestMapping("detail")
  public ModelAndView detail(int no) throws Exception {

    Review review = reviewService.get(no);
    if (review == null) {
      throw new Exception("해당 리뷰가 없습니다.");
    }
    List<Tag> tags = tagService.listByReview(review.getNo());

    ModelAndView mv = new ModelAndView();
    mv.addObject("review", review);
    mv.addObject("tags", tags);
    mv.setViewName("review/detail");
    return mv;
  }

  @RequestMapping("bestReviewSearch")
  public ModelAndView detail(String keyword) throws Exception {
    List<Review> reviewList = reviewService.listByKeywordTagTitle(keyword);

    ModelAndView mv = new ModelAndView();
    mv.addObject("reviewList", reviewList);
    mv.setViewName("review/bestReviewSearch");
    return mv;
  }

  @GetMapping("list")
  public ModelAndView list(
      String keyword,
      String no,
      String writer,
      String movie
      ) throws Exception {
    ModelAndView mv = new ModelAndView();

    if (keyword != null) {
      HashMap<String,Object> keyMap = new HashMap<>();
      keyMap.put("keyword", keyword);
      keyMap.put("no", no);
      keyMap.put("writer", writer);
      keyMap.put("movie", movie);

      mv.addObject("list", reviewService.listBasicFilter(keyMap));
    } else {
      mv.addObject("list", reviewService.list());
    }

    // jsp에 넘겨줄 값들
    Map<String,Object> chartSizeMap = new HashMap<>();
    reviewService.getSizeInfo(chartSizeMap);
    reviewService.getChartInfo(chartSizeMap);

    mv.addObject("chartSizeMap", chartSizeMap);
    mv.setViewName("review/list");
    return mv;
  }

  @PostMapping("list")
  public ModelAndView list(
      String keywordNumber,
      String keywordWriterName,
      String keywordMovieTitle,
      String registeredDate,
      String startDate,
      String endDate,
      String startNumber,
      String endNumber,
      String active,
      String inactive
      ) throws Exception {
    ModelAndView mv = new ModelAndView();

    if (keywordNumber != null) {
      HashMap<String,Object> keywordMap = new HashMap<>();
      keywordMap.put("number", keywordNumber);
      keywordMap.put("writerName", keywordWriterName);
      keywordMap.put("movieTitle", keywordMovieTitle);
      keywordMap.put("startNumber", startNumber);
      keywordMap.put("endNumber", endNumber);
      keywordMap.put("active", active);
      keywordMap.put("inactive", inactive);

      if(registeredDate != "") {
        String[] s = registeredDate.split("\n");
        java.sql.Date d = java.sql.Date.valueOf(s[0]);

        keywordMap.put("registeredDate", d);
      }
      if(startDate != "") {
        String[] s = startDate.split("\n");
        java.sql.Date d = java.sql.Date.valueOf(s[0]);

        keywordMap.put("startDate", d);
      }
      if(endDate != "") {
        String[] s = endDate.split("\n");
        java.sql.Date d = java.sql.Date.valueOf(s[0]);

        keywordMap.put("endDate", d);
      }
      mv.addObject("list", reviewService.listDetailFilter(keywordMap));
    }
    else {
      mv.addObject("list", reviewService.list());
    }


    // jsp에 넘겨줄 값들
    Map<String,Object> chartSizeMap = new HashMap<>();
    reviewService.getSizeInfo(chartSizeMap);
    reviewService.getChartInfo(chartSizeMap);

    mv.addObject("chartSizeMap", chartSizeMap);
    mv.setViewName("review/list");
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




















