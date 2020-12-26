package bitcamp.acv.domain;

import java.sql.Date;
import java.util.List;
import java.util.Map;

public class Tag {

  private String INACTIVE = "삭제";
  private String ACTIVE = "게시중";

  private int no; // 태그 번호
  private String title; // 태그명
  private boolean status; // 태그 상태
  private String statusName; // 태그 상태명
  private Date registeredDate; // 태그 등록일
  private int numOfReviews; // 태그가 달린 리뷰의 개수
  private List<Integer> reviews; // 태그가 달린 리뷰 번호 목록
  private List<Integer> followers; // 태그를 팔로우하는 멤버 번호 목록
  private String ThumbnailStillCutUrl; // 태그의 대표 스틸컷 url
  public int getNo() {
    return no;
  }
  public void setNo(int no) {
    this.no = no;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public boolean isStatus() {
    return status;
  }
  public void setStatus(boolean status) {
    this.status = status;
  }
  public Date getRegisteredDate() {
    return registeredDate;
  }
  public void setRegisteredDate(Date registeredDate) {
    this.registeredDate = registeredDate;
  }
  public List<Integer> getReviews() {
    return reviews;
  }
  public void setReviews(List<Integer> reviews) {
    this.reviews = reviews;
  }

  public List<Integer> getFollowers() {
    return followers;
  }
  public void setFollowers(List<Integer> followers) {
    this.followers = followers;
  }
  // 상태명
  public String getStatusName() {
    return this.isStatus() ? ACTIVE : INACTIVE;
  }
  public void setStatusName(String statusName) {
    this.statusName = statusName;
  }
  public int getNumOfReviews() {
    return this.reviews.size();
  }
  public void setNumOfReviews(int numOfReviews) {
    this.numOfReviews = numOfReviews;
  }
  public String getThumbnailstillCutUrl() {
    return ThumbnailStillCutUrl;
  }
  public void setThumbnailstillCut(String thumbnailStillCutUrl) {
    ThumbnailStillCutUrl = thumbnailStillCutUrl;
  }
}
