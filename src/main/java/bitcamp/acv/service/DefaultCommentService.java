package bitcamp.acv.service;

import java.util.List;
import bitcamp.acv.dao.CommentDao;
import bitcamp.acv.domain.Comment;

public class DefaultCommentService implements CommentService {

  CommentDao commentDao;

  public DefaultCommentService(CommentDao commentDao) {
    this.commentDao = commentDao;
  }

  @Override
  public int add(Comment comment) throws Exception {
    return commentDao.insert(comment);
  }

  @Override
  public List<Comment> list() throws Exception {
    return commentDao.findAll();
  }

  @Override
  public List<Comment> getByReviewNo(int no) throws Exception {
    return commentDao.findByReviewNo(no);
  }


}
