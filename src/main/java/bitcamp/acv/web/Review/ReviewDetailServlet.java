package bitcamp.acv.web.Review;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bitcamp.acv.domain.Review;
import bitcamp.acv.service.ReviewService;

@WebServlet("/review/detail")
public class ReviewDetailServlet  extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    ReviewService reviewService =  (ReviewService) ctx.getAttribute("reviewService");
    response.setContentType("text/html;charset=UTF-8");
    try {
      int no = Integer.parseInt(request.getParameter("no"));
      Review review = reviewService.get(no);

      if (review == null) {
        throw new Exception("해당 게시물이 없습니다.");
      }

      request.setAttribute("review", review);
      request.getRequestDispatcher("/review/detail.jsp").include(request, response);

    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error.jsp").forward(request, response);
    }
  }
}