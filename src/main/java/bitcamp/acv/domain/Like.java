package bitcamp.acv.domain;

import java.sql.Date;

public class Like {

  public static final int REVIEW = 1;
  public static final int COMMENT = 2;

  private int no; // 좋아요 이력 번호 lno
  private Member likingMember; // 좋아요한 회원 mno
  private int likedType; // 좋아요된 대상 유형 lano
  private int likedNo; // 좋아요된 대상 target
  private Date likedDate; // 좋아요 누른 일시 ldt


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

