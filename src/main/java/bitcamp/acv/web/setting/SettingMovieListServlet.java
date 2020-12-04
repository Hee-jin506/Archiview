package bitcamp.acv.web.setting;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bitcamp.acv.domain.Movie;
import bitcamp.acv.service.MovieService;

@WebServlet("/setting/movie/list")
public class SettingMovieListServlet extends HttpServlet {

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
    out.println("<head><title>영화관리</title></head>");
    out.println("<body>");

    try {
      out.println("<h1>영화 관리</h1>");

      String keyword = request.getParameter("keyword");

      out.println("<p>");
      out.println("<form action='list' method='get'>");
      out.printf("<input type='text' name='keyword' value='%s'>\n",
          keyword != null ? keyword : "");
      out.println("<button>검색</button>");
      out.println("</form>");
      out.println("</p>");

      List<Movie> list = movieService.list();

      out.printf("<span>총 영화 수 : %d</span>", list.size());
      out.println("<table border='1'>");
      out.println("<thead><tr>"
          + "<th> </th>"
          + "<th>영화번호</th>"
          + "<th>영화제목</th>"
          // + "<th>게시글 수</th>"
          + "<th>등록일</th>"
          + "<th>상태</th>"
          + "</tr></thead>");

      out.println("<tbody>");

      for (Movie movie : list) {
        String stat;
        if (movie.getStatus() != 0) {
          stat = "게시중";
        } else {
          stat = "삭제";
        }

        out.println("<tr>");
        out.printf("<td><input type='checkbox' name='movie' value='%d'</td>"
            + "<td><a href='detail?no=%1$d'>%1$d</a></td> "
            + "<td><a href='detail?no=%1$d'>%s</a></td>"
            + "<td>%s</td>"
            // + "<td>%d</td>" 게시글 수
            + "<td>%s</td>"
            + "</tr>\n",
            movie.getNo(),
            movie.getTitle(),
            movie.getRegisteredDate(),
            stat);
      }
      out.println("</tbody>");
      out.println("</table>");

    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error").forward(request, response);
      return;
    }
    out.println("</body>");
    out.println("</html>");
  }
}


