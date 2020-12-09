package bitcamp.acv.web.Review;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bitcamp.acv.domain.Review;
import bitcamp.acv.service.ReviewService;

@WebServlet("/review/searchBest")
public class ReviewSearchBestServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    ReviewService reviewService =  (ReviewService) ctx.getAttribute("reviewService");

    try {

      String keyword = request.getParameter("keyword");
      List<Review> reviewList = reviewService.listByKeywordTagTitle(keyword);
      request.setAttribute("reviewList", reviewList);
      request.getRequestDispatcher("bestReviewSearch.jsp").include(request, response);


    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error.jsp").forward(request, response);
    }
  }
}

