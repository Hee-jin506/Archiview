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

      out.println("<!DOCTYPE html>");
      out.println("<html>");
      out.println("<head>");
      out.println("<title>후기 등록 : 카드 편집</title></head>");
      out.println("<body>");
      out.println("<h1>자기만의 감성으로 카드를 꾸며주세요!</h1>");
      int stcNo = Integer.parseInt(request.getParameter("stc"));
      String url = movieService.getStcUrl(stcNo);
      out.printf("<img src='%s'>", url);

      List<Font> fonts = reviewService.listFont();
      out.println("<form action='add' metho='post'>");
      out.println("<label>폰트");
      out.println("<select name='font'>");
      for (Font font : fonts) {
        out.printf("<option value='%d'>%s</option>\n", font.getNo(), font.getName());
      }
      out.println("</select></label>");
      out.println("<label>폰트크기<input type='range' name='size' min='10' max='50' value='30'></label><br>");
      out.println("<label>내용<textarea rows='10' cols='70' name='text'></textarea></label><br>");
      out.println("<label>태그<input type='text' name='tag'></label><br>");
      out.println("<label>x좌표<input type='range' name='x' min='0' max='665' value='332'></label><br>");
      out.println("<label>y좌표<input type='range' name='y' min='0' max='443' value='221'></label><br>");
      out.println("<a href='chooseStc'>뒤로</a>");
      out.println("<button>리뷰 등록</button><br>");
      out.println("</form>");
    } catch (Exception e) {
      out.println("<h2>작업 처리 중 오류 발생!</h2>");
      out.printf("<pre>%s</pre>\n", e.getMessage());

      StringWriter errOut = new StringWriter();
      e.printStackTrace(new PrintWriter(errOut));
      out.println("<h3>상세 오류 내용</h3>");
      out.printf("<pre>%s</pre>\n", errOut.toString());
    }

    out.println("</body>");
    out.println("</html>");
  }
}
