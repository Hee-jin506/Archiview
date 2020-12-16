package bitcamp.acv.web.report;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bitcamp.acv.domain.Report;
import bitcamp.acv.service.ReportService;

public class ReportUpdateServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    ReportService reportService =
        (ReportService) ctx.getAttribute("reportService");

    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    try {

      Report report = new Report();
      report.setNo(Integer.parseInt(request.getParameter("no")));
      report.setStatus(request.getParameter("status"));
      report.setProcessingContent(request.getParameter("processingContent"));
      report.setProcessedDate(Date.valueOf(request.getParameter("processedDate")));

      if (reportService.update(report) == 0) {
        throw new Exception("해당 번호의 게시글이 없습니다.");
      }

      response.sendRedirect("list");
    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error").forward(request, response);
      return;
    }

    out.println("</body>");
    out.println("</html>");
  }
}
