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
import bitcamp.acv.domain.Font;
import bitcamp.acv.service.MovieService;
import bitcamp.acv.service.ReviewService;

@WebServlet("/write/editCard")
public class ReviewEditServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");

    PrintWriter out = response.getWriter();

    ServletContext ctx = request.getServletContext();
    ReviewService reviewService =
        (ReviewService) ctx.getAttribute("reviewService");
    MovieService movieService =
        (MovieService) ctx.getAttribute("movieService");

    try {

      int stcNo = Integer.parseInt(request.getParameter("stc"));
      String url = movieService.getStcUrl(stcNo);
      request.setAttribute("url", url);

      List<Font> fonts = reviewService.listFont();
      request.setAttribute("fonts", fonts);

      request.getRequestDispatcher("reviewEdit.jsp").include(request, response);

    } catch (Exception e) {
      out.println("<h2>작업 처리 중 오류 발생!</h2>");
      out.printf("<pre>%s</pre>\n", e.getMessage());

      StringWriter errOut = new StringWriter();
      e.printStackTrace(new PrintWriter(errOut));
      out.println("<h3>상세 오류 내용</h3>");
      out.printf("<pre>%s</pre>\n", errOut.toString());
    }
  }
}
