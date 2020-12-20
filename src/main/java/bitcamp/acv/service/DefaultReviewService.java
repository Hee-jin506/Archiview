package bitcamp.acv.service;

import java.sql.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.springframework.stereotype.Service;
import bitcamp.acv.dao.ReviewDao;
import bitcamp.acv.dao.TagDao;
import bitcamp.acv.domain.Font;
import bitcamp.acv.domain.Review;
import bitcamp.acv.domain.Tag;
@Service
public class DefaultReviewService implements ReviewService {

  ReviewDao reviewDao;
  TagDao tagDao;


  public DefaultReviewService(ReviewDao reviewDao, TagDao tagDao) {
    this.reviewDao = reviewDao;
    this.tagDao = tagDao;

  }

  @Override
  public List<Font> listFont() throws Exception {
    return reviewDao.findFonts();
  }

  @Override
  public int add(Review review) throws Exception {
    try {

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
      return count;

    } catch (Exception e) {
      throw e;
    } finally {

    }
  }

  @Override
  public List<Review> listBasicFilter(HashMap<String, Object> keyMap) throws Exception {
    return reviewDao.findByKeyword(keyMap);
  }

  @Override
  public List<Review> list() throws Exception {
    return reviewDao.findAllByKeyword(null);
  }

  @Override
  public List<Review> listDetailFilter(HashMap<String, Object> keyMap) throws Exception {
    return reviewDao.findByDetailKeyword(keyMap);
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

  @Override
  public void getSizeInfo(Map<String, Object> resultMap) throws Exception {
    // jsp에 넘겨줄 값들
    resultMap.put("all", reviewDao.findAllByKeyword(null).size());

    // 삭제된 게시물 수
    HashMap<String,Object> keyMap = new HashMap<>();
    keyMap.put("status", 0);
    resultMap.put("inactive", reviewDao.findByDetailKeyword(keyMap).size());

    // 게시중인 게시물 수
    keyMap.put("status", 1);
    resultMap.put("active", reviewDao.findByDetailKeyword(keyMap).size());

  }

  @Override
  public void getChartInfo(Map<String, Object> resultMap) throws Exception {
    HashMap<String,Object> keyMap = new HashMap<>();

    // 오늘날짜 구하기
    Calendar cal = new GregorianCalendar(Locale.KOREA);
    Date today = new Date(cal.getTimeInMillis());
    //      System.out.println("오늘날짜 : " + today);

    // 어제날짜 구하기
    cal.setTime(today);
    cal.add(Calendar.DATE, -1);
    Date yesterday = new Date(cal.getTimeInMillis());
    //      System.out.println("어제날짜 : " + yesterday);

    // 이번주의 시작(일요일) 날짜 구하기
    cal.setTime(today);
    cal.add(Calendar.DATE, 1 - cal.get(Calendar.DAY_OF_WEEK));
    Date firstWeekDay = new Date(cal.getTimeInMillis());
    //      System.out.println("이번주의 첫날(일요일) : " + firstWeekDay);

    // 이번달의 시작(1일) 날짜 구하기
    cal.setTime(today);
    cal.add(Calendar.DATE, 1-cal.get(Calendar.DAY_OF_MONTH));
    Date firstMonthDay = new Date(cal.getTimeInMillis());
    //      System.out.println("이번달의 첫날(1일) : " + firstMonthDay);

    // 어제 등록한 게시물 수
    keyMap.put("registeredDate", yesterday);
    resultMap.put("yesterday", reviewDao.findByDetailKeyword(keyMap).size());

    // 오늘 등록한 게시물 수
    keyMap.put("registeredDate", today);
    resultMap.put("today",reviewDao.findByDetailKeyword(keyMap).size());

    // 이번 주에 등록된 게시물 수
    keyMap.remove("registeredDate");
    keyMap.put("startDate", firstWeekDay);
    keyMap.put("endDate", today);
    resultMap.put("thisWeek",reviewDao.findByDetailKeyword(keyMap).size());

    // 이번 달에 등록된 게시물 수
    keyMap.put("startDate", firstMonthDay);
    keyMap.put("endDate", today);
    resultMap.put("thisMonth",reviewDao.findByDetailKeyword(keyMap).size());
  }

  @Override
  public List<Review> getMainFeed(Map<String, Object> map) throws Exception {
    return reviewDao.findForMainFeed(map);
  }
}
