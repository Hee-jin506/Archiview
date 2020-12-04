package bitcamp.acv.web.setting;

import java.io.IOException;
import java.io.PrintWriter;
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
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {


    ServletContext ctx = request.getServletContext();
    MovieService movieService =
        (MovieService) ctx.getAttribute("movieService");

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

    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head>");
    out.println("<meta http-equiv='Refresh' content='1;url=list'>");
    out.println("<title>영화수정</title></head>");
    out.println("<body>");

    try {
      out.println("<h1>영화 수정</h1>");

      movieService.update(movie);

      out.println("<p>영화를 수정하였습니다.</p>");

    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error").forward(request, response);
      return;
    }

    out.println("</body>");
    out.println("</html>");
  }
}
