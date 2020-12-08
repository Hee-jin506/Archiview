package bitcamp.acv.web.option;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import bitcamp.acv.domain.Member;
import bitcamp.acv.service.MemberService;

@WebServlet("/option/password/check")
public class PasswordCheckServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    HttpSession session = request.getSession();
    ServletContext ctx = request.getServletContext();
    MemberService memberService =
        (MemberService) ctx.getAttribute("memberService");

    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head><title>비밀번호체크</title></head>");
    out.println("<body>");

    try {
      Member old = (Member) session.getAttribute("loginUser");
      String email = old.getEmail();
      String oldPassword = request.getParameter("oldpassword");

      Member m = memberService.get(email, oldPassword);

      if (m != null) {
        String newPassword = request.getParameter("newpassword");
        m.setPassword(newPassword);
        memberService.updatePassword(m);
        out.println("<p>비밀번호를 변경 하였습니다.</p>");
      } else {
        out.println("<p>입력한 정보가 맞지 않습니다.</p>");
      }
      out.println("<meta http-equiv='Refresh' content='2;update'>");

    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error").forward(request, response);
      return;
    }
    out.println("</body></html>");


  }
}
