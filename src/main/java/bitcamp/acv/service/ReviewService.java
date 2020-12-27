package bitcamp.acv.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import bitcamp.acv.domain.Font;
import bitcamp.acv.domain.Review;

public interface ReviewService {
  List<Font> listFont() throws Exception;
  int add(Review review) throws Exception;

  List<Review> listBasicFilter(HashMap<String, Object> keyMap) throws Exception;
  List<Review> list() throws Exception;
  List<Review> listDetailFilter(HashMap<String, Object> keyMap) throws Exception;
  Review get(int no) throws Exception;
  List<Review> getByMemberNo(int no) throws Exception;
  int delete(int no) throws Exception;
  int active(int no) throws Exception;
  List<Review> listByKeywordTagTitle(String keyword) throws Exception;
  void getSizeInfo(Map<String, Object> resultMap) throws Exception;
  void getChartInfo(Map<String, Object> resultMap) throws Exception;
  List<Review> getMainFeed(Map<String, Object> map) throws Exception;
  List<Review> getFollowingFeed(Map<String, Object> map) throws Exception;
}
