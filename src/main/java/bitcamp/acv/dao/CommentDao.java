package bitcamp.acv.dao;

import java.util.List;
import bitcamp.acv.domain.Comment;

public interface CommentDao {
  public int insert(Comment comment) throws Exception;
  public List<Comment> findAll() throws Exception;
  public List<Comment> findByReviewNo(int no) throws Exception;
}
