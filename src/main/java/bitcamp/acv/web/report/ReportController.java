package bitcamp.acv.web.report;

import java.beans.PropertyEditorSupport;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import bitcamp.acv.domain.Comment;
import bitcamp.acv.domain.Member;
import bitcamp.acv.domain.Report;
import bitcamp.acv.domain.Review;
import bitcamp.acv.domain.Tag;
import bitcamp.acv.service.CommentService;
import bitcamp.acv.service.MemberService;
import bitcamp.acv.service.MovieService;
import bitcamp.acv.service.ReportService;
import bitcamp.acv.service.ReviewService;
import bitcamp.acv.service.TagService;

@Controller
@RequestMapping("/report")
@SessionAttributes("loginUser")
public class ReportController {

  @Autowired MovieService movieService;
  @Autowired ReportService reportService;
  @Autowired MemberService memberService;
  @Autowired ReviewService reviewService;
  @Autowired CommentService commentService;
  @Autowired TagService tagService;


  @GetMapping("form")
  public void form(Model model, Report report, Member member) throws Exception {

    // 사이드바
    model.addAttribute("topMembers", memberService.listByPop3());
    model.addAttribute("topMovies", movieService.listByPop3());
    model.addAttribute("topTags", tagService.listByPop3());
    report.setReportedNo(member.getNo());
  }

  // 신고
  @RequestMapping("reportUser")
  public String reportUser(Report report,
      Member member,
      int reportedType,
      int reportedNo,
      String why,
      @ModelAttribute("loginUser") Member loginUser,
      Model model) throws Exception {

    // 사이드바
    model.addAttribute("topMembers", memberService.listByPop3());
    model.addAttribute("topMovies", movieService.listByPop3());
    model.addAttribute("topTags", tagService.listByPop3());

    report.getReportedNo();
    report.setReportingMember(loginUser);
    report.setReportedType(reportedType);
    report.setWhy(why);

   reportService.reportUser(report);
    return "redirect:../main";
  }

  @RequestMapping("list")
  protected ModelAndView list(String keyword) throws Exception {
    List<Report> list = reportService.list(keyword);
    ModelAndView mv = new ModelAndView();
    mv.addObject("list", list);
    mv.setViewName("report/list");
    return mv;
  }

  @RequestMapping("detail")
  protected ModelAndView detail(int no,
      Member member,
      Review review,
      Tag tag,
      Comment comment) throws Exception {

    Report report = reportService.get(no);
    ModelAndView mv = new ModelAndView();

    // targer .jsp 불러오기
    Object target = reportService.getTarget(report);

    if (report == null) {
      throw new Exception("해당 신고 번호가 없습니다.");
    } else {
      if (target instanceof Member) {
        mv.addObject("member", target);
        mv.addObject("sidemenu", "memberTarget.jsp");
      } else if (target instanceof Review) {
        mv.addObject("review", target);
        mv.addObject("sidemenu","reviewTarget.jsp");
      }  else if (target instanceof Tag) {
        mv.addObject("tag", target);
        mv.addObject("sidemenu", "tagTarget.jsp");
      } else if (target instanceof Comment) {
        mv.addObject("comment", target);
        mv.addObject("sidemenu", "commentTarget.jsp");
      } else {
        throw new Exception("신고 상세정보 처리 중 오류 발생!");
      }

      mv.addObject("report", report);
      mv.setViewName("report/detail");
      return mv;
    }
  }

  @RequestMapping("update")
  protected String update(Report report) throws Exception {
    reportService.update(report);
    return "redirect:list";
  }

  @InitBinder
  public void initBinder(WebDataBinder binder) {
    // String ===> Date 프로퍼티 에디터 준비
    DatePropertyEditor propEditor = new DatePropertyEditor();

    // WebDataBinder에 프로퍼티 에디터 등록하기
    binder.registerCustomEditor(
        java.util.Date.class, // String을 Date 타입으로 바꾸는 에디터임을 지정한다.
        propEditor // 바꿔주는 일을 하는 프로퍼티 에디터를 등록한다.
        );
  }

  class DatePropertyEditor extends PropertyEditorSupport {
    @Override
    public void setAsText(String text) throws IllegalArgumentException {
      try {
        // 클라이언트가 텍스트로 보낸 날짜 값을 java.sql.Date 객체로 만들어 보관한다.
        setValue(java.sql.Date.valueOf(text));
      } catch (Exception e) {
        throw new IllegalArgumentException(e);
      }
    }
  }
}
