package bitcamp.acv.service;

import java.util.HashMap;
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

  @Override
  public int active(int no) throws Exception {
    return tagDao.active(no);
  }

  @Override
  public List<Tag> list1(HashMap<String, Object> keyMap) throws Exception {
    return tagDao.findByKeyword(keyMap);
  }

  @Override
  public List<Tag> listByReview(int reviewNo) throws Exception {
    return tagDao.findByReviewNo(reviewNo);
  }

  @Override
  public List<Tag> listByPop() throws Exception {
    List<Tag> tags = tagDao.findByPop();
    for (int i = 0; i < tags.size(); i++) {
      for (int j =  tags.size() -1; j > i; j--) {
        int frontPop = tags.get(j - 1).getReviews().size() + tags.get(j - 1).getFollowers().size() * 2;
        int backPop = tags.get(j).getReviews().size() + tags.get(j).getFollowers().size() * 2;
        if (frontPop < backPop) {
          swap(tags, j-1, j);
        }
      }
    }
    return tags;
  }

  public void swap(List<Tag> tags, int a, int b) {
    Tag temp = tags.get(a);
    tags.set(a, tags.get(b));
    tags.set(b, temp);
  }
}
