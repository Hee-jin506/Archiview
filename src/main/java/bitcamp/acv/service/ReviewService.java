package bitcamp.acv.service;

import java.util.List;
import bitcamp.acv.domain.Font;
import bitcamp.acv.domain.Review;

public interface ReviewService {
  List<Font> listFont() throws Exception;
  int add(Review review) throws Exception;
}
