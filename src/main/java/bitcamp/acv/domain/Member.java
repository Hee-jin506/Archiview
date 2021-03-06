package bitcamp.acv.domain;

import java.sql.Date;
import java.util.List;

public class Member {


  public static final int GENERAL = 1;
  public static final int MANAGER = 0;

  public static final int ARCHIVIEW = 1;
  public static final int GOOGLE = 2;
  public static final int KAKAO = 3;

  //  public static final int IN_ACTION = 1;
  //  public static final int SUSPENSION = 2;
  //  public static final int WITHDRAWAL = 3;

  private int no; // 회원 번호
  private int authority; // 권한
  private String name; // 이름
  private int loginNo; // 로그인 유형 번호
  private String email; // 이메일
  private String password; // 암호
  private String nickName; // 별명
  private String photo; // 사진
  private String intro; // 소개글
  private int questionsNo; // 비밀번호 힌트 질문 번호
  private String questionsAnswer; // 비밀번호 힌트 정답
  private Date registeredDate; // 회원 가입일
  private int status; // 회원 상태 번호
  private String statusTitle;
  private Date statusModifiedDate; // 회원 상태 변경일

  private int following; // 내가 팔로잉하는 사람들
  private int followers;
  private int likers;

  private List<Review> reviews; // 본인의 게시물들
  private int numOfReviews; // 본인의 게시물들 개수
  private List<Review> saved; // 저장한 게시물들
  private int numOfSaved; // 저장한 게시물들 개수
  
  private boolean followed;
  
  // 로그인유저가 팔로우하고있는지 여부(팔로우 버튼 색깔 바꿀려고)
  private boolean followingState = false;

  public int getNo() {
    return no;
  }
  public void setNo(int no) {
    this.no = no;
  }
  public int getAuthority() {
    return authority;
  }
  public void setAuthority(int authority) {
    this.authority = authority;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public int getLoginNo() {
    return loginNo;
  }
  public void setLoginNo(int loginNo) {
    this.loginNo = loginNo;
  }
  public String getEmail() {
    return email;
  }
  public void setEmail(String email) {
    this.email = email;
  }

  public String getPassword() {
    return password;
  }
  public void setPassword(String password) {
    this.password = password;
  }
  public String getNickName() {
    return nickName;
  }
  public void setNickName(String nickName) {
    this.nickName = nickName;
  }
  public String getPhoto() {
    return photo;
  }
  public void setPhoto(String photo) {
    this.photo = photo;
  }
  public String getIntro() {
    return intro;
  }
  public void setIntro(String intro) {
    this.intro = intro;
  }
  public int getQuestionsNo() {
    return questionsNo;
  }
  public void setQuestionsNo(int questionsNo) {
    this.questionsNo = questionsNo;
  }

  public String getQuestionsAnswer() {
    return questionsAnswer;
  }
  public void setQuestionsAnswer(String questionsAnswer) {
    this.questionsAnswer = questionsAnswer;
  }
  public Date getRegisteredDate() {
    return registeredDate;
  }
  public void setRegisteredDate(Date registeredDate) {
    this.registeredDate = registeredDate;
  }
  public int getStatus() {
    return status;
  }
  public void setStatus(int status) {
    this.status = status;
  }
  public Date getStatusModifiedDate() {
    return statusModifiedDate;
  }
  public void setStatusModifiedDate(Date statusModifiedDate) {
    this.statusModifiedDate = statusModifiedDate;
  }
  public int getFollowers() {
    return followers;
  }
  public void setFollowers(int followers) {
    this.followers = followers;
  }
  public int getLikers() {
    return likers;
  }
  public void setLikers(int likers) {
    this.likers = likers;
  }
  public String getStatusTitle() {
    return statusTitle;
  }
  public void setStatusTitle(String statusTitle) {
    this.statusTitle = statusTitle;
  }
  public List<Review> getReviews() {
    return reviews;
  }
  public void setReviews(List<Review> reviews) {
    this.reviews = reviews;
  }
  public List<Review> getSaved() {
    return saved;
  }
  public void setSaved(List<Review> saved) {
    this.saved = saved;
  }
  public int getFollowing() {
    return following;
  }
  public void setFollowing(int following) {
    this.following = following;
  }
  public boolean isFollowed() {
    return followed;
  }
  public void setFollowed(boolean followed) {
    this.followed = followed;
  }
  public int getNumOfReviews() {
    return this.reviews.size();
  }
  public int getNumOfSaved() {
    return this.saved.size();
  }
  public boolean isFollowingState() {
    return followingState;
  }
  public void setFollowingState(boolean followingState) {
    this.followingState = followingState;
  }
}
