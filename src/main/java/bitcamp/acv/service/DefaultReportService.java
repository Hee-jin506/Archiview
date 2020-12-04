package bitcamp.acv.service;

import java.util.List;
import bitcamp.acv.dao.ReportDao;
import bitcamp.acv.domain.Report;

public class DefaultReportService implements ReportService {
  ReportDao reportDao;

  public DefaultReportService(ReportDao reportDao) {
    this.reportDao = reportDao;
  }

  @Override
  public List<Report> findAll() throws Exception {
    return reportDao.findAll();
  }

  @Override
  public void add(Report report) throws Exception {
    reportDao.insert(report);
  }

  @Override
  public Report get(int no) throws Exception {
    return reportDao.findByNo(no);
  }
}
