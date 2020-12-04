package bitcamp.acv.web.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bitcamp.acv.domain.Member;
import bitcamp.acv.service.MemberService;

@MultipartConfig(maxFileSize = 1024 * 1024 * 10)
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

    request.getRequestDispatcher("/topbar").include(request, response);

    try {
      out.println("<h1>[회원 상세 조회]</h1>");
      int no = Integer.parseInt(request.getParameter("no"));
      Member member = memberService.get(no);

      if (member == null) {
        out.println("<p>해당 회원이 없습니다.</p>");
      } else {
        int statusLabel = member.getStatus();
        String label = "";
        switch (statusLabel) {
          case 1 : label = "활동중";
          break;
          case 2 : label = "정지중";
          break;
          case 3 : label = "탈퇴";
          break;
        }
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
        out.printf("번호 - %s<br>\n", member.getNo());
        out.printf("이름 - %s<br>\n", member.getName());
        out.printf("이메일: %s<br>\n",
            member.getEmail());
        out.printf("암호 - %s<br>\n", member.getPassword());
        out.printf("사진 - %s<br>\n", member.getPhoto());
        out.printf("닉네임: <input type='text' name='nickName' value='%s'><br>\n",
            member.getNickName());
        out.printf("소개: <textarea name='intro'>%s</textarea><br>\n",
            member.getIntro());
        out.printf("비밀번호 힌트 질문 번호 - %d<br>\n", member.getQuestionsNo());
        out.printf("비밀번호 힌트 정답 - %s<br>\n", member.getQuestionsAnswer());
        out.printf("회원 가입일 - %s<br>\n", member.getRegisteredDate());
        out.printf("회원 상태 - %s<br>\n", label);
        out.printf("회원 상태 변경일 - %s<br>\n", member.getStatusModifiedDate());
        out.println("<button>변경</button>");

        if (member.getStatus() == 1) {
          out.printf("<a href='inactive?no=%d'>삭제</a>\n", member.getNo());
        } else if (member.getStatus() == 2) {
          out.printf("<a href='active?no=%d'>부활</a>\n", member.getNo());
        } else if (member.getStatus() == 3) {
          out.println("탈퇴");
        }
        out.println("</p>");
        out.println("</form>");
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