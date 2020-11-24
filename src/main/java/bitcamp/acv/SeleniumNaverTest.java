package com.acv;

import java.sql.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;
import org.openqa.selenium.By;
import org.openqa.selenium.By.ByClassName;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class SeleniumNaverTest {
  public static void main(String... args) {
    // naver
    WebDriver driver = null;
    // 카운트 무시하세요 ㅠㅠ.
    double t_cnt = 0;

    try {
      // drvier 설정 - 크롬드라이버 위치 => 본인걸로 바꾸셔야 합니다.
      System.setProperty("webdriver.chrome.driver", "/Users/heejin/Downloads/chromedriver");
      // Chrome 드라이버 인스턴스 설정
      driver = new ChromeDriver();
      // URL로 접속
      driver.get("https://movie.naver.com/movie/bi/mi/basic.nhn?code=189141");
      // 대기 설정(정보를 가져오기 전에 로딩이 완료 안되는 경우가 있음)
      driver.manage().timeouts().implicitlyWait(2, TimeUnit.SECONDS);

      // 영화 제목
      System.out.println("영화 제목 입력");
      System.out.println(driver.findElement(By.className("mv_info_area")).findElement(By.className("h_movie")).findElements(By.tagName("a")).get(0).getText());

      // 영화 영문명
      System.out.println("영화 영문제목 입력");
      System.out.println(driver.findElement(By.className("mv_info_area")).findElement(By.className("h_movie2")).getText());

      // 영화 감독
      System.out.println("영화 감독 입력");
      System.out.println(driver.findElement(By.className("mv_info_area")).findElement(By.className("mv_info")).findElement(By.className("info_spec")).findElements(By.tagName("dd")).get(1).getText());

      // 상영시간
      System.out.println("상영시간 입력");
      System.out.println(driver.findElement(By.className("mv_info_area")).findElement(By.className("mv_info")).findElement(By.className("info_spec")).findElements(By.tagName("dd")).get(0).findElements(By.tagName("span")).get(2).getText());

      // 개봉일
      System.out.println("개봉일 입력");
      List<WebElement> elements = driver.findElement(By.className("mv_info_area")).findElement(By.className("mv_info")).findElement(By.className("info_spec")).findElements(By.tagName("dd")).get(0).findElements(By.tagName("span")).get(3).findElements(By.tagName("a"));
      if (elements.size() > 2) {
        //        System.out.println(Date.valueOf(element.get(2).text().replace(" ", "").replace(".", "-")+element.get(3).text().replace(" ", "").replace(".", "-")));
      } else if (elements.size()  == 2) {
        StringBuilder openDate = new StringBuilder();
        for (WebElement element : elements) {
          openDate.append(element.getText());
        }
        System.out.println(Date.valueOf(openDate.toString().replace(".", "-").replace("\n", "")));
      } 

      //    시놉시스
      System.out.println("시놉시스 입력");
      StringBuilder synopsis = new StringBuilder();
      synopsis.append(driver.findElement(By.className("obj_section")).findElement(By.className("h_tx_story")).getText());
      synopsis.append(driver.findElement(By.className("obj_section")).findElement(By.className("con_tx")).getText());
      System.out.println(synopsis.toString());

      //    국가명
      System.out.println("국가명 입력");
      System.out.println(driver.findElement(By.className("mv_info_area")).findElement(By.className("mv_info")).findElement(By.className("info_spec")).findElements(By.tagName("dd")).get(0).findElements(By.tagName("span")).get(1).findElement(By.tagName("a")).getText());

      driver.findElement(By.className("end_sub_tab")).findElement(By.className("tab02")).click();
      
      // 출연 
      System.out.println("출연진 입력");
      elements = driver.findElement(By.className("section_group_frst")).findElement(By.className("noline")).findElement(By.className("made_people")).findElement(By.tagName("ul")).findElements(By.tagName("li"));
      System.out.println(elements);
      StringBuilder actors = new StringBuilder();
      for (int i = 0; i < elements.size(); i++) {
        actors.append(elements.get(i).findElement(By.)).findElement(By.tagName("a")).getText());
        if (i < elements.size() - 1) {
          actors.append(",");
        }
      }
      System.out.println(actors.toString());

      driver.get("https://movie.naver.com/movie/bi/mi/photoView.nhn?code=189141");
      // 대기 설정(정보를 가져오기 전에 로딩이 완료 안되는 경우가 있음)
      driver.manage().timeouts().implicitlyWait(2, TimeUnit.SECONDS);


      //      // "photo_area"클래스
      //      WebElement t_element = driver.findElement(By.id("photo_area"));

      // 스틸컷의 숫자를 가져오는 코드 입니다. 무시하세요
      //      String stc = t_element.findElement(By.cssSelector("#photoTypeGroup li[imagetype=\'STILLCUT\']")).findElement(By.tagName("em")).getText();

      //By.className("title_area");

      // 전체 카운트(total count)의 숫자를 가져온다. (스틸컷 + 프로모션 + 포스터)
      //String tc = t_element.findElement(By.className("count")).getText();

      // 1 / xx건 이라는 문자열을 " "로 잘라준다. (total count cut)
      //String[] tcc = tc.split(" ");

      // xx건 이라는 문자열에서 int 값만 추출한다.
      //String intStr = tcc[2].replaceAll("[^\\d]", "");

      // String을 int로 변환시킨다.
      //t_cnt = Integer.parseInt(intStr);

      // next button을 누르는 횟수를 지정한다.
      // 소수점이 있으면 올림으로 처리한다.
      //double nb = Math.ceil(t_cnt / 8);

      // 다음 버튼을 nb번 누르게 했습니다.
      //      for (int i = 0 ; i < nb ; i++) {
      //        WebElement element = crawl(t_element);
      //        element.findElement(By.className("btn_next")).click();
      //      }



      //      for (int i = pnf; i < lp; i++) {
      //        WebElement element = crawl(t_element);
      //        element.findElement(By.className("btn_next")).click();
      //      }

      //      if (element.findElement(By.className("btn_next")))

      // while (true) {
      // try {
      // // css selector로 element를 찾는다.
      // element = driver.findElement(By.cssSelector("[href^='/626']"));
      // // 루프 정지
      // break;
      // } catch (Throwable e) {
      // // 해당 element가 없으면 아래의 다음 페이지 element를 찾는다.
      // element = driver.findElement(By.cssSelector(".paging li.active+li > a"));
      // }
      // }
      // // id가 promptEx인 데이터를 찾는다.
      // element = driver.findElement(By.xpath("//*[@id='promptEx']"));
      // // 버튼은 클릭이 되는데 link 계열은 script로 클릭해야 한다.
      // element.click();
      // // xpath로 팝업의 dom를 찾는다.
      // element = driver.findElement(By.xpath("/html/body/div[6]/div/div/div[2]/div/form/input"));
      // // input text에 test의 값을 넣는다.
      // element.sendKeys("test");
      // // 5초 기다린다.
      // Thread.sleep(5000);
      // // xpath로 팝업의 dom를 찾는다.
      // element = driver.findElement(By.xpath("/html/body/div[6]/div/div/div[2]/div/form/input"));
      // // 속성 value를 출력한다.
      // System.out.println(element.getAttribute("value"));
      // // .article의 글에 p 태그의 속성을 전부 가져온다.
      // List<WebElement> elements = driver.findElements(By.cssSelector(".article p"));
      // for (WebElement ele : elements) {
      // // 속성의 NodeText를 전부 출력한다.
      // System.out.println(ele.getText());
      // }
    } catch (Throwable e) {
      e.printStackTrace();
    } finally {
      driver.close();
    }
  }

  public static WebElement crawl(WebElement t_element) {
    // t_element html 클래스의 포토 클래스
    WebElement element = t_element.findElement(ByClassName.className("photo"));
    // 스틸컷 8장의 태그를 리스트에 담음
    List<WebElement> e_list = element.findElement(By.className("list_area")).findElements(By.tagName("a"));

    // 8장의 스틸컷을 클릭하는 반복문
    for (WebElement e : e_list) {
      e.click();
      try {
        // 페이지 로딩 속도가 못따라갈 수 있으니 약간의 대기 시간을 줌
        Thread.sleep(100);
      } catch (InterruptedException e1) {
        e1.printStackTrace();
      }
      // 스틸컷을 눌렀을때 refresh 되는 viewer_img 클래스의 alt 가 stillcut 일때
      String alt = t_element.findElement(By.className("viewer_img")).findElement(By.tagName("img")).getAttribute("alt");
      if (alt.equalsIgnoreCase("STILLCUT")) {
        // 포토 이미지의 url을 출력함
        String str = t_element.findElement(By.className("viewer_img")).findElement(By.tagName("img")).getAttribute("src");
        System.out.printf("Stillcut=%s\n", str);
      }

      // 포스터 출력, 스틸컷과 동일한 방법
      alt = t_element.findElement(By.className("viewer_img")).findElement(By.tagName("img")).getAttribute("alt");
      if (alt.equalsIgnoreCase("POSTER")) {
        // 포토 이미지의 url을 출력함
        String str = t_element.findElement(By.className("viewer_img")).findElement(By.tagName("img")).getAttribute("src");
        System.out.printf("Poster=%s\n", str);

        // 프로모션은 안 쓰기 때문에 생략

      }
    }
    return element;
  }

}

