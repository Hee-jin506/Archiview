package bitcamp.acv.domain;

import java.sql.Timestamp;

public class NewsFeed {
  private String nick;
  private String photo;
  private int targetType;
  private Timestamp date;
//  member 1
//  review 1 comment 2
  public String getNick() {
    return nick;
  }
  public void setNick(String nick) {
    this.nick = nick;
  }
  public String getPhoto() {
    return photo;
  }
  public void setPhoto(String photo) {
    this.photo = photo;
  }
  public int getTargetType() {
    return targetType;
  }
  public void setTargetType(int targetType) {
    this.targetType = targetType;
  }
  public Timestamp getDate() {
    return date;
  }
  public void setDate(Timestamp date) {
    this.date = date;
  }

}
