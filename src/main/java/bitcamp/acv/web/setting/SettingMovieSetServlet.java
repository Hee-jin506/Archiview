package bitcamp.acv.web.setting;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bitcamp.acv.domain.Movie;
import bitcamp.acv.service.MovieService;

@WebServlet("/setting/movie/set")
public class SettingMovieSetServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {


    ServletContext ctx = request.getServletContext();
    MovieService movieService =
        (MovieService) ctx.getAttribute("movieService");

    response.setContentType("text/html;charset=UTF-8");

    try {
      Movie movie = new Movie();
      movie.setNo(Integer.parseInt(request.getParameter("mvno")));
      movie.setRegisteredDate(Date.valueOf(request.getParameter("rdt")));
      movie.setTitle(request.getParameter("title"));
      movie.setEnglishTitle(request.getParameter("eng_title"));
      movie.setRuntime(Integer.parseInt(request.getParameter("runtime")));
      movie.setDirectors(request.getParameter("dir"));
      movie.setNation(request.getParameter("nation"));
      movie.setOpenDate(Date.valueOf(request.getParameter("odt")));
      movie.setActors(request.getParameter("actors"));
      movie.setSynopsis(request.getParameter("syn"));

      int count = movieService.update(movie);

      if (count == 0) {
        throw new Exception("해당 번호의 영화가 없습니다.");
      }

      response.sendRedirect("list");

    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error.jsp").forward(request, response);
    }

  }
}
