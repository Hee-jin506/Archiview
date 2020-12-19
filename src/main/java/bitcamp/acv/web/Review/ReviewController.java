package bitcamp.acv.web.Review;

import java.sql.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
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
  protected String multipleActive(String[] reviews, HttpServletResponse response)
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
  protected String inactive(int no) throws Exception {
    if (reviewService.delete(no) == 0) {
      throw new Exception("해당 리뷰가 없습니다.");
    } else {
      return "redirect:list";
    }
  }

  @RequestMapping("multipleDelete")
  protected String multipleDelete(String[] reviews, HttpServletResponse response)
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
  protected ModelAndView detail(int no) throws Exception {

    Review review = reviewService.get(no);
    if (review == null) {
      throw new Exception("해당 리뷰가 없습니다.");
    }
    List<Tag> tags = tagService.listByReview(review.getNo());

    ModelAndView mv = new ModelAndView();
    mv.addObject("review", review);
    mv.addObject("tags", tags);
    mv.setViewName("/review/detail.jsp");
    return mv;
  }

  @RequestMapping("bestReviewSearch")
  protected ModelAndView detail(String keyword) throws Exception {
    List<Review> reviewList = reviewService.listByKeywordTagTitle(keyword);

    ModelAndView mv = new ModelAndView();
    mv.addObject("reviewList", reviewList);
    mv.setViewName("/review/bestReviewSearch.jsp");
    return mv;
  }

  @RequestMapping("list")
  protected ModelAndView list(
      // 기본 검색 파라미터
      String keyword,
      String no,
      String writer,
      String movie,
      // 상세 검색 파라미터
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


    // 검색 조건에 맞춰 DB에서 가져올 리스트
    List<Review> list = null;

    if (keyword != null) {
      HashMap<String,Object> keyMap = new HashMap<>();
      keyMap.put("keyword", keyword);
      keyMap.put("no", no);
      keyMap.put("writer", writer);
      keyMap.put("movie", movie);


      list = reviewService.list1(keyMap);

    }

    else if (keywordNumber != null) {
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

      list = reviewService.list(keywordMap);


    }
    else {
      list = reviewService.list();
    }

    // 총 게시물 수
    List<Review> chartList = reviewService.list();

    // jsp에 넘겨줄 값들
    Map<String,Object> chartSizeMap = new HashMap<>();
    chartSizeMap.put("all", chartList.size());

    // 삭제된 게시물 수
    HashMap<String,Object> keyMap = new HashMap<>();
    keyMap.put("status", 0);
    chartList = reviewService.list(keyMap);
    chartSizeMap.put("inactive",chartList.size());

    // 게시중인 게시물 수
    keyMap.put("status", 1);
    chartList = reviewService.list(keyMap);
    chartSizeMap.put("active",chartList.size());

    // 오늘날짜 구하기
    Calendar cal = new GregorianCalendar(Locale.KOREA);
    Date today = new Date(cal.getTimeInMillis());
    //      System.out.println("오늘날짜 : " + today);

    // 어제날짜 구하기
    cal.setTime(today);
    cal.add(Calendar.DATE, -1);
    Date yesterday = new Date(cal.getTimeInMillis());
    //      System.out.println("어제날짜 : " + yesterday);

    // 이번주의 시작(일요일) 날짜 구하기
    cal.setTime(today);
    cal.add(Calendar.DATE, 1 - cal.get(Calendar.DAY_OF_WEEK));
    Date firstWeekDay = new Date(cal.getTimeInMillis());
    //      System.out.println("이번주의 첫날(일요일) : " + firstWeekDay);

    // 이번달의 시작(1일) 날짜 구하기
    cal.setTime(today);
    cal.add(Calendar.DATE, 1-cal.get(Calendar.DAY_OF_MONTH));
    Date firstMonthDay = new Date(cal.getTimeInMillis());
    //      System.out.println("이번달의 첫날(1일) : " + firstMonthDay);

    // 어제 등록한 게시물 수
    keyMap.remove("status");
    keyMap.put("registeredDate", yesterday);
    chartList = reviewService.list(keyMap);
    chartSizeMap.put("yesterday",chartList.size());

    // 오늘 등록한 게시물 수
    keyMap.remove("registeredDate");
    keyMap.put("registeredDate", today);
    chartList = reviewService.list(keyMap);
    chartSizeMap.put("today", chartList.size());

    // 이번 주에 등록된 게시물 수
    keyMap.remove("registeredDate");
    keyMap.put("startDate", firstWeekDay);
    keyMap.put("endDate", today);
    chartList = reviewService.list(keyMap);
    chartSizeMap.put("thisWeek",chartList.size());

    // 이번 달에 등록된 게시물 수
    keyMap.put("startDate", firstMonthDay);
    keyMap.put("endDate", today);
    chartList = reviewService.list(keyMap);
    chartSizeMap.put("thisMonth",chartList.size());

    ModelAndView mv = new ModelAndView();
    mv.addObject("chartSizeMap", chartSizeMap);
    mv.addObject("list", list);
    mv.setViewName("/review/list.jsp");
    return mv;
  }
}
