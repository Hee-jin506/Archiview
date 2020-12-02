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
import bitcamp.acv.service.TagService;

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
    TagService tagService =
        (TagService) ctx.getAttribute("tagService");

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head><title>후기등록</title></head>");
    out.println("<body>");

    try {
      out.println("<h1>후기 등록</h1>");
      HttpSession session = request.getSession();
      Member loginUser = (Member) session.getAttribute("loginUser");
      Review review = new Review();

      if (loginUser == null) {
        out.println("<p>후기를 등록하시려면 로그인 해주세요.</p>");
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
          for (String tagTitle : tagTitles) {
            Tag tag = new Tag();
            tag.setTitle(tagTitle);
            tags.add(tag);
          }
        }
        review.setTags(tags);
      }

      reviewService.add(review);
      tagService.addByReview(review);

    } catch (Exception e) {

    }
  }
}
