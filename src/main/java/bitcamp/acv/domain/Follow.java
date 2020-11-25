package bitcamp.acv.domain;

import java.sql.Date;

public class Follow {
  
  public static final int MEMBER = 1;
  public static final int TAG = 2;
  
  private int no;
  private Member followingMember;
  private int followedType;
  private int followedNo;
  private Date followedDate;
  public int getNo() {
    return no;
  }
  public void setNo(int no) {
    this.no = no;
  }
  public Member getFollowingMember() {
    return followingMember;
  }
  public void setFollowingMember(Member followingMember) {
    this.followingMember = followingMember;
  }
  public int getFollowedType() {
    return followedType;
  }
  public void setFollowedType(int followedType) {
    this.followedType = followedType;
  }
  public int getFollowedNo() {
    return followedNo;
  }
  public void setFollowedNo(int followedNo) {
    this.followedNo = followedNo;
  }
  public Date getFollowedDate() {
    return followedDate;
  }
  public void setFollowedDate(Date followedDate) {
    this.followedDate = followedDate;
  }
  public static int getMember() {
    return MEMBER;
  }
  public static int getTag() {
    return TAG;
  }
  
  

}
