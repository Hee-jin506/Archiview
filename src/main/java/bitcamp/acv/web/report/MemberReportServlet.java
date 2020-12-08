package bitcamp.acv.web.report;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import bitcamp.acv.domain.Member;
import bitcamp.acv.domain.Report;
import bitcamp.acv.service.ReportService;

@WebServlet("/report/add")
public class MemberReportServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();

    response.setContentType("text/html;charset=UTF-8");

    try {

      request.getRequestDispatcher("/report/form.jsp").include(request, response);

    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error.jsp").forward(request, response);
    }
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    ReportService reportService = (ReportService) ctx.getAttribute("reportService");

    try {
      // 로그인 회원 정보를 가져온다.
      HttpSession session = request.getSession();
      Member loginUser = (Member) session.getAttribute("loginUser");

      Report report = new Report();
      report.setReportingMember(loginUser);
      report.setReportedType(Integer.parseInt(request.getParameter("reportedType")));
      report.setStatus(request.getParameter("status")); // 신고 처리 상태
      report.setWhy(request.getParameter("why")); // 신고 사유


      reportService.add(report);
      // response.sendRedirect("list");

    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error").forward(request, response);
    }
  }
}
