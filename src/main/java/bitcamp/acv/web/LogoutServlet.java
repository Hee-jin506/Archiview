package bitcamp.acv.web;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import bitcamp.acv.domain.Member;

@WebServlet("/auth/logout")
public class LogoutServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    // 클라이언트 전용 보관소(httpSession)를 준비한다.
    HttpSession session = request.getSession();

    // 클라이언트로 데이터를 출력할 때 사용할 스트림 준비
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head><title>로그아웃</title></head>");
    out.println("<body>");

    out.println("<h1>로그아웃</h1>");


    Member loginUser = (Member) session.getAttribute("loginUser");
    if (loginUser == null) {
      out.println("<p>로그인 된 상태가 아닙니다!</p>");
    } else {

      out.printf("%s 님 안녕히 가세요!\n", loginUser.getName());
      out.printf("%s 님 안녕히 가세요!\n", loginUser.getNo());
      session.invalidate(); // 로그아웃을 요청한 클라이언트의 세션을 무효화 시킨다.
    }
    out.println("</body></html>");
  }
}

