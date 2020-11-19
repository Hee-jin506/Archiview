package com.acv;

import java.io.IOException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
public class test {

  public static void main(String[] args) {
    // Jsoup를 이용해서 http://www.cgv.co.kr/movies/ 크롤링
    String url = "https://movie.naver.com/movie/bi/mi/basic.nhn?code=136900"; //크롤링할 url지정
    Document doc = null;        //Document에는 페이지의 전체 소스가 저장된다

    try {
      doc = Jsoup.connect(url).get();
    } catch (IOException e) {
      e.printStackTrace();
    }
    //select를 이용하여 원하는 태그를 선택한다. select는 원하는 값을 가져오기 위한 중요한 기능이다.
    //    Elements element = doc.select("div.sect-movie-chart");    
    //    Elements element = doc.select("div.mv_info_area");    
    
    // 영화제목
    System.out.println(doc.select("div.mv_info_area").select("div.mv_info").select("div.mv_info").select("h3.h_movie").text());
   
    
    //    영화 영문명
    System.out.println(doc.select("h3.h_movie").select("strong").text());
    
    // 영화 감독
    System.out.println(doc.select("dl.info_spec").select("dd").get(1).select("p").text());
    
    //    상영시간
    System.out.println(doc.select("dl.info_spec").select("dt.step1").select("span"));
    //    제작연도
    //    개봉일
    //    출연
    //    시놉시스
    //    국가명


    System.out.println("============================================================");

//    String url = "https://movie.naver.com/movie/bi/mi/photoViewPopup.nhn?movieCode=136900";
//    Document doc = null;  
    
//    try {
//      doc = Jsoup.connect(url).get();
//    } catch (IOException e) {
//      e.printStackTrace();
//    }
//    //    Elements element = doc.select("div.sect-movie-chart");    
//    //    Elements element = doc.select("div.mv_info_area");    
//    Iterator<Element> iterator = doc.select("h3.h_movie").iterator();
//    System.out.println(iterator.next().select("strong").text());
//    https://movie-phinf.pstatic.net/20190417_250/1555465284425i6WQE_JPEG/movie_image.jpg

    System.out.println("============================================================");
  }
}