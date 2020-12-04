package bitcamp.acv.service;

import java.util.List;
import java.util.Map;
import bitcamp.acv.domain.Report;

public interface ReportService {
  List<Report> list() throws Exception;
  List<Report> list(String keyword) throws Exception;
  List<Report> list(Map<String,Object> keywords) throws Exception;
  void add(Report report) throws Exception;
  Report get(int no) throws Exception;
  Object getTarget(Report report) throws Exception;
}
