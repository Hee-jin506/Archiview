package bitcamp.acv.service;

import java.util.List;
import bitcamp.acv.dao.CommentDao;
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
  CommentDao commentDao;

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

  @Override
  public Object getTarget(Report report) throws Exception {
    if (report.getReportedType() == Report.MEMBER) {
      return memberDao.findByNo(report.getReportedNo());
    } else if (report.getReportedType() == Report.REVIEW) {
      return reviewDao.findAll();
    } else if (report.getReportedType() == Report.TAG) {
      return tagDao.findByNo(report.getReportedNo());
    } else if (report.getComment() == report.COMMENT) {
      return commentDao.findByNo(Report.COMMENT);
    }
    return null;
  }
}
