package bitcamp.acv.web.main;

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
import bitcamp.acv.service.MovieService;
import bitcamp.acv.service.TagService;

@WebServlet("/main/sidebar")
public class SidBarServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void service(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    MemberService memberService =  (MemberService) ctx.getAttribute("memberService");
    TagService tagService =  (TagService) ctx.getAttribute("tagService");
    MovieService movieService =  (MovieService) ctx.getAttribute("movieService");

    response.setContentType("text/html;charset=UTF-8");
    try {
      List<Member> members = memberService.listByPop();

      Member[] topMembers = new Member[3];
      for (int i = 0; i < 3; i++) {
        topMembers[i] = members.get(i);
      }
      request.setAttribute("topMembers", topMembers);
      request.getRequestDispatcher("sidebar.jsp").include(request, response);

    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error").forward(request, response);
      return;
    }
  }
}
