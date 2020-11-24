package com.acv.dao;

import java.util.List;
import com.acv.domain.Movie;

public interface MovieDao {
  List<Movie> findAll(String keyword) throws Exception;
  int insert(Movie movie) throws Exception;
}
