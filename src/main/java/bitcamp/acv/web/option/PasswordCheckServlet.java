package bitcamp.acv.web.option;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bitcamp.acv.domain.Member;
import bitcamp.acv.service.MemberService;

@WebServlet("/option/password/check")
public class PasswordCheckServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

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
      if (request.getParameter("newpassword").toString() == request.getParameter("newpassword2").toString()) {
        Member member = new Member();
        member.setNo(Integer.parseInt(request.getParameter("no")));
        member.setPassword(request.getParameter("newpassword2"));

        memberService.updatePassword(member);

        out.println("<p>비밀번호를 변경 하였습니다.</p>");
      } else {
        out.println("<p>두 비밀번호가 일치하지 않습니다.</p>");
        out.printf("%s<br>", request.getParameter("newpassword"));
        out.printf("%s", request.getParameter("newpassword2"));
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
