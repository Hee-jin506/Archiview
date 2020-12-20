package bitcamp.acv.service;

import java.util.List;
import bitcamp.acv.domain.Like;

public interface LikeService {
  List<Like> list() throws Exception;
  void add(Like like) throws Exception;

}
