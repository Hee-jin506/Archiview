package bitcamp.acv.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import bitcamp.acv.domain.Tag;

public interface TagService {
  int add(Tag tag) throws Exception;
  List<Tag> list() throws Exception;
  List<Tag> list(String keyword) throws Exception;
  List<Tag> listDetailFilter(Map<String, Object> keywords) throws Exception;
  List<Tag> listByReview(int reviewNo) throws Exception;

  Tag get(int no) throws Exception;
  int delete(int no) throws Exception;
  int active(int no) throws Exception;
  List<Tag> listBasicFilter(HashMap<String, Object> keyMap) throws Exception;
  List<Tag> listByPop() throws Exception;
  List<Tag> listByKeywordTitle(String keyword) throws Exception;
  Tag get(String title) throws Exception;
  void getSizeInfo(Map<String, Object> resultMap) throws Exception;
  void getChartInfo(Map<String, Object> resultMap) throws Exception;
}
