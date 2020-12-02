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
import bitcamp.acv.domain.Tag;
import bitcamp.acv.service.TagService;

@WebServlet("/tag/detail")
public class TagDetailServlet  extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    TagService tagService =  (TagService) ctx.getAttribute("tagService");


    // 웹주소에 동봉된 데이터(Query String: qs)를 읽는다.
    int no = Integer.parseInt(request.getParameter("no"));

    PrintWriter out = response.getWriter();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head><title>태그 상세 조회</title>"
        + "<style>"
        + "body {" 
        + "background-color: #000000;"
        + "color: #ffffff;" 
        + "}"
        + "</style>"
        + "</head>");
    out.println("<body>");
    out.println("<body>");
    try {
      out.println("<a href='../admin-main.html'>"
          + "<img src='../home-border-icon.svg' alt='home-border-icon'>"
          + "</a>");
      out.println("<a href='list'>"
          + "<img src='../tag-border-icon.svg' alt='home-border-icon'>"
          + "</a>");
      out.println("<h1>[태그 상세 조회]</h1>");

      Tag tag = tagService.get(no);

      if (tag == null) {
        out.println("해당 번호의 태그가 없습니다.");
        return;
      }

      out.printf("태그 번호 - %d<br>\n", tag.getNo());
      out.printf("태그명: %s<br>\n", tag.getTitle());
      out.printf("등록일 - %s<br>\n", tag.getRegisteredDate());
      //      out.printf("게시물 수 - %s<br>\n", member.getPhoto());
      out.printf("상태: %s<br>\n", tag.isStatus() ? "게시중" : "삭제");
      out.printf("<a href='delete?no=%d'>삭제</a>\n", tag.getNo());
      out.println("</p>");


    } catch (Exception e) {
      out.printf("<p>작업 처리 중 오류 발생! - %s</p>\n", e.getMessage());

      StringWriter errOut = new StringWriter();
      e.printStackTrace(new PrintWriter(errOut));

      out.printf("<pre>%s</pre>\n", errOut.toString());
    }

    out.println("</body></html>");
  }
}