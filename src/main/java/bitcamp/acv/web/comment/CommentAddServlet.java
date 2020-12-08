package bitcamp.acv.web.comment;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import bitcamp.acv.domain.Comment;
import bitcamp.acv.domain.Member;
import bitcamp.acv.service.CommentService;

@WebServlet("/coment/write")
public class CommentAddServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    CommentService commentService =
        (CommentService) ctx.getAttribute("commentService");

    HttpSession session = request.getSession();

    PrintWriter out = response.getWriter();

    Comment comment = new Comment();
    comment.setNo(Integer.parseInt(request.getParameter("no")));
    comment.setReviewNo(Integer.parseInt(request.getParameter("reviewNo")));
    comment.setLevel(Integer.parseInt(request.getParameter("levle")));
    comment.setOrder(Integer.parseInt(request.getParameter("order")));
    comment.setContent(request.getParameter("content"));

    try {
      Member loginUser = (Member) session.getAttribute("loginUser");
      int loginUserNo = loginUser.getNo();
      comment.setMemberNo(loginUserNo);
      commentService.add(comment);

    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error.jsp").forward(request, response);
      return;
    }
  }
}

