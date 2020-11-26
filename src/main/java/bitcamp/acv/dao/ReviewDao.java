package bitcamp.acv.dao;

import java.util.List;
import bitcamp.acv.domain.Review;

public interface ReviewDao {
  //  int insert(Movie movie) throws Exception;
  List<Review> findAll() throws Exception;
}
