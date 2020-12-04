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

@WebServlet("/setting/movie/update")
public class SettingMovieUpdateServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void service(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    MovieService movieService =
        (MovieService) ctx.getAttribute("movieService");

    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head>");
    out.println("<title>영화관리(정보수정)</title></head>");
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

      out.println("<form action='set' method=post'>");
      out.println("<button>수정</button>");
      out.printf("<a href='detail?no=%d'>취소</a>\n", movie.getNo());
      out.printf("<p>영화번호 <input type='text' name='mvno' value='%d' readonly></p>\n", movie.getNo());
      out.printf("<p>등록일 <input type='date' name='rdt' value='%s'></p>\n", movie.getRegisteredDate());
      out.printf("<p>제목 <input type='text' name='title' value='%s'></p>\n", movie.getTitle());
      out.printf("<p>영문명 <input type='text' name='eng_title' value='%s'></p>\n", movie.getEnglishTitle());
      out.printf("<p>장르 <input type='text' name='gnr' value='%s' readonly></p>\n", genres.toString());
      out.printf("<p>상영시간 <input type='text' name='runtime' value='%d'>분</p>\n", movie.getRuntime());
      out.printf("<p>감독 <input type='text' name='dir' value='%s'></p>\n", movie.getDirectors());
      out.printf("<p>제작국가 <input type='text' name='nation' value='%s'></p>\n", movie.getNation());
      out.printf("<p>개봉일 <input type='date' name='odt' value='%s'></p>\n", movie.getOpenDate());
      out.printf("<p>출연 <input type='text' name='actors' value='%s'></p>\n", movie.getActors());
      out.printf("<p>시놉시스 <textarea name='syn' cols='40' rows='10'>%s</textarea></p>\n", movie.getSynopsis());
      out.println("</form>");

      out.println("<p>포스터</p>");
      for (String poster : movie.getPosters()) {
        out.printf("<img src='%s' width='120'>\n", poster);
      }
      out.println("<p>스틸컷<p>");
      for (String stillCut : movie.getStillCuts()) {
        out.printf("<img src='%s' width='120'>\n", stillCut);
      }

    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error").forward(request, response);
      return;
    }

    out.println("</body></html>");
  }
}
