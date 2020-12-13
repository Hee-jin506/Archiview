package bitcamp.acv.web.movie;

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

@WebServlet("/movie/search")
public class MovieSearchServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    response.setContentType("text/html;charset=UTF-8");

    ServletContext ctx = request.getServletContext();
    MovieService movieService =  (MovieService) ctx.getAttribute("movieService");

    response.setContentType("text/html;charset=UTF-8");

    try {

      String keyword = request.getParameter("keyword");
      List<Movie> movieList = movieService.listByKeywordTitle(keyword);
      request.setAttribute("movieList", movieList);
      request.getRequestDispatcher("movieSearch.jsp").include(request, response);


    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error.jsp").forward(request, response);
    }
  }
}

