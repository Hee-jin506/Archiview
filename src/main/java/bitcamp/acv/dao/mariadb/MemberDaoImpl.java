package bitcamp.acv.dao.mariadb;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import bitcamp.acv.dao.MemberDao;
import bitcamp.acv.domain.Member;
import bitcamp.util.SqlSessionFactoryProxy;


public class MemberDaoImpl implements MemberDao {

  SqlSessionFactoryProxy sqlSessionFactory;

  public MemberDaoImpl(SqlSessionFactoryProxy sqlSessionFactory) {
    this.sqlSessionFactory = sqlSessionFactory;
  }

  @Override
  public List<Member> findAll() throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectList("MemberDao.findAll");
    }
  }

}

