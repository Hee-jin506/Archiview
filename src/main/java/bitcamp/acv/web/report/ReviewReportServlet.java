package bitcamp.acv.web.report;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bitcamp.acv.domain.Member;
import bitcamp.acv.domain.Report;
import bitcamp.acv.domain.Review;
import bitcamp.acv.service.ReportService;
import bitcamp.acv.service.ReviewService;

@WebServlet("/report/add")
public class ReviewReportServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    ReviewService reviewService =
        (ReviewService) ctx.getAttribute("reviewService");

    response.setContentType("text/html;charset=UTF-8");

    try {
      // 리뷰 번호를 가지고옴
      Review review = reviewService.get(
          Integer.parseInt(request.getParameter("no")));
      request.setAttribute("review", review);
      request.getRequestDispatcher("/report/form.jsp").include(request, response);

    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error.jsp").forward(request, response);
    }
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    ReportService reportService =
        (ReportService) ctx.getAttribute("reportService");

    try {
      Report report = new Report();
      Member loginUser = (Member) request.getSession().getAttribute("loginUser");

      if (report.getReportedType() == 2) {
        report.setReportedType(Integer.parseInt(request.getParameter("reportedType")));
        report.setWhy(request.getParameter("status"));
        report.setReportingMember(loginUser);
      }
      reportService.add(report);

    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error.jsp").forward(request, response);
    }
  }
}
