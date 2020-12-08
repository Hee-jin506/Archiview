package bitcamp.acv.web.main;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bitcamp.acv.service.MemberService;
import bitcamp.acv.service.MovieService;
import bitcamp.acv.service.TagService;

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

    //    List<Member> members = memberService.listByPop();



  }
}
