package bitcamp.acv.web.member;

import java.io.IOException;
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

    try {

      String keyword = request.getParameter("keyword");

      // 총 회원수
      //      out.printf("<span>총 회원수 : %d</span><br>", memberService.list().size());

      List<Member> list = memberService.list(keyword);

      request.setAttribute("list", list);
      request.getRequestDispatcher("/member/list.jsp").include(request, response);


    }  catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error.jsp").forward(request, response);
    }
  }
}
