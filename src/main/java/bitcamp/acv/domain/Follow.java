package bitcamp.acv.domain;

import java.sql.Timestamp;

public class Follow {


  // 팔로우 대상 타입
  public static final int MEMBER = 1;
  public static final int TAG = 2;

  private int no; // 팔로우 이력 번호 fno
  private Member followingMember; // 팔로우를 신청한 회원 flwing_mbr
  private int followedType; // 팔로우한 대상의 유형(1=회원,2=태그) fano
  private int followedNo; // 팔로우한 대상의 번호 target
  private Timestamp followedDate; // 팔로우한 날짜 fdt
  private int status; // 팔로우 상태 번호 stat 1=팔로우 2=언팔로우
  private String nickName;
  private Member targetMember; // 팔로우한 회원
  private Tag targetTag; // 팔로우한 태그

  public int getFollowedType() {
    return followedType;
  }
  public void setFollowedType(int followedType) {
    this.followedType = followedType;
  }
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
  public int getFollowedNo() {
    return followedNo;
  }
  public void setFollowedNo(int followedNo) {
    this.followedNo = followedNo;
  }
  public static int getMember() {
    return MEMBER;
  }
  public static int getTag() {
    return TAG;
  }
  public String getNickName() {
    return nickName;
  }
  public void setNickName(String nickName) {
    this.nickName = nickName;
  }
  public Member getTargetMember() {
    return targetMember;
  }
  public void setTargetMember(Member targetMember) {
    this.targetMember = targetMember;
  }
  public Tag getTargetTag() {
    return targetTag;
  }
  public void setTargetTag(Tag targetTag) {
    this.targetTag = targetTag;
  }
  public Timestamp getFollowedDate() {
    return followedDate;
  }
  public void setFollowedDate(Timestamp followedDate) {
    this.followedDate = followedDate;
  }
}
