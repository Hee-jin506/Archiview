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

@WebServlet("/write/chooseStc")
public class StillCutChooseServlet extends HttpServlet {

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
      Movie movie = movieService.findByNo(Integer.parseInt(request.getParameter("movieNo")));

      out.println("<!DOCTYPE html>");
      out.println("<html>");
      out.println("<head>");
      out.println("<title>후기 등록 : 스틸컷 선택</title></head>");
      out.println("<body>");
      out.println("<h1>인상 깊은 장면을 골라주세요.</h1>");

      List<String> stillcuts = movie.getStillCuts();
      out.println("<form action='editCard'>");

      for (String stillcut : stillcuts) {

        out.println("<label>");
        out.printf("<input type='radio' name='stc' value='%d' %s>",
            movieService.getStillCutNo(stillcut),
            stillcuts.indexOf(stillcut) == 0 ? "checked" : "");

        out.printf("<img src='%s' alt='%d번 스틸컷'>",
            stillcut,
            stillcuts.indexOf(stillcut));
        out.println("</label>");
      }

      out.println("<button>다음</button></form>");
      out.println("<br><a href='../main.html'>뒤로</a>");

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
