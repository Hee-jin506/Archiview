package bitcamp.acv.domain;

import java.sql.Date;

public class Like {

  public static final int REVIEW = 1;
  public static final int COMMENT = 2;

  private int no;
  private Member likingMember;
  private int likedType;
  private int likedNo;
  private Date likedDate;


  public int getNo() {
    return no;
  }
  public void setNo(int no) {
    this.no = no;
  }
  public Member getLikingMember() {
    return likingMember;
  }
  public void setLikingMember(Member likingMember) {
    this.likingMember = likingMember;
  }
  public int getLikedType() {
    return likedType;
  }
  public void setLikedType(int likedType) {
    this.likedType = likedType;
  }
  public int getLikedNo() {
    return likedNo;
  }
  public void setLikedNo(int likedNo) {
    this.likedNo = likedNo;
  }
  public Date getLikedDate() {
    return likedDate;
  }
  public void setLikedDate(Date likedDate) {
    this.likedDate = likedDate;
  }
  public static int getReview() {
    return REVIEW;
  }
  public static int getComment() {
    return COMMENT;
  }

}

