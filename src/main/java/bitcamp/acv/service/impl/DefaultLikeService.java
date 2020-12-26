package bitcamp.acv.service.impl;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Service;
import bitcamp.acv.dao.LikeDao;
import bitcamp.acv.domain.Like;
import bitcamp.acv.service.LikeService;

@Service
public class DefaultLikeService implements LikeService {

  LikeDao likeDao;

  public DefaultLikeService(LikeDao likeDao) {
    this.likeDao = likeDao;
  }

  @Override
  public List<Like> list() throws Exception {
    return likeDao.findAll();
  }

  @Override
  public void add(Like like) throws Exception {
    likeDao.insert(like);
  }
  @Override
  public List<Like> getTime(Map<String, Object> likeMap) throws Exception {
    return likeDao.getTime(likeMap);
  }

}
