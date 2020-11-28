package bitcamp.acv.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import bitcamp.acv.domain.Member;

@WebServlet("/member/update")
public class MemberUpdateServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    request.setCharacterEncoding("UTF-8");

    // 클라이언트 전용 보관소(httpSession)를 준비한다.
    HttpSession session = request.getSession();

    //    ServletContext ctx = request.getServletContext();

    //    // 웹주소에 동봉된 데이터(Query String: qs)를 읽는다.
    //    int no = Integer.parseInt(request.getParameter("no"));

    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head>");
    out.println("<meta http-equiv='Refresh' content='1;list'>");
    out.println("<title>프로필편집</title></head>");
    out.println("<body>");
    try {
      out.println("<h1>프로필 편집</h1>");

      //      member.setNickName(request.getParameter("nick"));
      //      member.setIntro(request.getParameter("intro"));
      //      member.setPhoto(request.getParameter("photo"));

      Member member = (Member) session.getAttribute("loginUser");


      out.println("<form action='update' method='post'>");
      out.printf("이름: <input type='text' name='nick' value='%s'><br>\n",
          member.getNickName());
      out.printf("이메일: <input type='email' name='email' value='%s'><br>\n",
          member.getEmail());
      out.printf("소개: <textarea name='intro'>%s</textarea><br>\n",
          member.getIntro());
      out.println("<p>");
      out.println("<button>변경</button>");
      out.println("</p>");
      out.println("</form>");


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