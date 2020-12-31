package bitcamp.acv.web.listener;

import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import bitcamp.acv.domain.Member;

//@WebListener
public class AutoLoginListener implements ServletRequestListener {


  @Override
  public void requestInitialized(ServletRequestEvent sre) {
    System.out.println("ㅋㅋ 자동 로그인!");
    try {
      HttpSession session = ((HttpServletRequest)sre.getServletRequest()).getSession();

      if (session.getAttribute("loginUser") == null) {

        //        MemberService memberService =
        //            (MemberService) session.getServletContext().getAttribute("memberService");
        //
        //        Member member = memberService.get("acv1@test.com", "1111");

        Member member = new Member();
        member.setNo(1);
        member.setAuthority(1);
        member.setName("스티븐잡스");
        member.setEmail("acv1@test.com");
        member.setPassword("*89C6B530AA78695E257E55D63C00A6EC9AD3E977");
        member.setNickName("스티븐잡스");
        member.setPhoto("9d75dbe5-92fc-4c62-a0ed-116178f0f32a");
        member.setIntro("iphone 12 mini comming soon");

        session.setAttribute("loginUser", member);

      }
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
