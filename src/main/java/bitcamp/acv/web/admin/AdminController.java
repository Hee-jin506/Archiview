package bitcamp.acv.web.admin;

import java.sql.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import bitcamp.acv.domain.Review;
import bitcamp.acv.service.CommentService;
import bitcamp.acv.service.MemberService;
import bitcamp.acv.service.ReportService;
import bitcamp.acv.service.ReviewService;
import bitcamp.acv.service.TagService;

@Controller
@RequestMapping("/admin")
public class AdminController {

  @Autowired ReportService reportService;
  @Autowired MemberService memberService;
  @Autowired ReviewService reviewService;
  @Autowired CommentService commentService;
  @Autowired TagService tagService;

  @RequestMapping(value = "main", method = RequestMethod.GET)
  protected void adminMain(String registeredDate, Model model) throws Exception {
    System.out.println("admin.main 실행!");
    HashMap<String,Object> keyMap = new HashMap<>();

    // 총 리뷰 수
    List<Review> chartList = reviewService.list();

    // jsp에 넘겨줄 값들
    Map<String,Object> chartSizeMap = new HashMap<>();
    chartSizeMap.put("all", chartList.size());

    // 오늘날짜 구하기
    Calendar cal = new GregorianCalendar(Locale.KOREA);
    Date today = new Date(cal.getTimeInMillis());
    // System.out.println("오늘날짜 : " + today);

    // 오늘 등록한 게시물 수
    keyMap.remove("registeredDate");
    keyMap.put("registeredDate", today);
    chartList = reviewService.listDetailFilter(keyMap);
    chartSizeMap.put("today", chartList.size());

    model.addAttribute("chartSizeMap", chartSizeMap);
  }
}
