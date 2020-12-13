package bitcamp.acv.dao.mariadb;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import bitcamp.acv.dao.ReviewDao;
import bitcamp.acv.domain.Font;
import bitcamp.acv.domain.Review;
import bitcamp.util.SqlSessionFactoryProxy;

@Repository
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
      return sqlSession.selectList("ReviewDao.findAllByKeyword", keyword);
    }
  }

  @Override
  public List<Review> findByKeyword(HashMap<String, Object> keyMap) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectList("ReviewDao.findByKeyword", keyMap);
    }
  }

  @Override
  public List<Review> findByDetailKeyword(HashMap<String, Object> keywords) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectList("ReviewDao.findByDetailKeyword", keywords);
    }
  }

  @Override
  public int delete(int no) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.update("ReviewDao.delete", no);
    }
  }

  @Override
  public int active(int no) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.update("ReviewDao.active", no);
    }
  }

  @Override
  public Review findByNo(int no) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectOne("ReviewDao.findByNo", no);
    }
  }

  // 태그명으로 리뷰를 찾는다
  @Override
  public List<Review> findByKeywordTagTitle(String keyword) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectList("ReviewDao.findByKeywordTagTitle", keyword);
    }
  }
}


