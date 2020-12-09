package bitcamp.acv.web.option;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import bitcamp.acv.domain.Member;

// 입력

@WebServlet("/option/member/withdraw")
public class MemberWithdrawServlet extends HttpServlet{

  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    HttpSession session = request.getSession();

    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    Member member = (Member) session.getAttribute("loginUser");

    if (member != null) {

      out.printf("<form action='../../member/delete' method='post'>");
      out.printf("<input type='hidden' name='no', value='%s'>", member.getNo());
      out.printf("이메일 : <input type='email' name='email' value='%s' readonly><br>", member.getEmail());
      out.printf("패스워드 : <input type='password' name='password'><br>");
      out.printf("<button>탈퇴</button>");
      out.printf("</form>");

    }

  }

}
