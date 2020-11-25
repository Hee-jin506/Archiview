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
    out.println("<head><title>영화 목록</title></head>");
    out.println("<body>");

    try {
      out.println("<h1>[영화 목록]</h1>");

      List<Movie> list = movieService.list();

      out.println("<table border=\"1\">");
      out.println("<tr>");
      out.println("<th>영화 번호</th>");
      out.println("<th>네이버 영화 번호</th>");
      out.println("<th>영화 제목</th>");
      out.println("<th>감독</th>");
      out.println("<th>영화 영문명</th>");
      out.println("<th>상영시간</th>");
      out.println("<th>개봉일</th>");
      out.println("<th>출연</th>");
      out.println("<th>시놉시스</th>");
      out.println("<th>국가</th>");
      out.println("<th>상태</th>");
      out.println("<th>등록일</th>");
      out.println("<th>스틸컷</th>");
      out.println("<th>포스터</th>");
      out.println("<th>장르</th>");
      out.println("</tr>");

      for (Movie movie : list ) {
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


        out.println("<tr>");
        out.printf("<td>%d</td> "
            + "<td>%d</td>"
            + "<td>%s</td>"
            + "<td>%s</td>"
            + "<td>%s</td>"
            + "<td>%d</td>"
            + "<td>%s</td>"
            + "<td>%s</td>"
            + "<td>%s</td>"
            + "<td>%s</td>"
            + "<td>%d</td>"
            + "<td>%s</td>"
            + "<td>%s</td>"
            + "<td>%s</td>"
            + "<td>%s</td>",
            movie.getNo(),
            movie.getNaverCd(),
            movie.getTitle(),
            movie.getDirectors(),
            movie.getEnglishTitle(),
            movie.getRuntime(),
            movie.getOpenDate(),
            movie.getActors(),
            movie.getSynopsis(),
            movie.getNation(),
            movie.getStatus(),
            movie.getRegisteredDate(),
            stillCuts.toString(),
            posters.toString(),
            genres.toString());
        out.println("</tr>");
      }
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


