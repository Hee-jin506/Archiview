package com.acv;

import java.io.IOException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
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
    //    영화 영문명
    System.out.println(doc.select("h3.h_movie").select("strong").text());

    // 영화 감독
    System.out.println(doc.select("dl.info_spec").select("dd").get(1).select("p").text());

    //    상영시간
    System.out.println(doc.select("dl.info_spec").select("dd").select("span").get(2).text());
    
    //    개봉일
    System.out.println(doc.select("dl.info_spec").select("dd").select("span").get(3).select("a").text());
    
    // 출연 (첫번째에 영화감독)
    Elements element = doc.select("div.section_group.section_group_frst").select("div.obj_section").select("div.people").select("ul").select("li");
        
    for (int i = 0; i < element.size(); i++) {
      System.out.println(element.get(i).select("a").attr("title"));
    }
    
    //    시놉시스
    String str = doc.select("div.section_group.section_group_frst").select("div.story_area").select("p.con_tx").toString();
    System.out.println(str.replace("<p class=\"con_tx\">", "").replace("<br>&nbsp;", "\n").replace("</p>",""));
    
    //    국가명
    System.out.println(doc.select("dl.info_spec").select("dd").select("span").get(1).select("a").text());
    


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