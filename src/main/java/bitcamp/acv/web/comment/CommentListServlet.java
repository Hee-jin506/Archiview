package bitcamp.acv.web.comment;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bitcamp.acv.service.CommentService;
import bitcamp.acv.service.ReviewService;

@WebServlet("/comment/list")
public class CommentListServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    ReviewService reviewService = (ReviewService) ctx.getAttribute("reviewService");
    CommentService commentService = (CommentService) ctx.getAttribute("commentService");

    //    int no = Integer.parseInt(request.getParameter("no"));

    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head><title>게시글목록</title></head>");
    out.println("<body>");

    try {

      out.println("<h1>코멘트 목록</h1>");

      //      List<Comment> list = commentService.list();
      //      Review review = reviewService.get(no);

      out.println("<table border='1'>");
      out.println("<thead><tr>"
          + "<th>코멘트 번호</th>"
          + "<th>리뷰 번호</th>"
          + "<th>작성자</th>"
          + "<th>내용</th>"
          + "<th>오더</th>"
          + "<th>레벨</th>"
          + "<th>등록일</th>"
          + "</tr></thead>");

      out.println("<tbody>");

      //      for (Comment comment : list) {
      //        out.printf("<tr>"
      //            + "<td>%s</td>"
      //            //            + "<td>%s</td>"
      //            + "<td>%s</td>"
      //            + "<td>%s</td>"
      //            + "<td>%s</td>"
      //            + "</tr>\n",
      //            comment.getNo(),
      //            //            review.getNo(),
      //            comment.getMemberNo(),
      //            comment.getContent(),
      //            comment.getOrder(),
      //            comment.getLevel(),
      //            comment.getRegisteredDate()
      //            );
      //
      //      }
      out.println("</tbody>");
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