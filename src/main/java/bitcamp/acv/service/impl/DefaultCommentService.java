package bitcamp.acv.service.impl;

import java.util.List;
import org.springframework.stereotype.Service;
import bitcamp.acv.dao.CommentDao;
import bitcamp.acv.domain.Comment;
import bitcamp.acv.service.CommentService;
@Service
public class DefaultCommentService implements CommentService {

  CommentDao commentDao;

  public DefaultCommentService(CommentDao commentDao) {
    this.commentDao = commentDao;
  }

  @Override
  public int add(Comment comment) throws Exception {
    if (comment.getGroupNo() == 0) {
      int count = commentDao.insert(comment);
      commentDao.updateGroupNo(comment);
      return count;
    }
    return commentDao.insert(comment);
  }

  @Override
  public List<Comment> list(String keyword) throws Exception {
    return commentDao.findAll(keyword);
  }

  @Override
  public List<Comment> getByReviewNo(int no) throws Exception {
    return commentDao.findByReviewNo(no);
  }

  @Override
  public List<Comment> getByMemberNo(int no) throws Exception {
    return commentDao.findByMemberNo(no);
  }

  @Override
  public Comment getByNo(int no) throws Exception {
    return commentDao.findByNo(no);
  }

  @Override
  public int delete(int no) throws Exception {
    return commentDao.delete(no);
  }

  @Override
  public int update(Comment comment) throws Exception {
    return commentDao.update(comment);
  }
}
