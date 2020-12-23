package bitcamp.acv.web.listener;

import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import org.springframework.beans.factory.annotation.Autowired;
import bitcamp.acv.domain.Member;
import bitcamp.acv.domain.Movie;
import bitcamp.acv.domain.Tag;
import bitcamp.acv.service.MemberService;
import bitcamp.acv.service.MovieService;
import bitcamp.acv.service.TagService;

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
