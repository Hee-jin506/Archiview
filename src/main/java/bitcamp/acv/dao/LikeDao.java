package bitcamp.acv.dao;

import java.util.List;
import java.util.Map;
import bitcamp.acv.domain.Like;

public interface LikeDao {

  List<Like> findAll() throws Exception;
  int insert(Like like) throws Exception;
  List<Like> getTime(Map<String, Object> map) throws Exception;
}
