package bitcamp.acv.dao.mariadb;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import bitcamp.acv.dao.ReviewDao;
import bitcamp.acv.domain.Font;
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

  @Override
  public List<Font> findFonts() throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectList("ReviewDao.findFonts");
    }
  }

  @Override
  public int insert(Review review) {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.insert("ReviewDao.insert", review);
    }
  }




  @Override
  public List<Review> findAllByKeyword(String keyword) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectList("ReviewDao.findAllByKeyword",keyword);
    }
  }

  @Override
  public List<Review> findByKeyword(HashMap<String, Object> keyMap) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectList("ReviewDao.findAllByKeyword", keyMap);
    }
  }

  @Override
  public List<Review> findByDetailKeyword(HashMap<String, Object> keywords) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectList("ReviewDao.findByDetailKeyword", keywords);
    }
  }
}


