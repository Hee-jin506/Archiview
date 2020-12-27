package bitcamp.acv.dao;

import java.util.List;
import java.util.Map;
import bitcamp.acv.domain.Like;

public interface LikeDao {

  List<Like> findAll() throws Exception;
  List<Like> getTime(Map<String, Object> map) throws Exception;
  int insertReview(Like like) throws Exception;
  int deleteReview(Like like) throws Exception;
  int insertComment(Like like) throws Exception;
  int deleteComment(Like like) throws Exception;

  int active(int no) throws Exception;
  int inactive(int no) throws Exception;
}
