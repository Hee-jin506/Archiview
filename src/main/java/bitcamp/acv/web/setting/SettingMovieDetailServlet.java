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

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head><title>영화관리(상세조회)</title></head>");
    out.println("<body>");
    try {

      int no = Integer.parseInt(request.getParameter("no"));
      Movie movie = movieService.findByNo(no);

      if (movie == null) {
        out.println("<p>해당 번호의 영화가 없습니다.</p>");
        return;
      }

      StringBuilder stillCuts = new StringBuilder();
      for (String stillCut : movie.getStillCuts()) {
        stillCuts.append(stillCut);
        stillCuts.append("\n");
      }

      StringBuilder posters = new StringBuilder();
      for (String poster : movie.getPosters()) {
        posters.append(poster);
        posters.append("\n");
      }

      StringBuilder genres = new StringBuilder();
      for (String genre : movie.getGenres()) {
        genres.append(genre);
        genres.append("\n");
      }

      out.printf("<p>영화번호    %d</p>\n", movie.getNo());
      out.printf("<p>등록일      %s</p>\n", movie.getRegisteredDate());
      out.printf("<p>제목        %s</p>\n", movie.getTitle());
      out.printf("<p>영문명      %s</p>\n", movie.getEnglishTitle());
      out.printf("<p>장르        %s</p>\n", genres.toString());
      out.printf("<p>상영시간    %d분</p>\n", movie.getRuntime());
      out.printf("<p>감독        %s</p>\n", movie.getDirectors());
      out.printf("<p>제작국가    %s</p>\n", movie.getNation());
      out.printf("<p>개봉일      %s</p>\n", movie.getOpenDate());
      out.printf("<p>출연        %s</p>\n", movie.getActors());
      out.printf("<p>시놉시스    %s</p>\n", movie.getSynopsis());

      out.println("<p>포스터</p>");
      for (String poster : movie.getPosters()) {
        out.printf("<img src='%s' width='120'>\n", poster);
      }
      out.println("<p>스틸컷<p>");
      for (String stillCut : movie.getStillCuts()) {
        out.printf("<img src='%s' width='120'>\n", stillCut);
      }
      out.println("<br>");
      out.printf("<a href='update?no=%d'>[수정]</a>\n ",
          movie.getNo());
    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error").forward(request, response);
      return;
    }

    out.println("</body></html>");
  }
}