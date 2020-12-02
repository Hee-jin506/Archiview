package bitcamp.acv.web.member;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bitcamp.acv.service.MemberService;


@WebServlet("/member/delete")
public class MemberDeleteServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    MemberService memberService =
        (MemberService) ctx.getAttribute("memberService");

    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head>");
    // 일단 리스트로 돌아가도록 해놨습니다.
    out.println("<meta http-equiv='Refresh' content='1;list'>");
    out.println("<title>회원비활성화</title></head>");
    out.println("<body>");
    try {
      out.println("<h1>회원 비활성화</h1>");
      int no = Integer.parseInt(request.getParameter("no"));

      if (memberService.inactive(no) == 0) {
        out.printf("<p>해당 회원이 존재하지 않습니다.</p>\n");
      } else {
        out.printf("<p>회원을 비활성화하였습니다.</p>\n");
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
