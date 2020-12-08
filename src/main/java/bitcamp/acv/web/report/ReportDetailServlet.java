package bitcamp.acv.web.report;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bitcamp.acv.domain.Report;
import bitcamp.acv.service.ReportService;

@WebServlet("/report/detail")
public class ReportDetailServlet extends HttpServlet{
  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    ReportService reportService =
        (ReportService) ctx.getAttribute("reportService");

    int no = Integer.parseInt(request.getParameter("no"));

    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head>");
    out.println("<title>[신고 상세 정보]</title></head>");
    out.println("<body>");

    try {
      out.println("<h1>[신고 상세 정보]</h1>");

      Report report = reportService.get(no);

      //      Object target = reportService.getTarget(report);
      //      if (target instanceof Member) {
      //        request.setAttribute("member", target);
      //        request.getRequestDispatcher("memberTarget.jsp").include(request, response);
      //      } else if (target instanceof Review) {
      //        request.setAttribute("review", target);
      //        request.getRequestDispatcher("reviewTarget.jsp").include(request, response);
      //      }  else if (target instanceof Tag) {
      //        request.setAttribute("tag", target);
      //        request.getRequestDispatcher("tagTarget.jsp").include(request, response);
      //      }
      // else if (target instanceof Comment) {
      // request.setAttribute("comment", target);
      // request.getRequestDispatcher("commentTarget.jsp").include(request, response);
      // }

      if (report == null) {
        out.println("<p>해당 신고 번호가 없습니다.</p>");
      } else {

        out.println("<form action='update' method='post'>");
        out.printf("신고번호: <input type='text' name='no' value='%d' readonly><br>\n",
            report.getNo());

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

        out.printf("신고유형: %s<br>\n", type);
        out.printf("신고자: %d<br>\n", report.getReportingMember().getNo());
        out.printf("신고일: %s<br>\n", report.getReportedDate());
        out.printf("신고 내용: %s<br>\n", report.getWhy());
        out.println("</select><br>");

        String[] stateLabels = {"신고대기", "반려", "처리완료"};
        out.println("처리상태: ");
        out.println("<select name='status'>");
        for (int i = 0; i < stateLabels.length; i++) {
          out.printf("<option value='%d' %s>%s</option>\n",
              i+1, report.getStatus(), stateLabels[i]);
        }

        out.println();
        out.println("</select><br>");
        out.printf("처리일: <input type='date' name='processedDate' value='%s'><br>\n",
            report.getProcessedDate());
        out.printf("처리내용: <textarea name='processingContent'>%s</textarea><br>\n",
            report.getProcessingContent());
        out.println("<p>");
        out.println("<button>변경</button>");
        out.printf("<a href='delete?no=%d'>삭제</a>\n", report.getNo());
        out.printf("<a href='../report/detail?no=%d'>[목록]</a>\n",
            report.getNo());
        out.println("</p>");
        out.println("</form>");
      }

    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error").forward(request, response);
      return;
    }

    out.println("</body>");
    out.println("</html>");
  }
}
