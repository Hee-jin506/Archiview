package bitcamp.acv.domain;

import java.sql.Date;
import java.util.List;

public class Review {
  private int no;
  private int stillCut;
  private String stcUrl;
  private String text;
  private int textX;
  private int textY;
  private int textFont;
  private int textSize;
  private Date registeredDate;
  private Date modifiedDate;
  private boolean status;
  private String statusName;
  private List<Tag> tags;
  private String movieTitle;
  private int writerNo;
  private String writerPhoto;
  private String writerNick;
  private int isFollowing;
  private int liking;

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
  public String getStatusName() {
    return this.isStatus() ? "게시중" : "삭제";
  }
  public void setStatusName(String statusName) {
    this.statusName = statusName;
  }
  public String getMovieTitle() {
    return movieTitle;
  }
  public void setMovieTitle(String movieTitle) {
    this.movieTitle = movieTitle;
  }
  public int getWriterNo() {
    return writerNo;
  }
  public void setWriterNo(int writerNo) {
    this.writerNo = writerNo;
  }
  public String getWriterPhoto() {
    return writerPhoto;
  }
  public void setWriterPhoto(String writerPhoto) {
    this.writerPhoto = writerPhoto;
  }
  public String getWriterNick() {
    return writerNick;
  }
  public void setWriterNick(String writerNick) {
    this.writerNick = writerNick;
  }
  public int getIsFollowing() {
    return isFollowing;
  }
  public void setIsFollowing(int isFollowing) {
    this.isFollowing = isFollowing;
  }
  public int getLiking() {
    return liking;
  }
  public void setLiking(int liking) {
    this.liking = liking;
  }
  public String getStcUrl() {
    return stcUrl;
  }
  public void setStcUrl(String stcUrl) {
    this.stcUrl = stcUrl;
  }

}
