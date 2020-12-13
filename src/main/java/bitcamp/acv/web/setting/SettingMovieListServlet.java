package bitcamp.acv.web.setting;

import java.io.IOException;
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

    // request.getRequestDispatcher("/topbar.jsp").include(request, response);

    try {

      List<Movie> list;

      String keyword = request.getParameter("keyword");
      if (keyword != null) {
        list = movieService.list(keyword);

      } else {
        list = movieService.list(null);
      }

      request.setAttribute("list", list);
      request.getRequestDispatcher("/setting/movie/list.jsp").include(request, response);

    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error.jsp").forward(request, response);
    }
  }
}


