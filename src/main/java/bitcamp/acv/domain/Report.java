package bitcamp.acv.domain;

import java.sql.Date;

public class Report {

  // 신고 대상 타입
  public static final int MEMBER = 1;
  public static final int REVIEW = 2;
  public static final int COMMENT = 3;
  public static final int TAG = 4;

  private int no; // 신고 번호
  private Member reportingMember; // 신고한 회원
  private int reportedType; // 신고 유형
  private int reportedNo; // 신고된 대상 번호
  private String why; // 신고 사유
  private String status; // 신고 처리 상태
  private String processingContent; // 신고 처리 내용
  private Date reportedDate; // 신고 일시
  private Date ProcessedDate; //  신고 처리 완료 일시

  public int getNo() {
    return no;
  }
  public void setNo(int no) {
    this.no = no;
  }
  public Member getReportingMember() {
    return reportingMember;
  }
  public void setReportingMember(Member reportingMember) {
    this.reportingMember = reportingMember;
  }
  public int getReportedType() {
    return reportedType;
  }
  public void setReportedType(int reportedType) {
    this.reportedType = reportedType;
  }
  public int getReportedNo() {
    return reportedNo;
  }
  public void setReportedNo(int reportedNo) {
    this.reportedNo = reportedNo;
  }
  public String getWhy() {
    return why;
  }
  public void setWhy(String why) {
    this.why = why;
  }
  public String getStatus() {
    return status;
  }
  public void setStatus(String status) {
    this.status = status;
  }
  public String getProcessingContent() {
    return processingContent;
  }
  public void setProcessingContent(String processingContent) {
    this.processingContent = processingContent;
  }
  public Date getReportedDate() {
    return reportedDate;
  }
  public void setReportedDate(Date reportedDate) {
    this.reportedDate = reportedDate;
  }
  public Date getProcessedDate() {
    return ProcessedDate;
  }
  public void setProcessedDate(Date processedDate) {
    ProcessedDate = processedDate;
  }
  public static int getMember() {
    return MEMBER;
  }
  public static int getReview() {
    return REVIEW;
  }
  public static int getComment() {
    return COMMENT;
  }


}
