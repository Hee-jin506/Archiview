package bitcamp.acv.web.tag;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bitcamp.acv.domain.Tag;
import bitcamp.acv.service.TagService;

@WebServlet("/tag/search")
public class TagSearchServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    TagService tagService =  (TagService) ctx.getAttribute("tagService");
    response.setContentType("text/html;charset=UTF-8");
    try {

      String keyword = request.getParameter("keyword");
      String selectedTagTitle = request.getParameter("selectedTagTitle");
      if (keyword != null) {
        List<Tag> tagList = tagService.listByKeywordTitle(keyword);
        request.setAttribute("tagList", tagList);
        request.getRequestDispatcher("tagSearch.jsp").include(request, response);
      }
      if (selectedTagTitle != null) {
        Tag selectedTag = tagService.get(selectedTagTitle);
        request.setAttribute("selectedTag", selectedTag);
        request.getRequestDispatcher("tagSearch.jsp").include(request, response);
      }

    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error.jsp").forward(request, response);
    }
  }
}

