package bitcamp.acv.web.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class AppInitListener implements ServletContextListener {

  @Override
  public void contextInitialized(ServletContextEvent sce) {
    System.out.println("아카이뷰다");
  }

  @Override
  public void contextDestroyed(ServletContextEvent sce) {
    System.out.println("아카이뷰 종료");
  }
}
