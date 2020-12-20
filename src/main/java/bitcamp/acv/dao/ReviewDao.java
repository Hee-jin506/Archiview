package bitcamp.acv.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import bitcamp.acv.domain.Font;
import bitcamp.acv.domain.Review;

public interface ReviewDao {
  //  int insert(Movie movie) throws Exception;
  List<Review> findAll() throws Exception;
  List<Font> findFonts() throws Exception;
  int insert(Review review);

  List<Review> findByKeyword(HashMap<String, Object> keyMap) throws Exception;
  List<Review> findAllByKeyword(String keyword) throws Exception;
  List<Review> findByDetailKeyword(HashMap<String, Object> keywords) throws Exception;
  int delete(int no) throws Exception;
  int active(int no) throws Exception;
  Review findByNo(int no) throws Exception;

  // 태그명으로 리뷰를 찾는다
  List<Review> findByKeywordTagTitle(String keyword) throws Exception;
  List<Review> findForMainFeed(Map<String, Object> map) throws Exception;
}
