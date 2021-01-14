package bitcamp.acv.domain;

import java.sql.Timestamp;

public class Save {

  private int no; // sno
  private int savedNo; // rvno
  private int savingMemberNo; // mno
  private Timestamp savedDate; // sdt
  
  public int getNo() {
    return no;
  }
  public void setNo(int no) {
    this.no = no;
  }
  public Timestamp getSavedDate() {
    return savedDate;
  }
  public void setSavedDate(Timestamp savedDate) {
    this.savedDate = savedDate;
  }
  public int getSavedNo() {
    return savedNo;
  }
  public void setSavedNo(int savedNo) {
    this.savedNo = savedNo;
  }
  public int getSavingMemberNo() {
    return savingMemberNo;
  }
  public void setSavingMemberNo(int savingMemberNo) {
    this.savingMemberNo = savingMemberNo;
  }
}

