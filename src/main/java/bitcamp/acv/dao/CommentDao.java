package bitcamp.acv.dao;

import bitcamp.acv.domain.Comment;

public interface CommentDao {
  Comment findByNo(int no) throws Exception;
}
