package bitcamp.acv.domain;

import java.sql.Date;

public class Report {
  
  public static final int MEMBER = 1;
  public static final int REVIEW = 2;
  public static final int COMMENT = 3;
  
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
  public Date getReportedDate() {
    return reportedDate;
  }
  public void setReportedDate(Date reportedDate) {
    this.reportedDate = reportedDate;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public boolean isStatus() {
    return status;
  }
  public void setStatus(boolean status) {
    this.status = status;
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
  private int no;
  private Member reportingMember;
  private int reportedType;
  private int reportedNo;
  private Date reportedDate;
  private String content;
  private boolean status;
  private Date ProcessedDate;
}
