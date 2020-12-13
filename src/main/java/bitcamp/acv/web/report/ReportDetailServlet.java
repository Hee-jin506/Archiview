package bitcamp.acv.web.report;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bitcamp.acv.domain.Comment;
import bitcamp.acv.domain.Member;
import bitcamp.acv.domain.Report;
import bitcamp.acv.domain.Review;
import bitcamp.acv.domain.Tag;
import bitcamp.acv.service.ReportService;

@MultipartConfig(maxFileSize = 1024 * 1024 * 10)
@WebServlet("/report/detail")
public class ReportDetailServlet extends HttpServlet{
  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    ReportService reportService =
        (ReportService) ctx.getAttribute("reportService");

    int no = Integer.parseInt(request.getParameter("no"));

    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    try {
      Report report = reportService.get(no);

      if (report == null) {
        out.println("<p>해당 신고 번호가 없습니다.</p>");
      } else {

        // targer 객체 생성 후 조건에 맞춰서 .jsp 불러오기
        Object target = reportService.getTarget(report);
        if (target instanceof Member) {
          request.setAttribute("member", target);
          request.getRequestDispatcher("memberTarget.jsp").include(request, response);
        } else if (target instanceof Review) {
          request.setAttribute("review", target);
          request.getRequestDispatcher("reviewTarget.jsp").include(request, response);
        }  else if (target instanceof Tag) {
          request.setAttribute("tag", target);
          request.getRequestDispatcher("tagTarget.jsp").include(request, response);
        } else if (target instanceof Comment) {
          request.setAttribute("comment", target);
          request.getRequestDispatcher("commentTarget.jsp").include(request, response);
        } else {
          throw new Exception("신고 상세정보 처리 중 오류 발생!");
        }

        request.setAttribute("report", report);
        request.getRequestDispatcher("/report/detail.jsp").include(request, response);
      }

    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error").forward(request, response);
    }
  }
}
