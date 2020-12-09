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
  protected void service(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    MemberService memberService =
        (MemberService) ctx.getAttribute("memberService");

    HttpSession session = request.getSession();

    int no = Integer.parseInt(request.getParameter("no"));
    Member loginUser = (Member) session.getAttribute("loginUser");

    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head>");
    out.println("<title>회원탈퇴</title></head>");
    out.println("<body>");
    try {
      out.println("<h1>회원 탈퇴</h1>");

      if (loginUser != null) {

        // 인풋받는 패스워드와 로긴유저에 저장된 패스워드를 비교해서 일치하는지 검사
        out.println("<form method='post'>");
        out.println("비밀번호 : <input type='password' value='password'><br>");
        out.println("<button><a href='../member/delete?no=%d'>탈퇴</a>\n</button>");
        out.println("</form");

        String password = (String) request.getAttribute("password");

        if (loginUser.getPassword() == password) {
          memberService.delete(no);
        }
      } else {
        out.printf("<p>해당 회원이 존재하지 않습니다.</p>\n");
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
