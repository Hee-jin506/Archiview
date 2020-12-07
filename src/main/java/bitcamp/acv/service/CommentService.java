package bitcamp.acv.service;

import bitcamp.acv.domain.Comment;

public interface CommentService {
  Comment get(int no) throws Exception;
}
