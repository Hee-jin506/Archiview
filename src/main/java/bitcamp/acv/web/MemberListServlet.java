package bitcamp.acv.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bitcamp.acv.domain.Member;
import bitcamp.acv.service.MemberService;

@WebServlet("/member/list")
public class MemberListServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    MemberService memberService =  (MemberService) ctx.getAttribute("memberService");
    response.setContentType("text/html;charset=UTF-8");

    PrintWriter out = response.getWriter();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head><title>멤버 목록</title></head>");
    out.println("<body>");

    try {
      out.println("<h1>[멤버 목록]</h1>");

      List<Member> list = memberService.list();

      out.println("<table border=\"1\">");
      out.println("<tr>");
      out.println("<th>회원 번호</th>");
      out.println("<th>권한</th>");
      out.println("<th>이름</th>");
      out.println("<th>로그인 유형 번호</th>");
      out.println("<th>이메일</th>");
      out.println("<th>암호</th>");
      out.println("<th>별명</th>");
      out.println("<th>사진</th>");
      out.println("<th>소개글</th>");
      out.println("<th>비밀번호 힌트 질문 번호</th>");
      out.println("<th>비밀번호 힌트 정답</th>");
      out.println("<th>회원 가입일</th>");
      out.println("<th>회원 상태 번호</th>");
      out.println("<th>회원 상태 변경일</th>");
      out.println("</tr>");

      //      for (Member member : list ) {
      //        StringBuilder stillCuts = new StringBuilder();
      //        for (String stillCut : member.getStillCuts()) {
      //          stillCuts.append(stillCut);
      //          stillCuts.append("\n");
      //        }
      //
      //        StringBuilder posters = new StringBuilder();
      //        for (String poster : movie.getPosters()) {
      //          posters.append(poster);
      //          posters.append("\n");
      //        }
      //
      //        StringBuilder genres = new StringBuilder();
      //        for (String genre : movie.getGenres()) {
      //          genres.append(genre);
      //          genres.append("\n");
      //        }

      for (Member member : list ) {

        out.println("<tr>");
        out.printf(""
            + "<td>%d</td>" // no
            + "<td>%d</td>" // auto
            + "<td>%s</td>" // name
            + "<td>%d</td>" // login
            + "<td>%s</td>" // email
            + "<td>%s</td>" // pw
            + "<td>%s</td>" // nick
            + "<td><img src=\"%s\" alt=\"사진추가\" width=\"120\" /></td>" // photo
            + "<td>%s</td>" // intro
            + "<td>%d</td>" // qno
            + "<td>%s</td>" // qan
            + "<td>%s</td>" // rdt
            + "<td>%d</td>" // stat
            + "<td>%s</td>", // smdt
            member.getNo(),
            member.getAuthority(),
            member.getName(),
            member.getLoginNo(),
            member.getEmail(),
            member.getPassword(),
            member.getNickName(),
            member.getPhoto(),
            member.getIntro(),
            member.getQuestionsNo(),
            member.getQuestionsAnswer(),
            member.getRegisteredDate(),
            member.getStatus(),
            member.getStatusModifiedDate()
            );
        out.println("</tr>");
      }
      out.println("</table>");

    } catch (Exception e) {
      out.printf("작업 처리 중 오류 발생! - %s\n", e.getMessage());
      StringWriter errOut = new StringWriter();
      e.printStackTrace(new PrintWriter(errOut));
      out.printf("<pre>%s</pre>\n", errOut.toString());
    }
    out.println("</body>");
    out.println("</html>");
  }
}


