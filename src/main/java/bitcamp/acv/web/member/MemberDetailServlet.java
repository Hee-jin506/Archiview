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

@WebServlet("/member/detail")
public class MemberDetailServlet  extends HttpServlet {
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
    out.println("<head><title>회원상세조회</title></head>");
    out.println("<body>");
    try {
      out.println("<h1>[회원 상세 조회]</h1>");
      int no = Integer.parseInt(request.getParameter("no"));
      Member member = memberService.get(no);

      if (member == null) {
        out.println("해당 번호의 회원 없습니다.");
        return;
      }

<<<<<<< HEAD
      //      out.printf("이메일: <input type='email' name='email' value='%s'><br>\n",
      //          member.getEmail());
      
=======
      out.println("<form action='updatePhoto' method='post' enctype='multipart/form-data'>");
      out.printf("<input type='hidden' name='no' value='%d'><br>\n",
          member.getNo());
      out.printf("<img src='../upload/%s_120x120.jpg'><br>\n",
          member.getPhoto());
      out.println("<input type='file' name='photo'>");
      out.println("<button>변경</button>");
      out.println("</form>");
      out.println("<br>");

>>>>>>> edaf65d0b082c7bc5c7b85cf561c11f52516d586
      out.println("<form action='update' method='post'>");
      out.printf("<input type='hidden' name='no' value='%d'><br>\n",
          member.getNo());
      out.printf("번호 - %s<br>\n", member.getNo());
      out.printf("이름 - %s<br>\n", member.getName());
<<<<<<< HEAD
      out.printf("이메일 - %s<br>\n", member.getEmail());
=======
      out.printf("이메일: %s<br>\n",
          member.getEmail());
>>>>>>> edaf65d0b082c7bc5c7b85cf561c11f52516d586
      out.printf("암호 - %s<br>\n", member.getPassword());
      out.printf("사진 - %s<br>\n", member.getPhoto());
      out.printf("닉네임: <input type='text' name='nick' value='%s'><br>\n",
          member.getNickName());
      out.printf("소개: <textarea name='intro'>%s</textarea><br>\n",
          member.getIntro());
      out.printf("비밀번호 힌트 질문 번호 - %d<br>\n", member.getQuestionsNo());
      out.printf("비밀번호 힌트 정답 - %s<br>\n", member.getQuestionsAnswer());
      out.printf("회원 가입일 - %s<br>\n", member.getRegisteredDate());
      out.printf("회원 상태 번호 - %s<br>\n", member.getStatus());
      out.printf("회원 상태 변경일 - %s<br>\n", member.getStatusModifiedDate());
      out.println("<button>변경</button>");
      out.printf("<a href='delete?no=%d'>삭제</a>\n", member.getNo());
      out.println("</p>");
      out.println("</form>");

    } catch (Exception e) {
      out.printf("<p>작업 처리 중 오류 발생! - %s</p>\n", e.getMessage());

      StringWriter errOut = new StringWriter();
      e.printStackTrace(new PrintWriter(errOut));

      out.printf("<pre>%s</pre>\n", errOut.toString());
    }

    out.println("</body></html>");
  }
}