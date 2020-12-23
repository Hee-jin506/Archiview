package bitcamp.acv.web.movie;

import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import bitcamp.acv.domain.Movie;
import bitcamp.acv.service.MovieService;

@Controller
@RequestMapping("/movie")
public class MovieController {

  @Autowired MovieService movieService;
  @Autowired ServletContext servletContext;

  @RequestMapping("list")
  protected ModelAndView list(String keyword, String no, String title) throws Exception{
    List<Movie> list = null;

    if (keyword != null) {
      HashMap<String,Object> keyMap = new HashMap<>();
      keyMap.put("keyword", keyword);
      keyMap.put("no", no);
      keyMap.put("title", title);


      list = movieService.list1(keyMap);

    } else {
      list = movieService.list(null);
    }

    ModelAndView mv = new ModelAndView();
    mv.addObject("list", list);
    mv.setViewName("movie/list");
    return mv;
  }

  @RequestMapping("detail")
  protected ModelAndView detail(int no) throws Exception {

    Movie movie = movieService.findByNo(no);

    if (movie == null) {
      throw new Exception("해당 번호의 영화가 없습니다.");
    }

    ModelAndView mv = new ModelAndView();
    mv.addObject("movie", movie);
    mv.setViewName("movie/detail");
    return mv;
  }

  @RequestMapping("active")
  public String active(int no) throws Exception {
    if (movieService.active(no) == 0) {
      throw new Exception("해당 번호의 영화가 없습니다.");
    }
    return "redirect:list";
  }

  @RequestMapping("delete")
  public String delete(int no) throws Exception {
    if (movieService.delete(no) == 0) {
      throw new Exception("해당 번호의 영화가 없습니다.");
    }
    return "redirect:list";
  }

  @RequestMapping("multipleDelete")
  protected String multipleDelete(String[] movies, HttpServletResponse response)
      throws Exception {
    int count = 0;
    if (movies != null) {
      for (String movieNo : movies) {
        count += movieService.delete(Integer.parseInt(movieNo));
      }
    }
    if (count == 0) {
      throw new Exception("해당 번호의 영화가 없습니다.");
    } else {
      return "redirect:list";
    }
  }

  @RequestMapping("multipleActive")
  protected String multipleActive(String[] movies, HttpServletResponse response)
      throws Exception {
    int count = 0;
    if (movies != null) {
      for (String movieNo : movies) {
        count += movieService.active(Integer.parseInt(movieNo));
      }
    }

    if (count == 0) {
      throw new Exception("해당 번호의 영화가 없습니다.");
    } else {
      return "redirect:list";
    }
  }
}
