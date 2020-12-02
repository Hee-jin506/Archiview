package bitcamp.acv.web.tag;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.HashMap;
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
          + "<img src='../tag-border-icon.svg' alt='tag-border-icon'>"
          + "</a>");

      out.println("<h1>[태그 목록]</h1>");

      List<Tag> list = null;

      String keyword = request.getParameter("keyword");
      String keywordNumber = request.getParameter("keywordNumber");
      String keywordTitle = request.getParameter("keywordTitle");
      String keywordStatus = request.getParameter("keywordStatus");

      if (keyword != null) {
        list = tagService.list(keyword);

      } else if (keywordNumber != null) {
        HashMap<String,Object> keywordMap = new HashMap<>();
        keywordMap.put("number", keywordNumber);
        keywordMap.put("title", keywordTitle);
        keywordMap.put("status", keywordStatus);

        list = tagService.list(keywordMap);

      } else {
        list = tagService.list();
      }

      out.println("<p>");
      out.println("<form action='list' method='get'>");
      out.printf("<input type='text' name='keyword' value='%s'>\n",
          keyword != null ? keyword : "");
      out.println("<button>검색</button>");
      out.println("</form>");
      out.println("</p>");

      out.println("<hr>");
      out.println("<h2>상세 검색</h2>");
      out.println("<p>");
      out.println("<form action='list' method='get'>");
      out.printf("태그번호: <input type='text' name='keywordNumber' value='%s'><br>\n",
          keywordNumber != null ? keywordNumber : "");
      out.printf("태그명: <input type='text' name='keywordTitle' value='%s'><br>\n",
          keywordTitle != null ? keywordTitle : "");
      out.printf("상태: <input type='text' name='keywordStatus' value='%s'><br>\n",
          keywordStatus != null ? keywordStatus : "");
      //      out.println("등록일: <input type='date' name='registeredDate'><br>\n");
      out.println("<button>검색</button>");
      out.println("</form>");
      out.println("</p>");

      List<Tag> allList = tagService.list();
      out.printf("<span>총 태그 수 : %d</span>", allList.size());

      out.println("<form action='multipleDelete' method='get'>");
      out.println("<table border=\"1\">");
      out.println("<tr>");
      out.println("<th>선택</th>");
      out.println("<th>태그 번호</th>");
      out.println("<th>태그명</th>");
      out.println("<th>게시물 수</th>");
      out.println("<th>등록일</th>");
      out.println("<th>상태</th>");
      out.println("</tr>");

      for (Tag tag : list ) {

        out.println("<tr>");
        out.printf(""
            + "<td><input type='checkbox' name='tags' value='%d'</td>\n" // 선택
            + "<td>%1$d</td>" // no
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
      out.println("<button>[삭제]</button>");
      out.println("</form>");

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


