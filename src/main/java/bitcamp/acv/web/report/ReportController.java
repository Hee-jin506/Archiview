package bitcamp.acv.web.report;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import bitcamp.acv.domain.Comment;
import bitcamp.acv.domain.Member;
import bitcamp.acv.domain.Report;
import bitcamp.acv.domain.Review;
import bitcamp.acv.domain.Tag;
import bitcamp.acv.service.ReportService;

@Controller
@RequestMapping("/report")
public class ReportController {

  @Autowired ReportService reportService;

  @RequestMapping("list")
  protected ModelAndView list(String keyword) throws Exception {
    List<Report> list = reportService.list(keyword);
    ModelAndView mv = new ModelAndView();
    mv.addObject("list", list);
    mv.setViewName("/report/list.jsp");
    return mv;
  }

  @RequestMapping("detail")
  protected ModelAndView detail(int no) throws Exception {

    Report report = reportService.get(no);
    if (report == null) {
      throw new Exception("해당 신고 번호가 없습니다.");
    } else {

      ModelAndView mv = new ModelAndView();

      // targer .jsp 불러오기
      Object target = reportService.getTarget(report);
      if (target instanceof Member) {
        mv.addObject("member", target);
        mv.setViewName("memberTarget.jsp");
      } else if (target instanceof Review) {
        mv.addObject("review", target);
        mv.setViewName("reviewTarget.jsp");
      }  else if (target instanceof Tag) {
        mv.addObject("tag", target);
        mv.setViewName("tagTarget.jsp");
      } else if (target instanceof Comment) {
        mv.addObject("comment", target);
        mv.setViewName("commentTarget.jsp");
      } else {
        throw new Exception("신고 상세정보 처리 중 오류 발생!");
      }

      mv.addObject("report", report);
      mv.setViewName("/report/detail.jsp");
      return mv;
    }
  }
}
