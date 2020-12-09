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
import bitcamp.acv.domain.Movie;
import bitcamp.acv.service.MemberService;
import bitcamp.acv.service.MovieService;

@WebServlet("/main/search")
public class SearchServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;


  @Override
  protected void service(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    MemberService memberService =  (MemberService) ctx.getAttribute("memberService");
    MovieService movieService =  (MovieService) ctx.getAttribute("movieService");

    try {
      // 검색 키워드 파라미터
      String keyword = request.getParameter("keyword");

      List<Movie> movieList = movieService.list(keyword);
      List<Member> memberList = memberService.list(keyword);

      request.setAttribute("movieList", movieList);
      request.setAttribute("memberList", memberList);
      request.getRequestDispatcher("search.jsp").include(request, response);


    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error.jsp").forward(request, response);
    }
  }
}


