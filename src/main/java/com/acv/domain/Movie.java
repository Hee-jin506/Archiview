package com.acv.domain;

import java.sql.Date;
import java.util.List;

public class Movie {

  private int no;
  private String title;
  private String directors;
  private String englishTitle;
  private int runtime;
  private Date openDate;
  private String actors;
  private String synopsis;
  private String nation;
  private int status;
  private Date registeredDate;
  private List<String> stillCuts;
  private List<String> posters;
  private List<String> genres;

  public int getNo() {
    return no;
  }

  public void setNo(int no) {
    this.no = no;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getDirectors() {
    return directors;
  }

  public void setDirectors(String directors) {
    this.directors = directors;
  }

  public String getEnglishTitle() {
    return englishTitle;
  }

  public void setEnglishTitle(String englishTitle) {
    this.englishTitle = englishTitle;
  }

  public int getRuntime() {
    return runtime;
  }

  public void setRuntime(int runtime) {
    this.runtime = runtime;
  }

  public Date getOpenDate() {
    return openDate;
  }

  public void setOpenDate(Date openDate) {
    this.openDate = openDate;
  }

  public String getActors() {
    return actors;
  }

  public void setActors(String actors) {
    this.actors = actors;
  }

  public String getSynopsis() {
    return synopsis;
  }

  public void setSynopsis(String synopsis) {
    this.synopsis = synopsis;
  }

  public String getNation() {
    return nation;
  }

  public void setNation(String nation) {
    this.nation = nation;
  }

  public int getStatus() {
    return status;
  }

  public void setStatus(int status) {
    this.status = status;
  }

  public Date getRegisteredDate() {
    return registeredDate;
  }

  public void setRegisteredDate(Date registeredDate) {
    this.registeredDate = registeredDate;
  }

  public List<String> getStillCuts() {
    return stillCuts;
  }

  public void setStillCuts(List<String> stillCuts) {
    this.stillCuts = stillCuts;
  }

  public List<String> getPosters() {
    return posters;
  }

  public void setPosters(List<String> posters) {
    this.posters = posters;
  }

  public List<String> getGenres() {
    return genres;
  }

  public void setGenres(List<String> genres) {
    this.genres = genres;
  }

}
