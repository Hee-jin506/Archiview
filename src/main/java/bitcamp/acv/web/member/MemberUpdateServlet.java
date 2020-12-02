package bitcamp.acv.web.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bitcamp.acv.domain.Member;
import bitcamp.acv.service.MemberService;

@WebServlet("/member/update")
public class MemberUpdateServlet extends HttpServlet {
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
    out.println("<head>");
    // out.println("<meta http-equiv='Refresh' content='1;list'>");
    out.println("<title>프로필편집</title></head>");
    out.println("<body>");
    try {
      out.println("<h1>프로필 편집</h1>");
      
      Member member = new Member();
      member.setNo(Integer.parseInt(request.getParameter("no")));
      member.setNickName(request.getParameter("nickName"));
      member.setIntro(request.getParameter("intro"));

      memberService.update(member);

      out.println("<p>유저 프로필을 변경하였습니다.</p>");

    } catch (Exception e) {
      out.printf("<h2>작업 처리 중 오류 발생!</h2>");
      out.printf("<pre>%s</pre>\n", e.getMessage());

      StringWriter errOut = new StringWriter();
      e.printStackTrace(new PrintWriter(errOut));

      out.printf("<h3>상세 오류 내용</h3>");
      out.printf("<pre>%s</pre>\n", errOut.toString());
    }

    out.println("</body></html>");
  }
}