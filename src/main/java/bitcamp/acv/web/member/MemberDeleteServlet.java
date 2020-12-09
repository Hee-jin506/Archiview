package bitcamp.acv.web.member;

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

// 처리

@WebServlet("/member/delete")
public class MemberDeleteServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    MemberService memberService =
        (MemberService) ctx.getAttribute("memberService");

    HttpSession session = request.getSession();
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    String inputPassword = request.getParameter("password");
    Member member = (Member) session.getAttribute("loginUser");

    String email = member.getEmail();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head>");
    out.println("<title>회원탈퇴</title></head>");
    out.println("<body>");
    try {
      Member m = memberService.get(email, inputPassword);

      if (m == null) {
        out.println("패스워드가 틀렸습니다.");
      } else {
        memberService.delete(m.getNo());
        out.println("회원탈퇴가 완료되었습니다.");
      }
    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error").forward(request, response);
      return;
    }
    out.println("</body>");
    out.println("</html>");
  }
}
