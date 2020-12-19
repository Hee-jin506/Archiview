package bitcamp.acv.service;

import java.util.HashMap;
import java.util.List;
import bitcamp.acv.domain.Movie;

public interface MovieService {
  List<Movie> list(String keyword) throws Exception;
  Movie findByNo(int no) throws Exception;
  int update(Movie movie) throws Exception;
  int delete(int no) throws Exception;
  int active(int no) throws Exception;
  int getStcNo(int movieNo, String url) throws Exception;
  List<Movie> listByPop() throws Exception;
  List<Movie> listByKeywordTitle(String keyword) throws Exception;
  List<Movie> list1(HashMap<String, Object> keyMap) throws Exception;
}
