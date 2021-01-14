package bitcamp.acv.service;

import bitcamp.acv.domain.Save;

public interface SaveService {
  int add(Save save) throws Exception;
  int delete(Save save) throws Exception;

}
