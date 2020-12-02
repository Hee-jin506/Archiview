package bitcamp.acv.dao.mariadb;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import bitcamp.acv.dao.TagDao;
import bitcamp.acv.domain.Tag;
import bitcamp.util.SqlSessionFactoryProxy;


public class TagDaoImpl implements TagDao {

  SqlSessionFactoryProxy sqlSessionFactory;

  public TagDaoImpl(SqlSessionFactoryProxy sqlSessionFactory) {
    this.sqlSessionFactory = sqlSessionFactory;
  }

  @Override
  public List<Tag> findAll(String keyword) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectList("TagDao.findAll",keyword);
    }
  }

  @Override
  public Tag findByNo(int no) throws Exception{
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectOne("TagDao.findByNo", no);
    }
  }

  @Override
  public int delete(int no) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.update("TagDao.delete", no);
    }
  }

  @Override
  public List<Tag> findByDetailKeyword(Map<String, Object> keywords) throws Exception{
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectList("TagDao.findByDetailKeyword", keywords);
    }
  }
}
