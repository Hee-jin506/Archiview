package bitcamp.acv.web.option;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import bitcamp.acv.domain.Member;

@MultipartConfig(maxFileSize = 1024 * 1024 * 10)
@WebServlet("/option/profile/update")
public class ProfileUpdateServlet extends HttpServlet {
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
    out.println("<head><title>프로필편집</title></head>");
    out.println("<body>");

    try {
      Member member = (Member) session.getAttribute("loginUser");

      if (member == null) {
        out.println("<h1>로그인이 되어있지 않습니다!</h1>");
        out.println("<meta http-equiv='Refresh' content='2;url=../../auth/login'>");
      } else {
        out.println("<form action='../../member/updatePhoto' method='post' enctype='multipart/form-data'>");
        out.printf("<input type='hidden' name='no' value='%d'><br>\n",
            member.getNo());
        out.printf("<a href='../../upload/%s'>\n<img src='../../upload/%1$s_50x50.jpg'></a>\n",
            member.getPhoto());
        out.println("<input type='file' name='photo'>");
        out.println("<button>변경</button>");
        out.println("</form>");
        out.println("<br>");

        out.println("<form action='../../member/update' method='post'>");
        out.printf("<input type='hidden' name='no' value='%d'><br>\n",
            member.getNo());
        out.printf("이메일 <p>%s</p>\n", member.getEmail());
        out.printf("닉네임 <input type='text' name='nickName' value='%s'><br>\n", member.getNickName());
        out.printf("소개 <textarea name='intro'>%s</textarea><br>\n", member.getIntro());
        out.println("<button>변경</button>");
        out.println("</form>");
      }


    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error").forward(request, response);
      return;
    }

    out.println("</body></html>");

  }
}
