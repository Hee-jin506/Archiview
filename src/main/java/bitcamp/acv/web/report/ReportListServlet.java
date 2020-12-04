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
import bitcamp.acv.domain.Report;
import bitcamp.acv.service.ReportService;

@WebServlet("/report/list")
public class ReportListServlet extends HttpServlet {
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
    out.println("<title>[신고 관리]</title></head>");
    out.println("<body>");

    try {
      out.println("<h1>[신고 관리]</h1>");

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
        String type = null;
        switch (report.getReportedType()) {
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

        out.printf("<tr>"
            + "<td>%d</td>\n"
            + "<td><a href='detail?no=%1$d'>%s</a></td>\n"
            + "<td>%d</td>\n"
            + "<td>%d</td>\n"
            + "<td>%s</td>\n"
            + "<td>%s</td>\n"
            + "<td>%s</td>\n"
            + "</tr>\n",
            report.getNo(), // 신고 번호
            type, // 신고 유형
            report.getReportedNo(), // 신고된 대상 번호
            report.getReportingMember().getNo(),  // 신고한 회원
            report.getProcessingContent(), // 신고 처리 내용
            report.getReportedDate(), // 신고 일시
            report.getStatus()); // 신고 처리 상태
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
