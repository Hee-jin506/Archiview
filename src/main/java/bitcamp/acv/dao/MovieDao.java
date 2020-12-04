package bitcamp.acv.dao;

import java.util.List;
import bitcamp.acv.domain.Movie;

public interface MovieDao {
  int insert(Movie movie) throws Exception;
  List<Movie> findAll() throws Exception;
  List<Movie> findAll(String keyword) throws Exception;
  Movie findByNo(int no) throws Exception;
  int getStillCutNo(String stillcut) throws Exception;
  String getStcUrl(int stcNo) throws Exception;
  int update(Movie movie) throws Exception;
  int getStcNo(String stillcut) throws Exception;
}
