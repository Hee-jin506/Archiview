package bitcamp.acv.dao.mariadb;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import bitcamp.acv.dao.ReviewDao;
import bitcamp.acv.domain.Review;
import bitcamp.util.SqlSessionFactoryProxy;


public class ReviewDaoImpl implements ReviewDao {

  SqlSessionFactoryProxy sqlSessionFactory;

  public ReviewDaoImpl(SqlSessionFactoryProxy sqlSessionFactory) {
    this.sqlSessionFactory = sqlSessionFactory;
  }

  @Override
  public List<Review> findAll() throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectList("ReviewDao.findAll");
    }
  }
}

