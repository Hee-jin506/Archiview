package bitcamp.acv.service;

import java.util.List;
import java.util.Map;
import bitcamp.acv.domain.Like;

public interface LikeService {
  List<Like> list() throws Exception;
  List<Like> getTime(Map<String, Object> likeMap) throws Exception;
  int addReview(Like like) throws Exception;
  int addComment(Like like) throws Exception;
  int deleteReview(Like like) throws Exception;
  int deleteComment(Like like) throws Exception;
  List<Like> list2(int no) throws Exception;

}
