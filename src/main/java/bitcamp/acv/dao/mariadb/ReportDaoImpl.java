package bitcamp.acv.dao.mariadb;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import bitcamp.acv.dao.ReportDao;
import bitcamp.acv.domain.Report;
import bitcamp.util.SqlSessionFactoryProxy;

public class ReportDaoImpl implements ReportDao {

  SqlSessionFactoryProxy sqlSessionFactory;

  public ReportDaoImpl(SqlSessionFactoryProxy sqlSessionFactory) {
    this.sqlSessionFactory = sqlSessionFactory;
  }

  @Override
  public int insert(Report report) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.insert("ReportDao.inset", report);
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
  public List<Report> findByDetailKeyword(Map<String, Object> keywords) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectList("reportDao.findAll", keywords);
    }
  }

  @Override
  public Report findByNo(int no) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectOne("ReportDao.findByNo", no);
    }
  }
}
