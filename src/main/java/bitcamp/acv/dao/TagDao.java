package bitcamp.acv.dao;

import java.util.List;
import bitcamp.acv.domain.Tag;

public interface TagDao {
  List<Tag> findAll() throws Exception;
  Tag findByNo(int no) throws Exception;
  int delete(int no) throws Exception;
}
