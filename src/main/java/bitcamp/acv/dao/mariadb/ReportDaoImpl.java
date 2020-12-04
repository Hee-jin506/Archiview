package bitcamp.acv.dao.mariadb;

import java.util.List;
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
  public List<Report> findAll() throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectList("ReportDao.findAll");
    }
  }

  @Override
  public Report findByNo(int no) throws Exception {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      return sqlSession.selectOne("ReportDao.findByNo", no);
    }
  }
}
