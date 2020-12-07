package bitcamp.acv.web.tag;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bitcamp.acv.service.TagService;


@WebServlet("/tag/multipleActive")
public class TagMultipleActiveServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    TagService tagService = (TagService) ctx.getAttribute("tagService");

    String[] tagNoList = request.getParameterValues("tags");

    try {
      int count = 0;

      if (tagNoList != null) {
        for (String tagNo : tagNoList) {
          count += tagService.active(Integer.parseInt(tagNo));
        }
      }

      if (count == 0) {
        throw new Exception("해당 번호의 태그가 존재하지 않습니다.");
      } 
      response.sendRedirect("list");

    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error.jsp").forward(request, response);
    }
  }
}
