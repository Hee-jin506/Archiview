package bitcamp.acv.web.report;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.List;
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
    ReportService reportService = (ReportService) ctx.getAttribute("reportService");

    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head>");
    out.println("<title>[신고 등록]</title></head>");
    out.println("<body>");

    try {
      out.println("<h1>[신고 등록]</h1>");

      Report report = new Report();
      out.println("<form action='add' method='post'>");
      out.printf("<input type='hidden' name='rno' value='%d'>\n",
          report.getNo());

      // target 수정 중
      out.println("신고 대상: 수정수정수정<br>");

      out.print("신고 유형: \n");

      List<Report> typeList = reportService.findAll();
      for (Report r : typeList) {
        String type = null;
        switch (r.getReportedType()) {
          case 1 :
            type = "회원";
            break;
          case 2:
            type = "게시물";
            break;
          case 3:
            type = "댓글";
            break;
          default:
            type = "태그";
        }

        out.printf("<input type='radio' name='reportedType' value='%d'>%s\n",
            r.getReportedType(), type);
      }

      out.println("<br>");

      out.println("신고 사유: \n");
      out.println("<select name='status'>");
      out.println("  <option value='1'>음란성/선정성</option>");
      out.println("  <option value='2'>폭력성</option>");
      out.println("  <option value='3'>혐오/인신공격</option>");
      out.println("  <option value='4'>광고성/스팸</option>");
      out.println("  <option value='5'>개인정보 노출</option>");
      out.println("  <option value='6'>도배</option>");
      out.println("</select><br>");

      out.println("<br>");

      out.println("<button>등록</button>");
      out.println("</form>");

    } catch (Exception e) {
      out.println("<h2>작업 처리 중 오류 발생!</h2>");
      out.printf("<pre>%s</pre>\n", e.getMessage());

      StringWriter errOut = new StringWriter();
      e.printStackTrace(new PrintWriter(errOut));
      out.println("<h3>상세 오류 내용</h3>");
      out.printf("<pre>%s</pre>\n", errOut.toString());
    }

    out.println("</body>");
    out.println("</html>");
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
      // 유형이 자꾸 에러남


      reportService.add(report);
      // response.sendRedirect("list");

    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error").forward(request, response);
      return;
    }
  }
}
