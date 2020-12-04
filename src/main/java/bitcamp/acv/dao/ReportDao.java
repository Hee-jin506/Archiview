package bitcamp.acv.dao;

import java.util.List;
import java.util.Map;
import bitcamp.acv.domain.Report;

public interface ReportDao {
  int insert(Report report) throws Exception;
  List<Report> fondAll() throws Exception;
  List<Report> findAll(String keyword) throws Exception;
  List<Report> findByDetailKeyword(Map<String,Object> keywords) throws Exception;
  Report findByNo(int no) throws Exception;
}
