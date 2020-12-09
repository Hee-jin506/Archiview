package bitcamp.acv.web.Review;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bitcamp.acv.service.ReviewService;


@WebServlet("/review/multipleDelete")
public class ReviewMultipleDeleteServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    ReviewService reviewService = (ReviewService) ctx.getAttribute("reviewService");

    try {
      String[] reviewNoList = request.getParameterValues("reviews");

      int count = 0;

      if (reviewNoList != null) {
        for (String reviewNo : reviewNoList) {
          count += reviewService.delete(Integer.parseInt(reviewNo));
        }
      }

      if (count == 0) {
        throw new Exception("해당 번호의 태그가 존재하지 않습니다.");
      }

      response.sendRedirect("list");

    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error.jsp").forward(request, response);
    }
  }
}
