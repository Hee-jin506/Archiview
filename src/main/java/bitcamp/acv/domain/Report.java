package bitcamp.acv.domain;

import java.sql.Date;

public class Report {

  // 신고 대상 타입
  public static final int MEMBER = 1;
  public static final int REVIEW = 2;
  public static final int COMMENT = 3;

  private int no;
  private Member reportingMember;
  private int reportedType;
  private int reportedNo;
  private String why;
  private String status;
  private String processingContent;
  private Date reportedDate;
  private Date ProcessedDate;

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
