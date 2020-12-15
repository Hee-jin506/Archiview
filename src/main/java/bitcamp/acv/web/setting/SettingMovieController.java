package bitcamp.acv.web.setting;

import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import bitcamp.acv.domain.Movie;
import bitcamp.acv.service.MovieService;

@Controller
@RequestMapping("/setting/movie")
public class SettingMovieController {

  @Autowired MovieService movieService;
  @Autowired ServletContext servletContext;

  @RequestMapping("list")
  protected ModelAndView list(String keyword) throws Exception{
    List<Movie> list = movieService.list(keyword);
    ModelAndView mv = new ModelAndView();
    mv.addObject("list", list);
    mv.setViewName("/setting/movie/list.jsp");
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
    mv.setViewName("/setting/movie/detail.jsp");
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



}
