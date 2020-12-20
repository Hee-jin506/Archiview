package bitcamp.acv.dao;

import java.util.List;
import bitcamp.acv.domain.Comment;

public interface CommentDao {
  public int insert(Comment comment) throws Exception;
  public List<Comment> findAll(String keyword) throws Exception;
  public List<Comment> findByReviewNo(int no) throws Exception;
  public List<Comment> findByMemberNo(int no) throws Exception;
  public Comment findByNo(int no) throws Exception;
  public int delete(int no) throws Exception;
  public int update(Comment comment) throws Exception;
}
