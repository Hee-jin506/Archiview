package bitcamp.acv.service;

import java.util.List;
import java.util.Map;
import bitcamp.acv.domain.Like;

public interface LikeService {
  List<Like> list() throws Exception;
  void add(Like like) throws Exception;
  List<Like> getTime(Map<String, Object> map) throws Exception;

}
