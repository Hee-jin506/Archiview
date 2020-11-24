package bitcamp.acv.web;

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
import bitcamp.acv.domain.Movie;
import bitcamp.acv.service.MovieService;

@WebServlet("/movie/list")
public class MovieListServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    MovieService movieService =  (MovieService) ctx.getAttribute("movieService");
    response.setContentType("text/html;charset=UTF-8");

    PrintWriter out = response.getWriter();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head><title>게시글 목록</title></head>");
    out.println("<body>");
    try {
      out.println("<h1>[게시물 목록]</h1>");

      List<Movie> list = movieService.list();

      out.println("<table border=\"1\">");
      out.println("<tr>");
      out.println("<th>번호</th>");
      out.println("<th>제목</th>");
      out.println("<th>작성자</th>"); 
      out.println("<th>등록일</th>");
      out.println("<th>조회수</th>");
      out.println("</tr>");
      //        for (Movie movie : list ) {
      //          out.println("<tr>");
      //          out.printf("<td>%d</td> <td>%sd</td>  <td>%s</td>  <td>%s</td>  <td>%d</td>",         
      //              movie.getNo(),
      //              movie.getTitle(),
      //              movie.getWriter().getName(),
      //              movie.getRegisteredDate(),
      //              movie.getViewCount());
      //          out.println("</tr>");
      //        }
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


