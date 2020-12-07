package bitcamp.acv.service;

import java.util.List;
import bitcamp.acv.dao.MemberDao;
import bitcamp.acv.dao.ReportDao;
import bitcamp.acv.dao.ReviewDao;
import bitcamp.acv.dao.TagDao;
import bitcamp.acv.domain.Report;

public class DefaultReportService implements ReportService {
  ReportDao reportDao;
  MemberDao memberDao;
  ReviewDao reviewDao;
  TagDao tagDao;

  public DefaultReportService(ReportDao reportDao,
      MemberDao memberDao,
      ReviewDao reviewDao,
      TagDao tagDao) {
    this.reportDao = reportDao;
    this.memberDao = memberDao;
    this.reviewDao = reviewDao;
    this.tagDao = tagDao;
  }

  @Override
  public List<Report> list() throws Exception {
    return reportDao.findAll(null);
  }

  @Override
  public List<Report> list(String keyword) throws Exception {
    return reportDao.findAll(keyword);
  }

  @Override
  public void add(Report report) throws Exception {
    reportDao.insert(report);
  }

  @Override
  public Report get(int no) throws Exception {
    return reportDao.findByNo(no);
  }

  @Override
  public int update(Report report) throws Exception {
    return reportDao.update(report);
  }

  @Override
  public Object getTarget(Report report) throws Exception {
    if (report.getReportedType() == Report.MEMBER) {
      return memberDao.findByNo(report.getReportedNo());
    } else if (report.getReportedType() == Report.REVIEW) {
      return reviewDao.findAll();
    } else if (report.getReportedType() == Report.TAG) {
      return tagDao.findByNo(report.getReportedNo());
    }
    return null;
  }
}
