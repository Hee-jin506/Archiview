package bitcamp.acv.service.impl;

import java.sql.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.springframework.stereotype.Service;
import bitcamp.acv.dao.TagDao;
import bitcamp.acv.domain.Tag;
import bitcamp.acv.service.TagService;

@Service
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
  public Tag get(String title) throws Exception {
    return tagDao.findByTitle(title);
  }

  @Override
  public int delete(int no) throws Exception {
    return tagDao.delete(no);
  }

  @Override
  public List<Tag> listDetailFilter(Map<String, Object> keywords) throws Exception{
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
  public List<Tag> listBasicFilter(HashMap<String, Object> keyMap) throws Exception {
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

  @Override
  public List<Tag> listByKeywordTitle(String keyword) throws Exception {
    return tagDao.findByKeywordTitle(keyword);
  }

  @Override
  public void getSizeInfo(Map<String, Object> resultMap) throws Exception {
    // jsp에 넘겨줄 값들
    resultMap.put("all", tagDao.findAll(null).size());

    // 삭제된 태그 수
    HashMap<String,Object> keyMap = new HashMap<>();
    keyMap.put("status", 0);
    resultMap.put("inactive",tagDao.findByDetailKeyword(keyMap).size());

    // 게시중인 태그 수
    keyMap.put("status", 1);
    resultMap.put("active", tagDao.findByDetailKeyword(keyMap).size());
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

    // 어제 등록한 태그 수
    keyMap.remove("status");
    keyMap.put("registeredDate", yesterday);
    resultMap.put("yesterday",tagDao.findByDetailKeyword(keyMap).size());

    // 오늘 등록한 태그 수
    keyMap.remove("registeredDate");
    keyMap.put("registeredDate", today);
    resultMap.put("today",tagDao.findByDetailKeyword(keyMap).size());

    // 이번 주에 등록된 태그 수
    keyMap.remove("registeredDate");
    keyMap.put("startDate", firstWeekDay);
    keyMap.put("endDate", today);
    resultMap.put("thisWeek",tagDao.findByDetailKeyword(keyMap).size());

    // 이번 달에 등록된 태그 수
    keyMap.put("startDate", firstMonthDay);
    keyMap.put("endDate", today);
    resultMap.put("thisMonth",tagDao.findByDetailKeyword(keyMap).size());
  }

  @Override
  public Tag[] listByPop3() throws Exception {
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
    Tag[] topTags = new Tag[3];
    for (int i = 0; i < 3; i++) {
      topTags[i] = tags.get(i);
    }
    return topTags;
  }
}
