package bitcamp.acv.web.report;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bitcamp.acv.domain.Member;
import bitcamp.acv.domain.Report;
import bitcamp.acv.domain.Review;
import bitcamp.acv.domain.Tag;
import bitcamp.acv.service.ReportService;

@WebServlet("/report/detail")
public class ReportDetailServlet extends HttpServlet{
  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    ReportService reportService = (ReportService) ctx.getAttribute("reportService");
    // MemberService memberService = (MemberService) ctx.getAttribute("memberService");

    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head>");
    out.println("<title>[신고 상세 정보]</title></head>");
    out.println("<body>");

    try {
      out.println("<h1>[신고 상세 정보]</h1>");

      // 신고 번호 불러오기
      int no = Integer.parseInt(request.getParameter("no"));

      Report report = reportService.get(no);
            Object target = reportService.getTarget(report);
            if (target instanceof Member) {
              request.setAttribute("member", target);
              request.getRequestDispatcher("memberTarget.jsp").include(request, response);
            } else if (target instanceof Review) {
              request.setAttribute("review", target);
              request.getRequestDispatcher("reviewTarget.jsp").include(request, response);
            }  else if (target instanceof Tag) {
              request.setAttribute("tag", target);
              request.getRequestDispatcher("tagTarget.jsp").include(request, response);
            }

            // else if (target instanceof Comment) {
            // request.setAttribute("comment", target);
            // request.getRequestDispatcher("commentTarget.jsp").include(request, response);
            // }

      if (report == null) {
        out.println("<p>해당 신고 번호가 없습니다.</p>");
        return;
      }

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
      for (int i = 0; i < 3; i++) {
        out.printf("<option value='%d'>%s</option>\n",
            i, stateLabels[i]);
      }
      out.println();
      out.println("</select><br>");
      out.printf("처리일: <input type='date' name='ProcessedDate' value='%s'><br>\n",
          report.getProcessedDate());
      out.printf("처리내용: <textarea name='content'>%s</textarea><br>\n",
          report.getProcessingContent());
      out.println("<p>");
      out.println("<button>변경</button>");
      out.printf("<a href='delete?no=%d'>삭제</a>\n", report.getNo());
      out.println("</p>");
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
}
