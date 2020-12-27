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
  public List<Like> list2(int no) throws Exception {
    return likeDao.findAll2(no);
  }

  @Override
  public List<Like> getTime(Map<String, Object> likeMap) throws Exception {
    return likeDao.getTime(likeMap);
  }

  @Override
  public int addReview(Like like) throws Exception {
    return likeDao.insertReview(like);
  }

  @Override
  public int addComment(Like like) throws Exception {
    return likeDao.insertComment(like);
  }

  @Override
  public int deleteReview(Like like) throws Exception {
    return likeDao.deleteReview(like);

  }

  @Override
  public int deleteComment(Like like) throws Exception {
    return likeDao.deleteComment(like);
  }

  @Override
  public int active(int no) throws Exception {
    return likeDao.active(no);
  }

  @Override
  public int inactive(int no) throws Exception {
    return likeDao.inactive(no);
  }

}
