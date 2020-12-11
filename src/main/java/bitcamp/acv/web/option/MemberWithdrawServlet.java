package bitcamp.acv.web.option;

import java.io.IOException;
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

    try {
      Member member = (Member) session.getAttribute("loginUser");

      if (member == null) {
        throw new Exception("로그인 되어있지 않습니다.");
      } else {
        request.setAttribute("member", member);
        request.getRequestDispatcher("/option/member/memberWithdraw.jsp").include(request, response);
      }
    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error.jsp").forward(request, response);
    }
  }

}
