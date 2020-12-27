package bitcamp.acv.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;
import bitcamp.acv.domain.Member;
import bitcamp.acv.service.MemberService;

public class AutoLoginInterceptor implements HandlerInterceptor {

  MemberService memberService;

  public AutoLoginInterceptor(MemberService memberService) {
    this.memberService = memberService;
  }

  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
      throws Exception {
    System.out.println("AutoLoginInterceptor 실행!");

    if (request.getSession().getAttribute("loginUser") == null) {
      // 개발하는 동안 로그인을 자동으로 처리하기 위해
      // 임의의 사용자로 로그인 한다.
      Member member = new Member();
      member.setNo(1);
      member.setAuthority(1);
      member.setName("스티븐잡스");
      member.setEmail("acv1@test.com");
      member.setPassword("*89C6B530AA78695E257E55D63C00A6EC9AD3E977");
      member.setNickName("스티븐잡스");
      member.setPhoto("9d75dbe5-92fc-4c62-a0ed-116178f0f32a");
      member.setIntro("iphone 12 mini comming soon");
      request.getSession().setAttribute("loginUser", member);
    }
    return true;
  }

}
