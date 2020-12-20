
package bitcamp.acv.web.auth;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import bitcamp.acv.domain.Member;
import bitcamp.acv.service.MemberService;

@Controller
@RequestMapping("/auth")
public class AuthController {

  @Autowired MemberService memberService;

  @RequestMapping("login")
  protected ModelAndView login(HttpServletRequest request, HttpServletResponse response, String email, String password) throws Exception {
    ModelAndView mv = new ModelAndView();
    boolean wrongInput = false;
    boolean withdrawedMember = false;

    if (request.getMethod().equals("GET")) {
      String cookieEmail = "";

      Cookie[] cookies = request.getCookies();
      if (cookies != null) {
        for (Cookie cookie : cookies) {
          if (cookie.getName().equals("email")) {
            cookieEmail = cookie.getValue();
            break;
          }
        }
      }

      mv.addObject("wrongInput", wrongInput);
      mv.addObject("withdrawedMember", withdrawedMember);
      mv.addObject("email", cookieEmail);
      mv.setViewName("/auth/login.jsp");
      return mv;
    }

    HttpSession session = request.getSession();
    Cookie emailCookie = new Cookie("email", email);

    if (request.getParameter("saveEmail") != null) {
      emailCookie.setMaxAge(60 * 60 * 24 * 7);
    } else {
      emailCookie.setMaxAge(0);
    }

    response.addCookie(emailCookie);

    Member member = memberService.get(email, password);

    if (member == null) {
      wrongInput = true;
      mv.addObject("wrongInput", wrongInput);
      mv.addObject("withdrawedMember", withdrawedMember);
      mv.setViewName("/auth/login.jsp");
    } else if (member.getStatus() == 3) {
      withdrawedMember = true;
      mv.addObject("wrongInput", wrongInput);
      mv.addObject("withdrawedMember", withdrawedMember);
      mv.setViewName("/auth/login.jsp");
    } else {
      session.setAttribute("loginUser", member);
      mv.addObject("loginUser", member);
      mv.setViewName("/");
    }
    return mv;
  }

  @RequestMapping("logout")
  protected String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response)
      throws Exception {

    Member loginUser = (Member) session.getAttribute("loginUser");
    if (loginUser == null) {
      throw new Exception("<p>로그인 된 상태가 아닙니다!</p>");
    } else {
      session.invalidate();
      return "redirect:/app/auth/login";
    }
  }

  @RequestMapping("emailCheck")
  protected ModelAndView emailCheck(HttpServletRequest request, HttpServletResponse response, String email) throws Exception {
    ModelAndView mv = new ModelAndView();
    if (memberService.get(email) == null) {
      throw new Exception("<p>가입된 이메일이 아닙니다.</p>");
    } else {
      Member searchUser = memberService.get(email);
      mv.addObject("searchUser", searchUser);
      mv.setViewName("/auth/hint.jsp");
    }
    return mv;
  }
}
