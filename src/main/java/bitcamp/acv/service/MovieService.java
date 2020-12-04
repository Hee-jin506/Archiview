package bitcamp.acv.service;

import java.util.List;
import bitcamp.acv.domain.Movie;

public interface MovieService {
  List<Movie> list() throws Exception;
  List<Movie> list(String keyword) throws Exception;
  Movie findByNo(int no) throws Exception;
  String getStcUrl(int stcNo) throws Exception;
  int update(Movie movie) throws Exception;
  int getStcNo(String stillcut) throws Exception;
}
