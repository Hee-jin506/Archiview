package bitcamp.acv.web.ajax;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import bitcamp.acv.domain.Report;
import bitcamp.acv.service.CommentService;
import bitcamp.acv.service.MemberService;
import bitcamp.acv.service.MovieService;
import bitcamp.acv.service.ReportService;
import bitcamp.acv.service.ReviewService;
import bitcamp.acv.service.TagService;

@Controller("ajax.ReportController")
@RequestMapping("ajax/report")
@SessionAttributes("loginUser")
public class ReportController {

  @Autowired MovieService movieService;
  @Autowired ReportService reportService;
  @Autowired MemberService memberService;
  @Autowired ReviewService reviewService;
  @Autowired CommentService commentService;
  @Autowired TagService tagService;


  @GetMapping("form")
  public void form(Model model, int reportedNo, HttpServletRequest request) throws Exception {

    // 사이드바
    model.addAttribute("topMembers", memberService.listByPop3());
    model.addAttribute("topMovies", movieService.listByPop3());
    model.addAttribute("topTags", tagService.listByPop3());

    Report report = new Report();
    report.setReportedNo(reportedNo);
    request.setAttribute("report", report);
  }
}
