
package bitcamp.acv.web;

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
import bitcamp.acv.service.MovieService;
import bitcamp.acv.service.ReviewService;
import bitcamp.acv.service.TagService;

@Controller
@RequestMapping("/auth")
public class AuthController {

  @Autowired MemberService memberService;
  @Autowired MovieService movieService;
  @Autowired TagService tagService;
  @Autowired ReviewService reviewService;

  @RequestMapping("login")
  public ModelAndView login(HttpServletRequest request, HttpServletResponse response, String email, String password) throws Exception {
    ModelAndView mv = new ModelAndView();
    mv.addObject("topMembers", memberService.listByPop3());
    mv.addObject("topMovies", movieService.listByPop3());
    mv.addObject("topTags", tagService.listByPop3());



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
      mv.setViewName("auth/login");
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
      mv.setViewName("auth/login");
    } else if (member.getStatus() == 3) {
      withdrawedMember = true;
      mv.addObject("wrongInput", wrongInput);
      mv.addObject("withdrawedMember", withdrawedMember);
      mv.setViewName("auth/login");
    } else {
      session.setAttribute("loginUser", member);
      mv.setViewName("redirect:/app/main");
    }
    return mv;
  }

  @RequestMapping("logout")
  public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response)
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
  public ModelAndView emailCheck(HttpSession session, HttpServletRequest request, HttpServletResponse response, String email) throws Exception {
    ModelAndView mv = new ModelAndView();
    if (memberService.get(email) == null) {
      mv.addObject("msg", "가입된 이메일이 아닙니다.");
      mv.addObject("url", "emailcheck.jsp");
    } else {
      Member searchUser = memberService.get(email);
      session.setAttribute("searchUser", searchUser);
      mv.setViewName("auth/hint");
    }
    return mv;
  }

  @RequestMapping("hintCheck")
  public ModelAndView hintCheck(HttpSession session, HttpServletRequest request, HttpServletResponse response, String hint) throws Exception {
    ModelAndView mv = new ModelAndView();
    Member member = (Member) session.getAttribute("searchUser");
    if (!member.getQuestionsAnswer().equals(hint)) {
      throw new Exception("<p>답변이 옳지 않습니다.</p>");
    } else {
      mv.setViewName("auth/updatePassword");
    }
    return mv;
  }

  @RequestMapping("update")
  public String update(HttpSession session, HttpServletRequest request, HttpServletResponse response, String password, String password2) throws Exception {
    if (!password.equals(password2)) {
      throw new Exception("<p>비밀번호가 일치하지 않습니다.</p>");
    } else {
      Member member = (Member) session.getAttribute("searchUser");
      member.setPassword(password);
      memberService.updatePassword(member);
      session.invalidate();
    }
    return "redirect:/app/auth/login";
  }

  @RequestMapping("searchPassword")
  public String searchPassword() {
    return "auth/searchPassword";
  }

  @RequestMapping("add")
  public String add() {
    return "auth/add1";
  }

  @RequestMapping("add1")
  public String add1(
      int loginNo,
      String name,
      String email,
      String password,
      String nickName,
      HttpSession session) throws Exception {

    Member newMember = new Member();
    newMember.setAuthority(1);
    newMember.setStatus(1);
    newMember.setLoginNo(loginNo);
    newMember.setName(name);
    newMember.setEmail(email);
    newMember.setPassword(password);
    newMember.setNickName(nickName);
    session.setAttribute("newMember", newMember);

    return "auth/add2";
  }

  @RequestMapping("add2")
  public String add2(int questionsNo, String questionsAnswer, HttpSession session) throws Exception {

    Member newMember = (Member) session.getAttribute("newMember");
    newMember.setQuestionsNo(questionsNo);
    newMember.setQuestionsAnswer(questionsAnswer);
    newMember.setPhoto("user");
    newMember.setIntro("소개글을 입력하세요");
    memberService.add(newMember);
    return "auth/add3";
  }

}
