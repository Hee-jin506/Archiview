package bitcamp.acv.web.listener;

import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import bitcamp.acv.domain.Member;
import bitcamp.acv.service.MemberService;


@WebListener
public class AutoLoginListener implements ServletRequestListener {
  @Override
  public void requestInitialized(ServletRequestEvent sre) {
    System.out.println("ㅋㅋ 자동 로그인!");
    try {
      HttpSession session = ((HttpServletRequest)sre.getServletRequest()).getSession();

      if (session.getAttribute("loginUser") == null) {
        MemberService memberService =
            (MemberService) session.getServletContext().getAttribute("memberService");
        Member member = memberService.get("aaa@test.com", "1111");
        session.setAttribute("loginUser", member);
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}