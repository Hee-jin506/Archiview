package bitcamp.acv.service;

import bitcamp.acv.dao.CommentDao;
import bitcamp.acv.domain.Comment;

public class DefaultCommentService implements CommentService {

  CommentDao commentDao;

  public DefaultCommentService(CommentDao commentDao) {
    this.commentDao = commentDao;
  }

  @Override
  public Comment get(int no) throws Exception {
      return commentDao.findByNo(no);
  }
}
