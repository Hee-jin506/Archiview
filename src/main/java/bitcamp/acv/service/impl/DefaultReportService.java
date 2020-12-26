package bitcamp.acv.service.impl;

import java.util.List;
import org.springframework.stereotype.Service;
import bitcamp.acv.dao.CommentDao;
import bitcamp.acv.dao.MemberDao;
import bitcamp.acv.dao.ReportDao;
import bitcamp.acv.dao.ReviewDao;
import bitcamp.acv.dao.TagDao;
import bitcamp.acv.domain.Report;
import bitcamp.acv.service.ReportService;
@Service
public class DefaultReportService implements ReportService {
  ReportDao reportDao;
  MemberDao memberDao;
  ReviewDao reviewDao;
  TagDao tagDao;
  CommentDao commentDao;

  public DefaultReportService(ReportDao reportDao,
      MemberDao memberDao,
      ReviewDao reviewDao,
      TagDao tagDao,
      CommentDao commentDao) {
    this.reportDao = reportDao;
    this.memberDao = memberDao;
    this.reviewDao = reviewDao;
    this.tagDao = tagDao;
    this.commentDao = commentDao;
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
  public int reportUser(Report report) throws Exception {
    return reportDao.insertUser(report);
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
      return reviewDao.findByNo(report.getReportedNo());
    } else if (report.getReportedType() == Report.TAG) {
      return tagDao.findByNo(report.getReportedNo());
    } else if (report.getReportedType() == Report.COMMENT) {
      return commentDao.findByNo(report.getReportedNo());
    }
    return null;
  }
}
