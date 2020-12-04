package bitcamp.acv.dao;

import java.util.List;
import bitcamp.acv.domain.Report;

public interface ReportDao {
  int insert(Report report) throws Exception;
  List<Report> findAll() throws Exception;
  Report findByNo(int no) throws Exception;
}
