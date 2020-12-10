package bitcamp.acv.dao.mariadb;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import bitcamp.acv.dao.CommentDao;
import bitcamp.acv.domain.Comment;
import bitcamp.util.SqlSessionFactoryProxy;

public class CommentDaoImpl implements CommentDao {


  SqlSessionFactoryProxy sqlSessionFactory;

  public CommentDaoImpl(SqlSessionFactoryProxy sqlSessionFactory) {
    this.sqlSessionFactory = sqlSessionFactory;
  }

  @Override
  public int insert(Comment comment) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.insert("CommentDao.insert", comment);
    }
  }

  @Override
  public List<Comment> findAll() throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectList("CommentDao.findAll");
    }
  }

  @Override
  public List<Comment> findByReviewNo(int no) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectList("CommentDao.findByReviewNo", no);
    }
  }

  @Override
  public Comment findByNo(int no) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectOne("CommentDao.findByNo", no);
    }
  }
}
