package bitcamp.acv.service;

import java.util.List;
import bitcamp.acv.domain.Report;

public interface ReportService {
  List<Report> findAll() throws Exception;
  void add(Report report) throws Exception;
  Report get(int no) throws Exception;
}
