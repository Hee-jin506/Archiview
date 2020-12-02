package bitcamp.acv.service;

import java.util.List;
import java.util.Map;
import bitcamp.acv.domain.Tag;

public interface TagService {
  int add(Tag tag) throws Exception;
  List<Tag> list() throws Exception;
  List<Tag> list(String keyword) throws Exception;
  List<Tag> list(Map<String, Object> keywords) throws Exception;
  Tag get(int no) throws Exception;
  int delete(int no) throws Exception;
}
