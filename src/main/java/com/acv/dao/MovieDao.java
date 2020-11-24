package com.acv.dao;

import java.util.List;
import com.acv.domain.Movie;

public interface MovieDao {
  int insert(Movie movie) throws Exception;
  int delete(int no) throws Exception;
  Movie findByNo(int no) throws Exception;
  List<Movie> findAll(String keyword) throws Exception;
  int update(Movie board) throws Exception;
  int updateViewCount(int no) throws Exception;
}
