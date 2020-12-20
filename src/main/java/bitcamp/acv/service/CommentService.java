package bitcamp.acv.service;

import java.util.List;
import bitcamp.acv.domain.Comment;

public interface CommentService {
  int add(Comment comment) throws Exception;
  List<Comment> list(String keyword)throws Exception;
  List<Comment> getByReviewNo(int no) throws Exception;
  List<Comment> getByMemberNo(int no) throws Exception;
  Comment getByNo(int no) throws Exception;
  int delete(int no) throws Exception;
  int update(Comment comment) throws Exception;
}
