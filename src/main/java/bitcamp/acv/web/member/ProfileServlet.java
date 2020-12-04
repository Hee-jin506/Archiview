package bitcamp.acv.web.member;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import bitcamp.acv.domain.Member;


@WebServlet("/member/profile")
public class ProfileServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    HttpSession session = request.getSession();

    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    Member member = (Member) session.getAttribute("loginUser");
    if (member == null) {
      out.println("<p>로그인 하지 않았습니다!</p>");
    } else {

      out.printf("사용자 번호: %d<br>\n", member.getNo());
      out.printf("이름: %s<br>\n", member.getName());
      out.printf("이메일: %s<br>\n", member.getEmail());
      out.printf("사진: %s<br>\n", member.getPhoto());
      out.printf("소개: %s<br>\n", member.getIntro());

      if (member.getStatus() == 1 || member.getStatus() == 2) {
        out.printf("<a href='../member/delete?no=%d'>탈퇴</a>\n", member.getNo());
      }
    }
  }
}
