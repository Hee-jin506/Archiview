package bitcamp.acv.web.report;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bitcamp.acv.domain.Report;
import bitcamp.acv.service.ReportService;

@WebServlet("/report/list")
public class ReportListServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    ReportService reportService = (ReportService) ctx.getAttribute("reportService");

    response.setContentType("text/html;charset=UTF-8");

    try {

      List<Report> list = null;

      String keyword = request.getParameter("keyword");

      if (keyword != null) {
        list = reportService.list(keyword);

      } else {
        list = reportService.list();
      }

      request.setAttribute("list", list);
      request.getRequestDispatcher("/report/list.jsp").include(request, response);

    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error.jsp").forward(request, response);
    }
  }
}
