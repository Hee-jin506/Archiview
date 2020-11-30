package bitcamp.acv.web.writeReview;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bitcamp.acv.domain.Movie;

@WebServlet("/write/editCard")
public class ReviewEditServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");

    PrintWriter out = response.getWriter();


    try {

      out.println("<!DOCTYPE html>");
      out.println("<html>");
      out.println("<head>");
      out.println("<title>후기 등록 : 카드 편집</title></head>");
      out.println("<body>");
      out.println("<h1>자기만의 감성으로 카드를 꾸며주세요!</h1>");
      out.printf("<img src='%s'>", request.getParameter("stc"));

      out.println("<form>");
      out.println("<label>폰트");
      out.println("<select multiple='multiple' name='font'>");

      out.println("<option value=''></option>\n" +
          "        <option value=\"dduk\">떡볶이</option>\n" +
          "        <option selected>순대</option>\n" +
          "        <option>오뎅</option>\n" +
          "    </select>"
          + "</label>")
    }

  }
