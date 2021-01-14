package bitcamp.acv.dao;

import bitcamp.acv.domain.Save;

public interface SaveDao {

  int insert(Save save) throws Exception;
  int delete(Save save) throws Exception;
}
