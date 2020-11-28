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
import bitcamp.acv.service.MemberService;


@WebServlet("/member/delete")
public class MemberDeleteServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    MemberService boardService =
        (MemberService) ctx.getAttribute("memberService");

    // 웹주소에 동봉된 데이터(Query String: qs)를 읽는다.
    int no = Integer.parseInt(request.getParameter("no"));

    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head>");
    // 일단 리스트로 돌아가도록 해놨습니다.
    out.println("<meta http-equiv='Refresh' content='1;list'>");
    out.println("<title>회원삭제</title></head>");
    out.println("<body>");
    try {
      out.println("<h1>회원 삭제</h1>");


      int count = boardService.delete(no);
      try {
        if (count == 0) {
          out.printf("<p>해당 번호의 게시물이 존재하지 않습니다.</p>\n");
        } else {
          out.printf("<p>게시글을 삭제하였습니다.</p>\n");
        }
      } catch (Exception e) {
        out.println("게시글 삭제 중 오류 발생!");
        e.printStackTrace();
      }

    } catch (Exception e) {
      out.printf("<h2>작업 처리 중 오류 발생!</h2>");
      out.printf("<pre>%s</pre>\n", e.getMessage());

      StringWriter errOut = new StringWriter();
      e.printStackTrace(new PrintWriter(errOut));

      out.printf("<h3>상세 오류 내용</h3>");
      out.printf("<pre>%s</pre>\n", errOut.toString());
    }

    out.println("</body>");
    out.println("</html>");
  }


}
