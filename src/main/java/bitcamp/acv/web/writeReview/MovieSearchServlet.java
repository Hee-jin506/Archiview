package bitcamp.acv.web.writeReview;

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

@WebServlet("/write/movieSearch")
public class MovieSearchServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    MovieService movieService =
        (MovieService) ctx.getAttribute("movieService");

    // 클라이언트가 POST 요청할 때 보낸 데이터를 읽는다.
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");

    PrintWriter out = response.getWriter();

    try {
      // MovieService 메서드 만들어야함

      out.println("<!DOCTYPE html>");
      out.println("<html>");
      out.println("<head>");
      out.println("<title>후기 등록 : 영화 검색 결과</title></head>");
      out.println("<body>");
      out.println("<h1>리뷰를 작성할 영화를 찾아볼까요?</h1>");
      out.println("<form>");
      out.printf("<input type='search' name='keyword' value='%s'><br>", request.getParameter("keyword"));
      out.println("<button>검색</button>");
      out.println("<a href='../main.html'>나중에 할래요</a>");
      out.println("</form>");


      List<Movie> movies = movieService.list(request.getParameter("keyword"));
      out.printf("<h1>'%s'검색 결과", request.getParameter("keyword"));
      for (Movie movie : movies) {

        out.printf("<a href='chooseStc?movieNo=%s'><img src='%s' alt='%s'></a>",
            movie.getNo(),
            movie.getPosters().get(0),
            movie.getTitle());
      }
    } catch (Exception e) {
      out.printf("<p>작업 처리 중 오류 발생! - %s</p>\n", e.getMessage());

      StringWriter errOut = new StringWriter();
      e.printStackTrace(new PrintWriter(errOut));

      out.printf("<pre>%s</pre>\n", errOut.toString());
    }
    out.println("</body>");
    out.println("</html>");
  }
}

