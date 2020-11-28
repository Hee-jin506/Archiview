package bitcamp.acv.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import bitcamp.acv.domain.Member;
import bitcamp.acv.service.MemberService;

@WebServlet("/auth/login")
public class LoginServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    // 클라이언트 전용 보관소(세션)을 준비한다.
    HttpSession session = request.getSession();

    // 클라이언트로 데이터를 출력할 때 사용할 스트림 준비
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head><title>로그인</title></head>");
    out.println("<body>");

    try {
      out.println("<h1>로그인</h1>");

      out.println("<a href='form.html'>새 회원</a><br>");

      if (session.getAttribute("loginUser") != null) {
        out.println("<p>로그인 된 상태입니다!</p>");

      } else {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // 서블릿이 로그인 작업에 사용할 도구를 준비한다.
        // 서블릿 컨테이너는 웹 어플리케이션 당 1개
        ServletContext ctx = request.getServletContext();
        // 리턴 타입이 오브젝트이기 때문에 형변환을 해줘야 한다.
        MemberService memberService = (MemberService) ctx.getAttribute("memberService");

        Member member = memberService.get(email, password);
        if (member == null) {
          out.println("<p>사용자 정보가 맞지 않습니다.</p>");

        } else {
          // 로그인이 성공했으면 회원 정보를
          // 각 클라이언트의 전용 보관소인 session에 저장한다.
          session.setAttribute("loginUser", member);
          out.printf("<p>%s 님 반갑습니다.</p>\n", member.getName());

          out.println("<button>변경</button>");

        }
      }
    } catch (Exception e) {
      out.printf("<h2>작업 처리 중 오류 발생!</h2>");
      out.printf("<pre>%s</pre>\n", e.getMessage());

      StringWriter errOut = new StringWriter();
      e.printStackTrace(new PrintWriter(errOut));

      out.printf("<h3>상세 오류 내용</h3>");
      out.printf("<pre>%s</pre>\n", errOut.toString());
    }

    out.println("</body>");
    out.println("</html>");
  }
}