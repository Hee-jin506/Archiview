package com.acv;

import java.io.IOException;
import java.util.Iterator;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
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
    Iterator<Element> iterator = doc.select("h3.h_movie").iterator();
    System.out.println(iterator.next().select("strong").text());
    //    영화 제목
    //    영화 감독
    //    영화 영문명
    //    상영시간
    //    제작연도
    //    개봉일
    //    출연
    //    시놉시스
    //    국가명


    System.out.println("============================================================");

    //Iterator을 사용하여 하나씩 값 가져오기
    //    Iterator<Element> ie1 = element.select("strong.rank").iterator();
    //    Iterator<Element> ie2 = element.select("strong.title").iterator();
    //    System.out.println(element.select("a"));
    //    Iterator<Element> ie2 = element.select("strong.h_movie2").iterator();

    //    while (ie1.hasNext()) {
    //      System.out.println(ie1.next().text()+"\t"+ie2.next().text());
    //    }
    //    while (ie1.hasNext()) {
    //      System.out.println(ie1.next().text());
    //    }
    //    while (ie2.hasNext()) {
    //      System.out.println(ie2.next().text());
    //    }
    //    System.out.println(ie1.next().text());

    System.out.println("============================================================");
  }
}