package bitcamp.acv.service;

import java.util.List;
import bitcamp.acv.domain.Movie;

public interface MovieService {
  List<Movie> list() throws Exception;
}
