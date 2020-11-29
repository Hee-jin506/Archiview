package bitcamp.acv.dao.mariadb;

import java.util.List;
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
  public List<Tag> findAll() throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectList("TagDao.findAll");
    }
  }

  @Override
  public Tag findByNo(int no) {
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
}
