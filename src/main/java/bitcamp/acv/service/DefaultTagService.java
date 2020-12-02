package bitcamp.acv.service;

import java.util.List;
import java.util.Map;
import bitcamp.acv.dao.TagDao;
import bitcamp.acv.domain.Tag;


public class DefaultTagService implements TagService {

  TagDao tagDao;

  public DefaultTagService(TagDao tagDao) {
    this.tagDao = tagDao;
  }

  @Override
  public List<Tag> list() throws Exception {
    return tagDao.findAll(null);
  }

  @Override
  public List<Tag> list(String keyword) throws Exception {
    return tagDao.findAll(keyword);
  }

  @Override
  public Tag get(int no) throws Exception {
    return tagDao.findByNo(no);
  }

  @Override
  public int delete(int no) throws Exception {
    return tagDao.delete(no);
  }

  @Override
  public List<Tag> list(Map<String, Object> keywords) throws Exception{
    return tagDao.findByDetailKeyword(keywords);
  }

  @Override
  public int add(Tag tag) throws Exception {
    // TODO Auto-generated method stub
    return 0;
  }
}
