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
    String password = member.getPassword();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head>");
    out.println("<title>회원탈퇴</title></head>");
    out.println("<body>");
    try {
      out.println("<h1>회원 탈퇴</h1>");

      if (password != inputPassword) {
        out.println(password);
        out.println(inputPassword);

        out.println("<p>비밀번호가 틀립니다.</p>\n");

      } else {

        out.println("<p>탈퇴되었습니다.</p>\\n");
        memberService.delete(member.getNo());
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
