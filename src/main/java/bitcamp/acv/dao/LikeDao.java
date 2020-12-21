package bitcamp.acv.dao;

import java.util.List;
import bitcamp.acv.domain.Like;

public interface LikeDao {

  List<Like> findAll() throws Exception;
  int insert(Like like) throws Exception;
}
