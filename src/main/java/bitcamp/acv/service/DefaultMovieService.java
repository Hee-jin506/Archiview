package bitcamp.acv.service;

import java.util.List;
import bitcamp.acv.dao.MovieDao;
import bitcamp.acv.domain.Movie;

public class DefaultMovieService implements MovieService {

  MovieDao movieDao;

  public DefaultMovieService(MovieDao movieDao) {
    this.movieDao = movieDao;
  }

  @Override
  public int add(Movie movie) throws Exception {
    // TODO Auto-generated method stub
    return 0;
  }

  @Override
  public List<Movie> list() throws Exception {
    // TODO Auto-generated method stub
    return null;
  }

}
