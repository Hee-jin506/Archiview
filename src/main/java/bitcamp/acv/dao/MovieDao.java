package bitcamp.acv.dao;

import java.util.List;
import bitcamp.acv.domain.Movie;

public interface MovieDao {
  List<Movie> findAll() throws Exception;
}
