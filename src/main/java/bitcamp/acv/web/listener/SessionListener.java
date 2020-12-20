package bitcamp.acv.web.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import bitcamp.acv.domain.Member;

@WebListener
public class SessionListener implements HttpSessionListener {

  @Override
  public void sessionCreated(HttpSessionEvent se) {
    System.out.println("방문자 카운터 세션 리스너 실행!");

    Member loginUser = new Member();

    int todayCount = 0;
    int totalCount = 0;

    // 전체 방문자 수 +1
    try {

      // visitCountDAO.setVisitTotalCount();
      // 오늘 방문자 수
      // todayCount = loginUser

      // 전체 방문자 수
      // totalCount = visitCountDAO.getVisitTotalCount();

    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }

    // HttpSession session = se.getSession();

    // 세션 속성에 담아준다.
    //session.setAttribute("totalCount", totalCount); // 전체 방문자 수
    //session.setAttribute("todayCount", todayCount); // 오늘 방문자 수
  }

  @Override
  public void sessionDestroyed(HttpSessionEvent se) {
  }
}
