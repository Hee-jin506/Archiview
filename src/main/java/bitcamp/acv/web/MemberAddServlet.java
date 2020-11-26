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
import bitcamp.acv.domain.Member;
import bitcamp.acv.service.MemberService;

@WebServlet("/member/add")
public class MemberAddServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    MemberService memberService =  (MemberService) ctx.getAttribute("memberService");
    response.setContentType("text/html;charset=UTF-8");

    // 클라이언트가 post 요청할 때 보낸 데이터를 읽는다.
    request.setCharacterEncoding("UTF-8");

    Member member = new Member();
    member.setAuthority(1);
    member.setStatus(1);
    member.setLoginNo(Integer.parseInt((request.getParameter("loginNo"))));
    member.setName(request.getParameter("name"));
    member.setEmail(request.getParameter("email"));
    member.setPassword(request.getParameter("password"));
    member.setNickName(request.getParameter("nickName"));
    member.setPhoto(request.getParameter("photo"));
    member.setIntro(request.getParameter("intro"));
    member.setQuestionsNo(Integer.parseInt(request.getParameter("questionsNo")));
    member.setQuestionsAnswer(request.getParameter("questionsAnswer"));
    
    System.out.println(member.getAuthority());

    //    // 로그인 할 회원의 정보가 들어있는 세션 객체를 얻는다.
    //    HttpSession session = request.getSession();

    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head>");
//    out.println("<meta http-equiv='Refresh' content='1;list'>");
    out.println("<title>멤버 등록</title></head>");
    out.println("<body>");
    try {
      out.println("<h1>멤버 등록</h1>");

      memberService.add(member);

      out.println("게시글을 등록하였습니다.");

    } catch (Exception e)  {
      out.printf("<p>게시글 목록 조회 중 오류 발생 -%s</p>\n", e.getMessage());

      StringWriter errOut = new StringWriter();
      e.printStackTrace(new PrintWriter(errOut));

      out.printf("<pre?%s</pre>\n", errOut.toString());
    }
    out.println("</body>");
    out.println("</html>");
  }
}



