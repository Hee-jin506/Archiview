package bitcamp.acv.web.tag;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bitcamp.acv.domain.Tag;
import bitcamp.acv.service.TagService;

@WebServlet("/tag/detail")
public class TagDetailServlet  extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    TagService tagService =  (TagService) ctx.getAttribute("tagService");
    response.setContentType("text/html;charset=UTF-8");
    try {
      int no = Integer.parseInt(request.getParameter("no"));
      Tag tag = tagService.get(no);

      if (tag == null) {
        throw new Exception("해당 태그가 없습니다.");
      }

      request.setAttribute("tag", tag);
      request.getRequestDispatcher("/tag/detail.jsp").include(request, response);

    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error.jsp").forward(request, response);
    }
  }
}