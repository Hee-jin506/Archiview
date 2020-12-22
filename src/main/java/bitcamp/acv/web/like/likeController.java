package bitcamp.acv.web.like;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import bitcamp.acv.domain.Like;
import bitcamp.acv.service.LikeService;

@Controller
@RequestMapping("/like")
public class likeController {

  @Autowired LikeService likeService;

  // 사용자 화면
  @RequestMapping("list")
  protected ModelAndView view(
      HttpServletRequest request,
      HttpSession session
      ) throws Exception {

    Map<String, Object> map = new HashMap<>();
    List<Like> likes = likeService.getTime(map);
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

    ModelAndView mv = new ModelAndView();
    mv.addObject("times", times);
    mv.addObject("list", list);

    mv.setViewName("/like/list.jsp");
    return mv;
  }

}
