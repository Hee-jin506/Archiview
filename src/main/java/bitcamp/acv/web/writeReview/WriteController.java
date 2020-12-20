package bitcamp.acv.web.writeReview;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import bitcamp.acv.domain.Font;
import bitcamp.acv.domain.Member;
import bitcamp.acv.domain.Movie;
import bitcamp.acv.domain.Review;
import bitcamp.acv.domain.Tag;
import bitcamp.acv.service.MovieService;
import bitcamp.acv.service.ReviewService;

@Controller
@RequestMapping("/write")
public class WriteController {

  @Autowired MovieService movieService;
  @Autowired ReviewService reviewService;

  @RequestMapping("movieSearch")
  public ModelAndView movieSearch(String keyword) throws Exception {
    ModelAndView mv = new ModelAndView();
    List<Movie> movies = movieService.list(keyword);
    mv.addObject("movies", movies);
    mv.setViewName("/write/movieSearch.jsp");
    return mv;
  }

  @RequestMapping("chooseStc")
  public ModelAndView chooseStc(int movieNo) throws Exception {
    Movie movie = movieService.findByNo(movieNo);
    ModelAndView mv = new ModelAndView();
    mv.addObject("stillcuts", movie.getStillcuts());
    mv.setViewName("/write/stillcutChoose.jsp");
    return mv;
  }

  @RequestMapping("editCard")
  public ModelAndView editCard() throws Exception {
    List<Font> fonts = reviewService.listFont();
    ModelAndView mv = new ModelAndView();
    mv.addObject("fonts", fonts);
    mv.setViewName("/write/reviewEdit.jsp");
    return mv;
  }

  @RequestMapping("add")
  public String add(HttpSession session,
      String movieNo,
      String stc,
      String text,
      String x,
      String y,
      String font,
      String size,
      String tag)
          throws Exception {

    Member loginUser = (Member) session.getAttribute("loginUser");
    Review review = new Review();
    int stcNo = movieService.getStcNo(Integer.parseInt(movieNo), stc);

    if (loginUser == null) {
    } else {
      review.setWriterNo(loginUser.getNo());
      review.setStillCut(stcNo);
      review.setText(text);
      review.setTextX(Integer.parseInt(x));
      review.setTextY(Integer.parseInt(y));
      review.setTextFont(Integer.parseInt(font));
      review.setTextSize(Integer.parseInt(size));
      String str = tag;
      String[] tagTitles = str.split("#");
      List<Tag> tags = new ArrayList<>();
      if (tagTitles.length > 0) {
        int n = 0;
        for (String tagTitle : tagTitles) {
          tagTitle = tagTitle.trim();
          if (!tagTitle.equals("")) {
            Tag tagObj = new Tag();
            tagObj.setTitle(tagTitle);
            System.out.println(n + " : " + tagTitle);
            tags.add(tagObj);
            n++;
          }
        }
      }
      review.setTags(tags);
    }
    reviewService.add(review);

    return "redirect:/app/main/";
  }
}

