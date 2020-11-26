package bitcamp.acv.domain;

import java.sql.Date;
import java.util.List;

public class Review {
  private int no;
  private int stillCut;
  private Member writer;
  private String text;
  private int textX;
  private int textY;
  private int textFont;
  private int textSize;
  private Date registeredDate;
  private Date modifiedDate;
  private boolean status;
  private List<Tag> tags;
  
  public List<Tag> getTags() {
    return tags;
  }
  public void setTags(List<Tag> tags) {
    this.tags = tags;
  }
  public int getNo() {
    return no;
  }
  public void setNo(int no) {
    this.no = no;
  }
  public int getStillCut() {
    return stillCut;
  }
  public void setStillCut(int stillCut) {
    this.stillCut = stillCut;
  }
  public Member getWriter() {
    return writer;
  }
  public void setWriter(Member writer) {
    this.writer = writer;
  }
  public String getText() {
    return text;
  }
  public void setText(String text) {
    this.text = text;
  }
  public int getTextX() {
    return textX;
  }
  public void setTextX(int textX) {
    this.textX = textX;
  }
  public int getTextY() {
    return textY;
  }
  public void setTextY(int textY) {
    this.textY = textY;
  }
  public int getTextFont() {
    return textFont;
  }
  public void setTextFont(int textFont) {
    this.textFont = textFont;
  }
  public int getTextSize() {
    return textSize;
  }
  public void setTextSize(int textSize) {
    this.textSize = textSize;
  }
  public Date getRegisteredDate() {
    return registeredDate;
  }
  public void setRegisteredDate(Date registeredDate) {
    this.registeredDate = registeredDate;
  }
  public Date getModifiedDate() {
    return modifiedDate;
  }
  public void setModifiedDate(Date modifiedDate) {
    this.modifiedDate = modifiedDate;
  }
  public boolean isStatus() {
    return status;
  }
  public void setStatus(boolean status) {
    this.status = status;
  }
  
}
