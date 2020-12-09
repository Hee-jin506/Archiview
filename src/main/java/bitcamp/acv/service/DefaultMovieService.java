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

  @Override
  public List<Movie> listByPop() throws Exception {
    List<Movie> movies = movieDao.findAll(null);
    for (int i = 0; i < movies.size(); i++) {
      for (int j =  movies.size() -1; j > i; j--) {
        int frontPop = movies.get(j - 1).getReviews().size();
        int backPop = movies.get(j).getReviews().size();
        if (frontPop < backPop) {
          swap(movies, j-1, j);
        }
      }
    }
    return movies;
  }

  public void swap(List<Movie> movies, int a, int b) {
    Movie temp = movies.get(a);
    movies.set(a, movies.get(b));
    movies.set(b, temp);
  }
}
