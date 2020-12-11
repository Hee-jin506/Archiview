package bitcamp.acv.domain;

import java.sql.Date;
import java.util.List;

public class Tag {

  private String INACTIVE = "삭제";
  private String ACTIVE = "게시중";

  private int no;
  private String title;
  private boolean status;
  private Date registeredDate;
  private List<Integer> reviews;
  private List<Integer> followers;
  private String statusName;
  private int numOfReviews;

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
}
