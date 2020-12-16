package bitcamp.acv.web.main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class TopbarServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void service(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    response.setContentType("text/html;charset=UTF-8");

    if (request.getAttribute("loginUser") == null) {
      HttpSession session = request.getSession();
      request.setAttribute("loginUser", session.getAttribute("loginUser"));
    }
    request.getRequestDispatcher("/main/topbar.jsp").include(request, response);
  }
}