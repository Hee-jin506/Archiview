package bitcamp.acv.service.impl;

import org.springframework.stereotype.Service;
import bitcamp.acv.dao.SaveDao;
import bitcamp.acv.domain.Save;
import bitcamp.acv.service.SaveService;

@Service
public class DefaultSaveService implements SaveService {

  SaveDao saveDao;

  public DefaultSaveService(SaveDao saveDao) {
    this.saveDao = saveDao;
  }
  
  @Override
  public int add(Save save) throws Exception {
    return saveDao.insert(save);
  }

  @Override
  public int delete(Save save) throws Exception {
    return saveDao.delete(save);
  }

}
