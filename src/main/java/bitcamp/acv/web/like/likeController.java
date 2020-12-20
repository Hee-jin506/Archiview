package bitcamp.acv.web.like;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import bitcamp.acv.domain.Like;
import bitcamp.acv.service.LikeService;

@Controller
@RequestMapping("/like")
public class likeController {

  @Autowired LikeService likeService;

  // 사용자 화면
  @RequestMapping("list")
  protected ModelAndView view(
      HttpServletRequest request) throws Exception {
    List<Like> list = likeService.list();
    ModelAndView mv = new ModelAndView();

    mv.addObject("list", list);
    mv.setViewName("/like/list.jsp");
    return mv;
  }

}
