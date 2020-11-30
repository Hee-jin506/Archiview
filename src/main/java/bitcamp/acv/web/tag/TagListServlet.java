package bitcamp.acv.web.tag;

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
import bitcamp.acv.domain.Tag;
import bitcamp.acv.service.TagService;

@WebServlet("/tag/list")
public class TagListServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    TagService tagService =  (TagService) ctx.getAttribute("tagService");
    response.setContentType("text/html;charset=UTF-8");

    PrintWriter out = response.getWriter();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head><title>태그 관리 화면</title></head>");
    out.println("<body>");

    try {
      out.println("<h1>[태그 목록]</h1>");

      List<Tag> list = tagService.list();

      out.println("<table border=\"1\">");
      out.println("<tr>");
      out.println("<th>태그 번호</th>");
      out.println("<th>태그명</th>");
      out.println("<th>게시물 수</th>");
      out.println("<th>등록일</th>");
      out.println("<th>상태</th>");
      out.println("</tr>");
      for (Tag tag : list ) {

        out.println("<tr>");
        out.printf(""
            + "<td>%d</td>" // no
            + "<td><a href='detail?no=%1$d'>%s</a></td>" // title
            + "<td>1</td>" //
            + "<td>%s</td>" // rdt
            + "<td>%s</td>", // stat,
            tag.getNo(), 
            tag.getTitle(),
            tag.getRegisteredDate(),
            tag.isStatus() ? "게시중" : "삭제"
            );
        out.println("</tr>");
      }
      out.println("</table>");

    } catch (Exception e) {
      out.printf("작업 처리 중 오류 발생! - %s\n", e.getMessage());
      StringWriter errOut = new StringWriter();
      e.printStackTrace(new PrintWriter(errOut));
      out.printf("<pre>%s</pre>\n", errOut.toString());
    }
    out.println("</body>");
    out.println("</html>");
  }
}


