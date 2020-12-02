package bitcamp.acv.service;

import java.util.List;
import bitcamp.acv.dao.ReviewDao;
import bitcamp.acv.domain.Font;
import bitcamp.acv.domain.Review;

public class DefaultReviewService implements ReviewService {

  ReviewDao reviewDao;

  public DefaultReviewService(ReviewDao reviewDao) {
    this.reviewDao = reviewDao;
  }
  @Override
  public List<Font> listFont() throws Exception {
    return reviewDao.findFonts();
  }
  @Override
  public int add(Review review) throws Exception {
    return reviewDao.insert(review);
  }
}
