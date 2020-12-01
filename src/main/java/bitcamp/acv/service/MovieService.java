package bitcamp.acv.service;

import java.util.List;
import bitcamp.acv.domain.Movie;

public interface MovieService {
  List<Movie> list() throws Exception;
  List<Movie> list(String keyword) throws Exception;
  Movie findByNo(int no) throws Exception;
  int getStillCutNo(String stillcut) throws Exception;
}
