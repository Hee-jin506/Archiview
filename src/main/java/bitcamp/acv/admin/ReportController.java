package bitcamp.acv.admin;

import java.beans.PropertyEditorSupport;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import bitcamp.acv.domain.Comment;
import bitcamp.acv.domain.Member;
import bitcamp.acv.domain.Report;
import bitcamp.acv.domain.Review;
import bitcamp.acv.domain.Tag;
import bitcamp.acv.service.CommentService;
import bitcamp.acv.service.MemberService;
import bitcamp.acv.service.ReportService;
import bitcamp.acv.service.ReviewService;
import bitcamp.acv.service.TagService;

@Controller
@RequestMapping("/report")
public class ReportController {

  @Autowired ReportService reportService;
  @Autowired MemberService memberService;
  @Autowired ReviewService reviewService;
  @Autowired CommentService commentService;
  @Autowired TagService tagService;

  @RequestMapping("form")
  public ModelAndView form(int no) throws Exception {
    ModelAndView mv = new ModelAndView();
    mv.addObject("target", memberService.get(no));
    mv.setViewName("report/form");
    return mv;
  }

  @RequestMapping("add")
  public String add(Report report, HttpSession session) throws Exception {
    Member loginUser = (Member) session.getAttribute("loginUser");
    report.setReportingMember(loginUser);
    reportService.add(report);
    return "redirect:list";
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
