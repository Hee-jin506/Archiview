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

@WebServlet("/member/report")
public class MemberReportServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    ReportService reportService = (ReportService) ctx.getAttribute("reportService");


    // 회원 정보가 들어있는 세션 객체를 얻는다.

    HttpSession session = request.getSession();
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();


    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head>");
    out.println("<title>[회원 신고 등록]</title></head>");
    out.println("<body>");

    try {
      out.println("<h1>[회원 신고 등록]</h1>");

      Member loginUser = (Member) session.getAttribute("loginUser");

      List<Report> list = reportService.findAll();

      out.println("<table border='1'>");
      out.println("<thead><tr>"
          + "<th>신고번호</th>"
          + "<th>신고유형</th>"
          + "<th>신고대상</th>"
          + "<th>신고자</th>"
          + "<th>내용</th>"
          + "<th>신고일</th>"
          + "<th>상태</th>"
          + "</tr></thead>");

      out.println("<tbody>");

      for (Report report : list) {
        out.printf("<tr>"
            + "<td>%d</td>"
            + "<td>%d</td>"
            + "<td>%s</td>"
            + "<td>%d</td>"
            + "<td>%d</td>"
            + "<td>%s</td>"
            + "<td>%s</td>"
            + "<td>%s</td>"
            + "</tr>\n",
            report.getNo(),
            report.getReportedType(),
            report.getReportedNo(),
            report.getReportingMember(),
            report.getProcessingContent(),
            report.getReportedDate(),
            report.getStatus());

      }
      out.println("</tbody>");
      out.println("</table>");

    } catch (Exception e) {
      out.println("<h2>작업 처리 중 오류 발생!</h2>");
      out.printf("<pre>%s</pre>\n", e.getMessage());

      StringWriter errOut = new StringWriter();
      e.printStackTrace(new PrintWriter(errOut));
      out.println("<h3>상세 오류 내용</h3>");
      out.printf("<pre>%s</pre>\n", errOut.toString());
    }
  }
}
