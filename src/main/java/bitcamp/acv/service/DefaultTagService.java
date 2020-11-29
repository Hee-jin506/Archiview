package bitcamp.acv.service;

import java.util.List;
import bitcamp.acv.dao.TagDao;
import bitcamp.acv.domain.Tag;


public class DefaultTagService implements TagService {

  TagDao tagDao;

  public DefaultTagService(TagDao tagDao) {
    this.tagDao = tagDao;
  }

  @Override
  public List<Tag> list() throws Exception {
    return tagDao.findAll();
  }


}
