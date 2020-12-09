package bitcamp.acv.web.main;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/main/search")
public class SearchServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;


  @Override
  protected void service(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();

    try {
      // 검색 키워드 파라미터
      String keyword = request.getParameter("keyword");

      // 태그 검색 후 선택한 태그, keyword는 null이다
      String selectedTagTitle = request.getParameter("selectedTagTitle");

      if (keyword != null) {
        // 키워드 맨 앞글자가 '#'이 아니면 topBarNonTagSearch.jsp를 include
        if(keyword.toCharArray()[0] != '#') {
          request.setAttribute("keyword", keyword);
          request.getRequestDispatcher("topBarNonTagSearch.jsp").include(request, response);

          // 맨 앞글자가 '#'이면 topBarTagSearch.jsp를 include
        } else {

          // #을 뗀다
          request.setAttribute("keyword", keyword.substring(1));
          request.getRequestDispatcher("topBarTagSearch.jsp").include(request, response);
        }
      } else {
        // 태그를 선택한 후(keyword는 null임)
        request.setAttribute("selectedTagTitle", selectedTagTitle);
        request.getRequestDispatcher("topBarBestReviewSearch.jsp").include(request, response);
      }



    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error.jsp").forward(request, response);
    }
  }
}


