package bitcamp.acv.domain;

import java.sql.Date;

public class Member {

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
  private Date statusModifiedDate; // 회원 상태 변경일


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



}
