package bitcamp.acv.service;

import java.util.HashMap;
import java.util.List;
import bitcamp.acv.domain.Font;
import bitcamp.acv.domain.Review;

public interface ReviewService {
  List<Font> listFont() throws Exception;
  int add(Review review) throws Exception;

  List<Review> list1(HashMap<String, Object> keyMap) throws Exception;
  List<Review> list() throws Exception;
  List<Review> list(HashMap<String, Object> keywordMap) throws Exception;
  Review get(int no) throws Exception;
  int delete(int no) throws Exception;
  int active(int no) throws Exception;
  List<Review> listByKeywordTagTitle(String keyword) throws Exception;
}
