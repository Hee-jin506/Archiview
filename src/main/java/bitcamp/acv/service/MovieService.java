package bitcamp.acv.service;

import java.util.List;
import bitcamp.acv.domain.Movie;

public interface MovieService {
  List<Movie> list(String keyword) throws Exception;
  Movie findByNo(int no) throws Exception;
  int update(Movie movie) throws Exception;
  int getStcNo(int movieNo, String url) throws Exception;
  List<Movie> listByPop() throws Exception;
}
