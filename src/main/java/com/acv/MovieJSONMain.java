package com.acv;
import java.io.BufferedInputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;


// 총 79,619개

public class MovieJSONMain {

  List<String> urlList = new ArrayList<String>(); 
  List<String> movieCds = new ArrayList<>();

  public MovieJSONMain() throws Exception{
    readUrl();
    Iterator<String> iterator = urlList.iterator();
    while (iterator.hasNext()) {
      JSONParser jsonparser = new JSONParser();
      JSONObject jsonobject = (JSONObject)jsonparser.parse(iterator.next());
      JSONObject json =  (JSONObject) jsonobject.get("movieListResult");
      JSONArray array = (JSONArray)json.get("movieList");
      for(int i = 0 ; i < array.size(); i++){
        JSONObject entity = (JSONObject)array.get(i);
        String movieCd = (String) entity.get("movieCd");
        System.out.println(movieCd);
        movieCds.add(movieCd);
      }
    }
  }

  private void readUrl() throws Exception {
    BufferedInputStream reader = null;
    try {
      for (int j= 1 ; j < 9 ; j++) { // 1페이지~8페이지, 총 800개
        URL url = new URL(
            "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/"
                + "searchMovieList.json"
                + "?key=c337dd225f05a976e1007e7793e1f96f"
                + "&curPage="
                + j
                + "&itemPerPage=100" // 1페이지당 100개가 최대임
            );
        reader = new BufferedInputStream(url.openStream());
        StringBuffer buffer = new StringBuffer();
        int i;
        byte[] b = new byte[4096];
        while( (i = reader.read(b)) != -1){
          buffer.append(new String(b, 0, i));
        }
        urlList.add(buffer.toString());
      }
    } finally {
      if (reader != null)
        reader.close();
    }
  }
  
  public List<String> getUrlList() {
    return urlList;
  }
  public void setUrlList(List<String> urlList) {
    this.urlList = urlList;
  }
  public List<String> getMovieCds() {
    return movieCds;
  }
  public void setMovieCds(List<String> movieCds) {
    this.movieCds = movieCds;
  }
}