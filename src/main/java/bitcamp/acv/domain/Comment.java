package bitcamp.acv.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class Comment {

  private int no; // 댓글 번호
  private int reviewNo; // 영화 후기 번호
  private int order; // 댓글 순서
  private int level; // 댓글 단계
  private int memberNo; // 댓글단 회원
  private String content; // 내용
  private Timestamp registeredDate; // 등록일
  private int status; // 상태
  private Date modifiedDate; // 수정일
  private int groupNo; // 그룹 번호
  private String photo;
  private String nickName;
  private Review review;
  private Member member;
  private String rdtFromNow;

  public int getNo() {
    return no;
  }
  public void setNo(int no) {
    this.no = no;
  }
  public int getReviewNo() {
    return reviewNo;
  }
  public void setReviewNo(int reviewNo) {
    this.reviewNo = reviewNo;
  }
  public int getOrder() {
    return order;
  }
  public void setOrder(int order) {
    this.order = order;
  }
  public int getLevel() {
    return level;
  }
  public void setLevel(int level) {
    this.level = level;
  }
  public int getMemberNo() {
    return memberNo;
  }
  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public int getStatus() {
    return status;
  }
  public void setStatus(int status) {
    this.status = status;
  }
  public Date getModifiedDate() {
    return modifiedDate;
  }
  public void setModifiedDate(Date modifiedDate) {
    this.modifiedDate = modifiedDate;
  }
  public Review getReview() {
    return review;
  }
  public void setReview(Review review) {
    this.review = review;
  }
  public String getPhoto() {
    return photo;
  }
  public void setPhoto(String photo) {
    this.photo = photo;
  }
  public String getNickName() {
    return nickName;
  }
  public void setNickName(String nickName) {
    this.nickName = nickName;
  }
  public Member getMember() {
    return member;
  }
  public void setMember(Member member) {
    this.member = member;
  }
  public int getGroupNo() {
    return groupNo;
  }
  public void setGroupNo(int groupNo) {
    this.groupNo = groupNo;
  }
  public Timestamp getRegisteredDate() {
    return registeredDate;
  }
  public void setRegisteredDate(Timestamp registeredDate) {
    this.registeredDate = registeredDate;
  }
  public String getRdtFromNow() {
    return rdtFromNow;
  }
  public void setRdtFromNow(String rdtFromNow) {
    this.rdtFromNow = rdtFromNow;
  }




}
