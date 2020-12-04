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
  public List<Movie> list(String keyword) throws Exception {
    return movieDao.findAll(keyword);
  }

  @Override
  public Movie findByNo(int no) throws Exception {
    return movieDao.findByNo(no);
  }

  @Override
  public int update(Movie movie) throws Exception {
    return movieDao.update(movie);
  }

  @Override
  public int getStcNo(int movieNo, String url) throws Exception {
    return movieDao.getStcNo(movieNo, url);
  }
}
