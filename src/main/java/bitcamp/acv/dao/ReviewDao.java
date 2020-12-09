package bitcamp.acv.dao;

import java.util.HashMap;
import java.util.List;
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
}
