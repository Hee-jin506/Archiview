package bitcamp.acv.domain;

import java.sql.Date;

public class Follow {

  // 팔로우 대상 타입
  public static final int MEMBER = 1;
  public static final int TAG = 2;

  private int no; // 팔로우 이력 번호 fno
  private Member followingMember; // 팔로우를 신청한 회원 flwing_mbr
  private int followedType; // 팔로우한 유형(태그/회원) fano
  private int followedNo; // 팔로우한 대상 대상(태그/회원) target

  private Date followedDate; // 팔로우한 날짜 fdt
  private int status; // 팔로우 상태 번호 stat 1=팔로우 2=언팔로우

  public int getStatus() {
    return status;
  }
  public void setStatus(int status) {
    this.status = status;
  }
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
