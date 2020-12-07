package bitcamp.acv.web.report;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bitcamp.acv.domain.Report;

@WebServlet("/report/form")
public class MemberReportServletForm extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head>");
    out.println("<title>[회원 신고 등록]</title></head>");
    out.println("<body>");

    request.getRequestDispatcher("/header").include(request, response);

    try {
      out.println("<h1>[회원 신고 등록]</h1>");

      Report report = new Report();
      out.println("<form action='add' method='post'>");
      out.printf("신고 번호: <input type='hidden' name='no' value='%d'>\n",
          report.getNo());
      out.printf("신고자  : %d\n", report.getReportingMember());

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
      out.println("<ul>");
      out.printf("신고내용: <li><input type='checkbox' name='why' value='%s'>%1$s</li>%s<br>",
          type);
      out.println("</ul><br>");
      out.println("<p>");

      out.println("작업상태: ");
      out.println("<select name='status'>");
      out.println("  <option value='1'>처리중</option>");
      out.println("  <option value='2'>반려</option>");
      out.println("  <option value='3'>처리완료</option>");
      out.println("</select><br>");

      out.println("<button>등록</button>");
      out.println("</form>");
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
