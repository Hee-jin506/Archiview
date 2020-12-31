package bitcamp.acv.service.impl;

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
import bitcamp.acv.service.ReviewService;
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
  public List<Review> getByMemberNo(int no) throws Exception {
    return reviewDao.findByMemberNo(no);
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
  public List<Review> getFollowingFeed(int userNo, int pageNo) throws Exception {
    Map<String, Object> map = new HashMap<>();
    map.put("userNo", userNo);
    map.put("row", (pageNo - 1) * 5);
    List<Review> list = reviewDao.findForFollowingFeed(map);
    System.out.println(list.size());

    for (Review review : list) {
      System.out.println(review.getText());

      Calendar cal = new GregorianCalendar(Locale.KOREA);
      long now = cal.getTimeInMillis();
      long diff = now - review.getRegisteredDate().getTime();
      if (diff / 1000 / 60 < 1) {
        review.setRdtFromNow("방금 전");
      } else if (diff / 1000 / 60 / 60 < 1) {
        review.setRdtFromNow(diff / 1000 / 60 + "분 전");
      } else if (diff/ 1000 / 60 / 60 / 24 < 1) {
        review.setRdtFromNow(diff/ 1000 / 60 / 60 + "시간 전");
      } else if (diff/ 1000 / 60 / 60 / 24 / 7 < 1) {
        review.setRdtFromNow(diff/ 1000 / 60 / 60 / 24 + "일 전");
      } else if (diff/ 1000 / 60 / 60 / 24 / 7 / 30 < 1) {
        review.setRdtFromNow(diff/ 1000 / 60 / 60 / 24 / 7 + "주 전");
      } else if (diff/ 1000 / 60 / 60 / 24 / 365 < 1) {
        review.setRdtFromNow(Calendar.MONTH - review.getRegisteredDate().getMonth() + "달 전");
      } else {
        review.setRdtFromNow(Calendar.YEAR - review.getRegisteredDate().getYear() + "년 전");
      }
    }
    return list;
  }

  @Override
  public Review get(int reviewNo, int userNo) throws Exception {
    Map<String, Object> map = new HashMap<>();
    map.put("reviewNo", reviewNo);
    map.put("userNo", userNo);
    Review review = reviewDao.findReviewDetail(map);

    Calendar cal = new GregorianCalendar(Locale.KOREA);
    long now = cal.getTimeInMillis();
    long diff = now - review.getRegisteredDate().getTime();
    if (diff / 1000 / 60 < 1) {
      review.setRdtFromNow("방금 전");
    } else if (diff / 1000 / 60 / 60 < 1) {
      review.setRdtFromNow(diff / 1000 / 60 + "분 전");
    } else if (diff/ 1000 / 60 / 60 / 24 < 1) {
      review.setRdtFromNow(diff/ 1000 / 60 / 60 + "시간 전");
    } else if (diff/ 1000 / 60 / 60 / 24 / 7 < 1) {
      review.setRdtFromNow(diff/ 1000 / 60 / 60 / 24 + "일 전");
    } else if (diff/ 1000 / 60 / 60 / 24 / 7 / 30 < 1) {
      review.setRdtFromNow(diff/ 1000 / 60 / 60 / 24 / 7 + "주 전");
    } else if (diff/ 1000 / 60 / 60 / 24 / 365 < 1) {
      review.setRdtFromNow(Calendar.MONTH - review.getRegisteredDate().getMonth() + "달 전");
    } else {
      review.setRdtFromNow(Calendar.YEAR - review.getRegisteredDate().getYear() + "년 전");
    }
    return review;
  }

  @Override
  public Object getMainFeed(int userNo, int pageNo) throws Exception {
    Map<String, Object> map = new HashMap<>();
    map.put("userNo", userNo);
    map.put("row", (pageNo - 1) * 5);
    List<Review> list = reviewDao.findForMainFeed(map);
    for (Review review : list) {

      Calendar cal = new GregorianCalendar(Locale.KOREA);
      long now = cal.getTimeInMillis();
      long diff = now - review.getRegisteredDate().getTime();
      System.out.println(review.getRegisteredDate());
      if (diff / 1000 / 60 < 1) {
        review.setRdtFromNow("방금 전");
      } else if (diff / 1000 / 60 / 60 < 1) {
        review.setRdtFromNow(diff / 1000 / 60 + "분 전");
      } else if (diff/ 1000 / 60 / 60 / 24 < 1) {
        review.setRdtFromNow(diff/ 1000 / 60 / 60 + "시간 전");
      } else if (diff/ 1000 / 60 / 60 / 24 / 7 < 1) {
        review.setRdtFromNow(diff/ 1000 / 60 / 60 / 24 + "일 전");
      } else if (diff/ 1000 / 60 / 60 / 24 / 7 / 30 < 1) {
        review.setRdtFromNow(diff/ 1000 / 60 / 60 / 24 / 7 + "주 전");
      } else if (diff/ 1000 / 60 / 60 / 24 / 365 < 1) {
        review.setRdtFromNow(Calendar.MONTH - review.getRegisteredDate().getMonth() + "달 전");
      } else {
        review.setRdtFromNow(Calendar.YEAR - review.getRegisteredDate().getYear() + "년 전");
      }
    }
    return list;
  }
}
