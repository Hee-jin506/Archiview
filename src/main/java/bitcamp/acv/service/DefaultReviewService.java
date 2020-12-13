package bitcamp.acv.service;

import java.util.HashMap;
import java.util.List;
import org.springframework.stereotype.Service;
import bitcamp.acv.dao.ReviewDao;
import bitcamp.acv.dao.TagDao;
import bitcamp.acv.domain.Font;
import bitcamp.acv.domain.Review;
import bitcamp.acv.domain.Tag;
import bitcamp.util.SqlSessionFactoryProxy;
@Service
public class DefaultReviewService implements ReviewService {

  ReviewDao reviewDao;
  TagDao tagDao;
  SqlSessionFactoryProxy factoryProxy;


  public DefaultReviewService(ReviewDao reviewDao, TagDao tagDao, SqlSessionFactoryProxy factoryProxy) {
    this.reviewDao = reviewDao;
    this.tagDao = tagDao;
    this.factoryProxy =factoryProxy;
  }

  @Override
  public List<Font> listFont() throws Exception {
    return reviewDao.findFonts();
  }

  @Override
  public int add(Review review) throws Exception {
    try {
      factoryProxy.startTransaction();

      int count = reviewDao.insert(review);
      System.out.println(review.getNo());
      for (Tag tag : review.getTags()) {
        System.out.println(tag.getTitle());
        tagDao.insert(tag);
        if (tag.getNo() == 0) {
          tag.setNo(tagDao.findByTitle(tag.getTitle()).getNo());
        }
      }
      tagDao.insertByReview(review);
      factoryProxy.commit();
      return count;

    } catch (Exception e) {
      factoryProxy.rollback();
      throw e;
    } finally {
      factoryProxy.endTransaction();
    }
  }

  @Override
  public List<Review> list1(HashMap<String, Object> keyMap) throws Exception {
    return reviewDao.findByKeyword(keyMap);
  }

  @Override
  public List<Review> list() throws Exception {
    return reviewDao.findAllByKeyword(null);
  }

  @Override
  public List<Review> list(HashMap<String, Object> keywords) throws Exception {
    return reviewDao.findByDetailKeyword(keywords);
  }

  @Override
  public Review get(int no) throws Exception {
    return reviewDao.findByNo(no);
  }

  @Override
  public int delete(int no) throws Exception {
    return reviewDao.delete(no);
  }

  @Override
  public int active(int no) throws Exception {
    return reviewDao.active(no);
  }

  @Override
  public List<Review> listByKeywordTagTitle(String keyword) throws Exception {
    return reviewDao.findByKeywordTagTitle(keyword);
  }
}
