package bitcamp.acv.web.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import bitcamp.acv.dao.MemberDao;
import bitcamp.acv.dao.MovieDao;
import bitcamp.acv.dao.ReviewDao;
import bitcamp.acv.dao.TagDao;
import bitcamp.acv.dao.mariadb.MemberDaoImpl;
import bitcamp.acv.dao.mariadb.MovieDaoImpl;
import bitcamp.acv.dao.mariadb.ReviewDaoImpl;
import bitcamp.acv.dao.mariadb.TagDaoImpl;
import bitcamp.acv.service.DefaultMemberService;
import bitcamp.acv.service.DefaultMovieService;
import bitcamp.acv.service.DefaultReviewService;
import bitcamp.acv.service.DefaultTagService;
import bitcamp.acv.service.MemberService;
import bitcamp.acv.service.MovieService;
import bitcamp.acv.service.ReviewService;
import bitcamp.acv.service.TagService;
import bitcamp.util.SqlSessionFactoryProxy;

@WebListener
public class DataHandlerListener implements ServletContextListener {

  @Override
  public void contextInitialized(ServletContextEvent sce) {
    try {
      // Mybatis 객체 준비
      SqlSessionFactoryProxy sqlSessionFactory = new SqlSessionFactoryProxy(
          new SqlSessionFactoryBuilder().build(
              Resources.getResourceAsStream("bitcamp/acv/conf/mybatis-config.xml")));

      // DAO 구현체 생성
      MovieDao movieDao = new MovieDaoImpl(sqlSessionFactory);
      MemberDao memberDao = new MemberDaoImpl(sqlSessionFactory);
      TagDao tagDao = new TagDaoImpl(sqlSessionFactory);
      ReviewDao reviewDao = new ReviewDaoImpl(sqlSessionFactory);


      // Service 구현체 생성
      MovieService movieService = new DefaultMovieService(movieDao);
      MemberService memberService = new DefaultMemberService(memberDao);
      TagService tagService = new DefaultTagService(tagDao);
      ReviewService reviewService = new DefaultReviewService(reviewDao, tagDao, sqlSessionFactory);


      ServletContext ctx = sce.getServletContext();


      // 다른 객체가 사용할 수 있도록 context 맵 보관소에 저장해둔다.
      ctx.setAttribute("movieService", movieService);
      ctx.setAttribute("memberService", memberService);
      ctx.setAttribute("tagService", tagService);
      ctx.setAttribute("reviewService", reviewService);

    } catch (Exception e) {
      System.out.println("Mybatis 및 DAO, 서비스 객체 준비 중 오류 발생!");
      e.printStackTrace();
    }
  }

}
