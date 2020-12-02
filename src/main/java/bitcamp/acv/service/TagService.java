package bitcamp.acv.service;

import java.util.List;
import bitcamp.acv.domain.Tag;

public interface TagService {
  int add(Tag tag) throws Exception;
  List<Tag> list() throws Exception;
  Tag get(int no) throws Exception;
  int delete(int no) throws Exception;
}
