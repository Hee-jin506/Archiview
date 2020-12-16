package bitcamp.acv.dao;

import java.util.List;
import java.util.Map;
import bitcamp.acv.domain.Movie;

public interface MovieDao {
  List<Movie> findAll(String keyword) throws Exception;
  Movie findByNo(int no) throws Exception;
  int update(Movie movie) throws Exception;
  int delete(int no) throws Exception;
  int active(int no) throws Exception;
  int getStcNo(Map<String,Object> params) throws Exception;
  List<Movie> finByPop() throws Exception;
  List<Movie> findByKeywordTitle(String keyword) throws Exception;
}
