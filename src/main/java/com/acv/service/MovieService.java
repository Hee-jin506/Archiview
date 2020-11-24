package com.acv.service;

import java.util.List;
import com.acv.domain.Movie;

public interface MovieService {
  int add(Movie movie) throws Exception;
  List<Movie> list() throws Exception;
}
