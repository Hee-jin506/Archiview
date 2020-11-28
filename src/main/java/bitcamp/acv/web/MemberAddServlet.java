package bitcamp.acv.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import bitcamp.acv.domain.Member;
import bitcamp.acv.service.MemberService;

@MultipartConfig(maxFileSize = 1024 * 1024 * 10)
@WebServlet("/member/add")
public class MemberAddServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    MemberService memberService =  (MemberService) ctx.getAttribute("memberService");
    //    response.setContentType("text/html;charset=UTF-8");

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
    //    member.setPhoto(request.getParameter("photo"));
    member.setIntro(request.getParameter("intro"));
    member.setQuestionsNo(Integer.parseInt(request.getParameter("questionsNo")));
    member.setQuestionsAnswer(request.getParameter("questionsAnswer"));

    // 입력값 꺼내기
    Part photoPart = request.getPart("photo");

    // 회원 사진을 저장할 위치
    // ->컨텍스트루트/upload/파일
    // 파일을 저장할 대 사용할 파일명을 준비한다.
    String filename = UUID.randomUUID().toString();
    String saveFilePath = ctx.getRealPath("/upload/" + filename);

    // 해당 위치에 업로드 된 사진 파일을 저장한다.
    photoPart.write(saveFilePath);

    // db에 사진 파일 이름을 저장하기 위해 객체에 보관한다.
    member.setPhoto(filename);

    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head>");
    //    out.println("<meta http-equiv='Refresh' content='1;url=list'>");
    out.println("<title>회원 등록</title></head>");
    out.println("<body>");
    try {
      out.println("<h1>회원 등록</h1>");

      memberService.add(member);

      out.println("<p>회원 등록이 완료되었습니다.</p>");

    } catch (Exception e) {
      out.println("<h2>작업 처리 중 오류 발생!</h2>");
      out.printf("<pre>%s</pre>\n", e.getMessage());

      StringWriter errOut = new StringWriter();
      e.printStackTrace(new PrintWriter(errOut));
      out.println("<h3>상세 오류 내용</h3>");
      out.printf("<pre>%s</pre>\n", errOut.toString());
    }

    out.println("</body>");
    out.println("</html>");
  }
}



