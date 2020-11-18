package com.acv;

import java.io.IOException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
public class App2 {

	public static void main(String[] args) {
		String url = "https://movie.naver.com/movie/bi/mi/basic.nhn?code=193194"; //크롤링할 url지정
		Document doc = null;        //Document에는 페이지의 전체 소스가 저장된다

		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Elements contents = doc.select("a");
		
		for (Element element : contents) {
		  System.out.println(element.text());
		}
	}
}