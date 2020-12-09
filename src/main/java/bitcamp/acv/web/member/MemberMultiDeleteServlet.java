package bitcamp.acv.web.member;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bitcamp.acv.service.MemberService;

@WebServlet("/member/multipleDelete")
public class MemberMultiDeleteServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    MemberService memberService =
        (MemberService) ctx.getAttribute("memberService");

    String[] memberNoList = request.getParameterValues("members");

    PrintWriter out = response.getWriter();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head>");
    out.println("<meta http-equiv='Refresh' content='1;list'>");
    out.println("<title>회원 선택 삭제</title></head>");
    out.println("<body>");
    try {
      out.println("<h1>회원 선택 삭제</h1>");

      try {
        int count = 0;

        if (memberNoList != null) {
          for (String memberNo : memberNoList) {
            count += memberService.inactive(Integer.parseInt(memberNo));
          }
        }

        if (count == 0) {
          out.printf("<p>해당 회원이 존재하지 않습니다.</p>\n");
        } else {
          out.printf("<p>회원을 삭제하였습니다.</p>\n");
        }
      } catch (Exception e) {
        out.println("회원 삭제 중 오류 발생!");
        e.printStackTrace();
      }

    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error.jsp").forward(request, response);
    }
  }
}
