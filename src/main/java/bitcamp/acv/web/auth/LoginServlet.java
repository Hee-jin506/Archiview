package bitcamp.acv.web.auth;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import bitcamp.acv.domain.Member;
import bitcamp.acv.service.MemberService;

@WebServlet("/auth/login")
public class LoginServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    String email = "";

    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
      for (Cookie cookie : cookies) {
        if (cookie.getName().equals("email")) {
          email = cookie.getValue();
          break;
        }
      }
    }

    response.setContentType("text/html;charset=UTF-8");

    PrintWriter out = response.getWriter();
    request.setAttribute("email", email);
    request.getRequestDispatcher("login.jsp").include(request, response);
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    HttpSession session = request.getSession();
    ServletContext ctx = request.getServletContext();
    MemberService memberService = (MemberService) ctx.getAttribute("memberService");

    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    try {

      String email = request.getParameter("email");
      String password = request.getParameter("password");

      Cookie emailCookie = new Cookie("email", email);

      if (request.getParameter("saveEmail") != null) {
        emailCookie.setMaxAge(60 * 60 * 24 * 7);
      } else {
        emailCookie.setMaxAge(0);
      }

      response.addCookie(emailCookie);

      Member member = memberService.get(email, password);

      if (member == null) {
        request.getRequestDispatcher("failToLogin.jsp").include(request, response);
        response.setHeader("Refresh", "3;url=login");
      } else if (member.getStatus() == 3) {
        request.getRequestDispatcher("withdrawedMember.jsp").include(request, response);
        response.setHeader("Refresh", "3;url=login");
      } else {
        session.setAttribute("loginUser", member);
        response.sendRedirect("../index.html");
        return;
      }

    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error").forward(request, response);
      return;
    }
  }
}
