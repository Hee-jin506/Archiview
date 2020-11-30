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

    PrintWriter out = response.getWriter();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head><title>태그 관리 화면</title>"
        + "<style>"
        + "body {" 
        + "background-color: #000000;"
        + "color: #ffffff;" 
        + "}"
        + "</style>"
        + "</head>");
    out.println("<body>");

    try {
      // 홈 아이콘
      out.println("<a href='../admin-main.html'>"
          + "<img src='../home-border-icon.svg' alt='home-border-icon'>"
          + "</a>");
      // 태그 아이콘
      out.println("<a href='list'>"
          + "<img src='../tag-border-icon.svg' alt='home-border-icon'>"
          + "</a>");

      out.println("<h1>[태그 목록]</h1>");
      out.println("<form>" + 
          "<input type='search' value='검색' name='keyword'>" + 
          "</form>");

      List<Tag> list = tagService.list();
      out.printf("<span>총 태그 수 : %d</span>", list.size());

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


