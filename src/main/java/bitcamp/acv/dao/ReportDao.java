package bitcamp.acv.dao;

import java.util.List;
import bitcamp.acv.domain.Report;

public interface ReportDao {
  int insertUser(Report report) throws Exception; // 유저 신고

  List<Report> findAll(String keyword) throws Exception; // 신고 리스트
  Report findByNo(int no) throws Exception; // 신고 상세
  int update(Report report) throws Exception; // 신고 처리
}
