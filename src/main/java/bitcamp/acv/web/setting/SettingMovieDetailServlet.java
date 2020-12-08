package bitcamp.acv.web.setting;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bitcamp.acv.domain.Movie;
import bitcamp.acv.service.MovieService;

@WebServlet("/setting/movie/detail")
public class SettingMovieDetailServlet  extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    MovieService movieService =
        (MovieService) ctx.getAttribute("movieService");

    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    try {

      int no = Integer.parseInt(request.getParameter("no"));
      Movie movie = movieService.findByNo(no);

      if (movie == null) {
        out.println("<p>해당 번호의 영화가 없습니다.</p>");
        return;
      }

      request.setAttribute("movie", movie);
      request.getRequestDispatcher("/setting/movie/detail.jsp").include(request, response);

    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error").forward(request, response);
      return;
    }

    out.println("</body></html>");
  }
}