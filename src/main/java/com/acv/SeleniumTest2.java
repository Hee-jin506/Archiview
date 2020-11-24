package com.acv;

import java.util.List;
import java.util.concurrent.TimeUnit;
import org.openqa.selenium.By;
import org.openqa.selenium.By.ByClassName;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class SeleniumTest2 {
  public static void main(String... args) {
    WebDriver driver = null;
    // 카운트 무시하세요 ㅠㅠ.
    //    int t_cnt = 0;
    //    int cnt = 0;
    try {
      // drvier 설정 - 크롬드라이버 위치 => 본인걸로 바꾸셔야 합니다.
      System.setProperty("webdriver.chrome.driver", "/Users/heejin/Downloads/chromedriver");
      // Chrome 드라이버 인스턴스 설정
      driver = new ChromeDriver();
      // URL로 접속
      driver.get("http://www.kobis.or.kr/kobis/business/mast/mvie/searchUserMovCdList.do");
      // 대기 설정(정보를 가져오기 전에 로딩이 완료 안되는 경우가 있음)
      driver.manage().timeouts().implicitlyWait(2, TimeUnit.SECONDS);

      // "photo_area"클래스
      List<WebElement> elements = driver.findElement(By.className("tbl3")).findElement(By.tagName("tbody")).findElement(By.tagName("tr").get);
      for (WebElement element : elements) {
        System.out.println(element.findElements(By.tagName("a")).get(0).getText());
      }

      // 스틸컷의 숫자를 가져오는 코드 입니다. 무시하세요
      //      String str = t_element.findElement(By.cssSelector("#photoTypeGroup li[imagetype=\'STILLCUT\']")).findElement(By.tagName("em")).getText();
      //      t_cnt = Integer.parseInt(str);

      // 다음 버튼을 2번 누르게 했습니다.
//      for (int i = 0 ; i < 2; i++) {
//       // WebElement element = crawl(t_element);
//        element.findElement(By.className("table")).click();
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
      // 스틸컷을 눌렀을때 refresh 되는 viewer_img 클래스의 이미지 태그의 src값만 추출
      String str = t_element.findElement(By.className("viewer_img")).findElement(By.tagName("img")).getAttribute("src");
      // 포토 이미지의 url을 출력함
      System.out.println(str);
    }
    return element;
  }
}
