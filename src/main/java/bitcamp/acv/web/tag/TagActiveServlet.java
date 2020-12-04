package bitcamp.acv.web.tag;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bitcamp.acv.service.TagService;


@WebServlet("/tag/active")
public class TagActiveServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    TagService tagService =
        (TagService) ctx.getAttribute("tagService");

    int no = Integer.parseInt(request.getParameter("no"));

    PrintWriter out = response.getWriter();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head>");
    out.println("<meta http-equiv='Refresh' content='1;list'>");
    out.println("<title>태그복구</title></head>");
    out.println("<body>");
    try {
      out.println("<h1>태그 복구</h1>");


      int count = tagService.active(no);
      try {
        if (count == 0) {
          out.printf("<p>해당 번호의 태그가 존재하지 않습니다.</p>\n");
        } else {
          out.printf("<p>태그를 복구하였습니다.</p>\n");
        }
      } catch (Exception e) {
        out.println("태그 복구 중 오류 발생!");
        e.printStackTrace();
      }

    } catch (Exception e) {
      out.printf("<h2>작업 처리 중 오류 발생!</h2>");
      out.printf("<pre>%s</pre>\n", e.getMessage());

      StringWriter errOut = new StringWriter();
      e.printStackTrace(new PrintWriter(errOut));

      out.printf("<h3>상세 오류 내용</h3>");
      out.printf("<pre>%s</pre>\n", errOut.toString());
    }

    out.println("</body>");
    out.println("</html>");
  }


}
