package bitcamp.acv.dao.mariadb;

import java.util.HashMap;
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

  @Override
  public int add(Member member) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.insert("MemberDao.insert", member);
    }
  }

  @Override
  public Member findByNo(int no) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectOne("MemberDao.findByNo", no);
    }
  }

  @Override
  public Member findByEmailPassword(String email, String password) throws Exception {
    HashMap<String,Object> map = new HashMap<>();
    map.put("email", email);
    map.put("password", password);

    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectOne("MemberDao.findByEmailPassword", map);
    }
  }

  @Override
  public int update(Member member) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.update("MemberDao.update", member);
    }
  }

  @Override
  public int delete(int no) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.update("MemberDao.delete", no);
    }
  }

  @Override
  public int inactive(int no) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.update("MemberDao.inactive", no);
    }
  }

  @Override
  public int active(int no) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.update("MemberDao.active", no);
    }
  }


}
