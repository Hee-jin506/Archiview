package bitcamp.acv.dao.mariadb;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import bitcamp.acv.dao.MemberDao;
import bitcamp.acv.domain.Member;
import bitcamp.util.SqlSessionFactoryProxy;

@Repository
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
  public List<Member> findAll(String keyword) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectList("MemberDao.findAll", keyword);
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

  @Override
  public int updatePassword(Member member) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.update("MemberDao.updatePassword", member);
    }
  }

  @Override
  public List<Member> findByPop() throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectList("MemberDao.findByPop");
    }
  }

  // 이름에 keyword가 포함된 애들을 리턴
  @Override
  public List<Member> findByKeywordNickName(String keyword) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectList("MemberDao.findByKeywordNickName",keyword);
    }
  }
}
