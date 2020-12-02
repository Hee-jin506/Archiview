package bitcamp.acv.dao.mariadb;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import bitcamp.acv.dao.MovieDao;
import bitcamp.acv.domain.Movie;
import bitcamp.util.SqlSessionFactoryProxy;


public class MovieDaoImpl implements MovieDao {

  SqlSessionFactoryProxy sqlSessionFactory;

  public MovieDaoImpl(SqlSessionFactoryProxy sqlSessionFactory) {
    this.sqlSessionFactory = sqlSessionFactory;
  }

  //  @Override
  //  public int insert(Movie movie) throws Exception {
  //
  //    // 커넥션 객체에서 수행하는 작업을 수동 커밋하도록 설정한다.
  //    con.setAutoCommit(false);
  //
  //    try {
  //      try (PreparedStatement stmt = con.prepareStatement(
  //          "insert into acv_mov(mvno,title,dir,eng_title,runtime,odt,actors,syn,nation,stat)"
  //              + " values(?,?,?,?,?,?,?,?,?,?)",
  //              Statement.RETURN_GENERATED_KEYS)) {
  //
  //        stmt.setInt(1, movie.getNo());
  //        stmt.setString(2, movie.getTitle());
  //        stmt.setString(3, movie.getDirectors());
  //        stmt.setString(4, movie.getEnglishTitle());
  //        stmt.setInt(5, movie.getRuntime());
  //        stmt.setDate(6, movie.getOpenDate());
  //        stmt.setString(7, movie.getActors());
  //        stmt.setString(8, movie.getSynopsis());
  //        stmt.setString(9, movie.getNation());
  //        stmt.setInt(10, movie.getStatus());
  //        stmt.executeUpdate();
  //
  //        // 금방 입력한 프로젝트의 no 값을 가져오기
  //        try (ResultSet keyRs = stmt.getGeneratedKeys()) {
  //          keyRs.next();
  //          movie.setNo(keyRs.getInt(1));
  //        }
  //      }
  //
  //      //      // 스틸컷
  //      //      try (PreparedStatement stmt2 = con.prepareStatement(
  //      //          "insert into acv_stc(mvno, stc_url) values(?,?)")) {
  //      //        for (String stc : movie.getStillCuts()) {
  //      //          stmt2.setInt(1, movie.getNo());
  //      //          stmt2.setString(2, stc);
  //      //          stmt2.executeUpdate();
  //      //        }
  //      //      }
  //      //
  //      //      // 포스터
  //      //      try (PreparedStatement stmt3 = con.prepareStatement(
  //      //          "insert into acv_pstr(mvno,ps_url,main_ps) values(?,?,?)")) {
  //      //        for (String pstr : movie.getPosters()) {
  //      //          stmt3.setInt(1, movie.getNo());
  //      //          stmt3.setString(2, pstr);
  //      //          stmt3.executeUpdate();
  //      //        }
  //      //      }
  //
  //      // 프로젝트 멤버의 등록까지 예외없이 정상적으로 실행되었다면,
  //      // DBMS 서버에게 작업 내용을 실제 테이블에 반영하라고 요구한다.
  //      con.commit();
  //
  //      return 1;
  //
  //    } catch (Exception e) {
  //      // 작업을 수행하는 중에 예외가 발생하면
  //      // 이전에 수행했던 작업도 되돌린다.
  //      // 즉 마지막 커밋 상태로 되돌린다.
  //      con.rollback();
  //
  //      // 예외가 발생하면 여기서 처리하지 말고 호출자에게 떠넘긴다.
  //      throw e;
  //
  //    } finally {
  //      // 정상적으로 실행하거나 또는 예외가 발생해도
  //      // DB 커넥션은 다시 원래의 auto commit 상태로 만든다.
  //      con.setAutoCommit(true);
  //    }
  //    return 0;
  //  }

  @Override
  public List<Movie> findAll() throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectList("MovieDao.findAll");
    }
  }

  @Override
  public int insert(Movie movie) throws Exception {
    // TODO Auto-generated method stub
    return 0;
  }

  @Override
  public List<Movie> findAll(String keyword) {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectList("MovieDao.findAll", keyword);
    }
  }

  @Override
  public Movie findByNo(int no) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectOne("MovieDao.findByNo", no);
    }
  }

  //  @Override
  //  public int getStillCutNo(String stillcut) throws Exception {
  //    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
  //      return sqlSession.selectOne("MovieDao.getStillCutNo", stillcut);
  //    }
  //  }

  @Override
  public String getStcUrl(int stcNo) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectOne("MovieDao.getStcUrl", stcNo);
    }
  }
}

