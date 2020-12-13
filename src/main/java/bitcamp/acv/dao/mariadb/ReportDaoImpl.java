package bitcamp.acv.dao.mariadb;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import bitcamp.acv.dao.ReportDao;
import bitcamp.acv.domain.Report;
import bitcamp.util.SqlSessionFactoryProxy;
@Repository
public class ReportDaoImpl implements ReportDao {

  SqlSessionFactoryProxy sqlSessionFactory;

  public ReportDaoImpl(SqlSessionFactoryProxy sqlSessionFactory) {
    this.sqlSessionFactory = sqlSessionFactory;
  }

  @Override
  public int insert(Report report) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.insert("ReportDao.insert", report);
    }
  }

  @Override
  public List<Report> fondAll() throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectList("ReportDao.findAll");
    }
  }

  @Override
  public List<Report> findAll(String keyword) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectList("ReportDao.findAll", keyword);
    }
  }

  @Override
  public Report findByNo(int no) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectOne("ReportDao.findByNo", no);
    }
  }

  @Override
  public int update(Report report) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.update("ReportDao.update", report);
    }
  }
}