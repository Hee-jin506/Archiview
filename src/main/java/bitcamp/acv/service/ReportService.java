package bitcamp.acv.service;

import java.util.List;
import bitcamp.acv.domain.Report;

public interface ReportService {
  int reportUser(Report report) throws Exception; // 유저 신고

  // 관리자용
  List<Report> list() throws Exception;
  List<Report> list(String keyword) throws Exception;
  int update(Report report) throws Exception;

  Report get(int no) throws Exception;
  Object getTarget(Report report) throws Exception;
}
