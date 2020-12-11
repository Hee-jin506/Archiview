package bitcamp.acv.web.option;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import bitcamp.acv.domain.Member;

@MultipartConfig(maxFileSize = 1024 * 1024 * 10)
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
      out.println("<p>로그인 된 상태가 아닙니다.</p>");
    } else {

      try {
        out.println("<h1>[회원 프로필]</h1>");

        out.println("<form action='updatePhoto' method='post' enctype='multipart/form-data'>");
        out.printf("<input type='hidden' name='no' value='%d'><br>\n",
            member.getNo());
        out.printf("<a href='../upload/%s'>\n<img src='../upload/%1$s_150x150.jpg'></a><br>\n",
            member.getPhoto());
        out.println("<input type='file' name='photo'>");
        out.println("<button>변경</button>");
        out.println("</form>");
        out.println("<br>");

        out.println("<form action='update' method='post'>");
        out.printf("<input type='hidden' name='no' value='%d'><br>\n",
            member.getNo());
        out.printf("이메일: %s<br>\n",
            member.getEmail());
        out.printf("닉네임: <input type='text' name='nickName' value='%s'><br>\n",
            member.getNickName());
        out.printf("소개: <textarea name='intro'>%s</textarea><br>\n",
            member.getIntro());
        out.printf("비밀번호 힌트 질문 번호 - %d<br>\n", member.getQuestionsNo());
        out.printf("비밀번호 힌트 정답 - %s<br>\n", member.getQuestionsAnswer());
        out.println("<button>변경</button>");

        if (member.getStatus() == 1 || member.getStatus() == 2) {
          out.printf("<a href='../option/member/withdraw'>탈퇴</a>\n");
        }
      } catch (Exception e) {
        out.printf("<p>작업 처리 중 오류 발생! - %s</p>\n", e.getMessage());

        StringWriter errOut = new StringWriter();
        e.printStackTrace(new PrintWriter(errOut));

        out.printf("<pre>%s</pre>\n", errOut.toString());
      }

      out.println("</body></html>");
    }
  }
}