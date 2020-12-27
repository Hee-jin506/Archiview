package bitcamp.acv.dao;

import java.util.List;
import java.util.Map;
import bitcamp.acv.domain.Like;

public interface LikeDao {

  List<Like> findAll() throws Exception;
  // 내 리뷰, 댓글을 좋아하는 애들의 목록
  List<Like> findAll2(int no) throws Exception;
  List<Like> getTime(Map<String, Object> map) throws Exception;
  int insertReview(Like like) throws Exception;
  int deleteReview(Like like) throws Exception;
  int insertComment(Like like) throws Exception;
  int deleteComment(Like like) throws Exception;

  int active(int no) throws Exception;
  int inactive(int no) throws Exception;
}
