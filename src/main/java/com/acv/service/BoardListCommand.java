package com.eomcs.pms.handler;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.eomcs.pms.domain.Board;
import com.eomcs.pms.service.BoardService;

@WebServlet("/board/list")
public class BoardListCommand extends HttpServlet {

  private static final long serialVersionUID = 1L;
  
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    
    ServletContext ctx = request.getServletContext();
    BoardService boardService =  (BoardService) ctx.getAttribute("boardService");
    response.setContentType("text/html;charset=UTF-8");
    
    PrintWriter out = response.getWriter();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head><title>게시글 목록</title></head>");
    out.println("<body>");
    try {
      out.println("<h1>[게시물 목록]</h1>");
      
      List<Board> list = boardService.list();

      out.println("<table border=\"1\">");
      out.println("<tr>");
      out.println("<th>번호</th>");
      out.println("<th>제목</th>");
      out.println("<th>작성자</th>"); 
      out.println("<th>등록일</th>");
      out.println("<th>조회수</th>");
      out.println("</tr>");
      for (Board board : list ) {
        out.println("<tr>");
        out.printf("<td>%d</td> <td>%sd</td>  <td>%s</td>  <td>%s</td>  <td>%d</td>",         
            board.getNo(),
            board.getTitle(),
            board.getWriter().getName(),
            board.getRegisteredDate(),
            board.getViewCount());
        out.println("</tr>");
      }
      out.println("</table>");

    } catch (Exception e) {
      out.printf("작업 처리 중 오류 발생! - %s\n", e.getMessage());
      StringWriter errOut = new StringWriter();
      e.printStackTrace(new PrintWriter(errOut));
      out.printf("<pre>%s</pre>\n", errOut.toString());
    }
    out.println("</body>");
    out.println("</html>");
  }
}
