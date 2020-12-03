package bitcamp.acv.web.writeReview;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import bitcamp.acv.domain.Member;
import bitcamp.acv.domain.Review;
import bitcamp.acv.domain.Tag;
import bitcamp.acv.service.ReviewService;

@WebServlet("/write/add")
public class ReviewAddServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");

    PrintWriter out = response.getWriter();

    ServletContext ctx = request.getServletContext();
    ReviewService reviewService =
        (ReviewService) ctx.getAttribute("reviewService");

    try {
      HttpSession session = request.getSession();
      Member loginUser = (Member) session.getAttribute("loginUser");
      Review review = new Review();

      if (loginUser == null) {
      } else {
        review.setWriter(loginUser);
        review.setStillCut(Integer.parseInt(request.getParameter("stc")));
        review.setText(request.getParameter("text"));
        review.setTextX(Integer.parseInt(request.getParameter("x")));
        review.setTextY(Integer.parseInt(request.getParameter("x")));
        review.setTextFont(Integer.parseInt(request.getParameter("font")));
        review.setTextSize(Integer.parseInt(request.getParameter("size")));
        String str = request.getParameter("tag");
        String[] tagTitles = str.split("#");
        List<Tag> tags = new ArrayList<>();
        if (tagTitles.length > 0) {
          int n = 0;
          for (String tagTitle : tagTitles) {
            tagTitle = tagTitle.trim();
            if (!tagTitle.equals("")) {
              Tag tag = new Tag();
              tag.setTitle(tagTitle);
              System.out.println(n + " : " + tagTitle);
              tags.add(tag);
              n++;
            }
          }
        }
        review.setTags(tags);
      }
      reviewService.add(review);

      response.sendRedirect("../main.html");

    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error").forward(request, response);
      return;
    }
    out.println("</body>");
    out.println("</html>");
  }
}
