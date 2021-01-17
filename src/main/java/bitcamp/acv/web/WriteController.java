package bitcamp.acv.web;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
  public void movieSearch(HttpSession session, String movieKeyword, Model model) throws Exception {
    // 탑바
    Member loginUser = (Member) session.getAttribute("loginUser");
    model.addAttribute("loginUser", loginUser);

    List<Movie> movies = movieService.list(movieKeyword);
    model.addAttribute("movies", movies);
  }

  @RequestMapping("chooseStc")
  public void chooseStc(HttpSession session, int movieNo, Model model) throws Exception {
    // 탑바
    Member loginUser = (Member) session.getAttribute("loginUser");
    model.addAttribute("loginUser", loginUser);

    session.setAttribute("movieNo", movieNo);
    Movie movie = movieService.findByNo(movieNo);
    //image-picker때문에(page 숫자 적어야함)
    List<Integer> numOfStillcuts = new ArrayList<>();
    for (int i=1 ; i <= movie.getStillcuts().size(); i++) {
      numOfStillcuts.add(i);
    }
    model.addAttribute("stillcuts", movie.getStillcuts());
    model.addAttribute("numOfStillcuts", numOfStillcuts);
  }

  @RequestMapping("editCard")
  public void editCard(HttpSession session, Model model) throws Exception {
    // 탑바
    Member loginUser = (Member) session.getAttribute("loginUser");
    model.addAttribute("loginUser", loginUser);

    List<Font> fonts = reviewService.listFont();
    model.addAttribute("fonts", fonts);
  }

  @RequestMapping("add")
  public String add(HttpSession session,
      String movieNo,
      String stc,
      String text,
      String x, String y, String font, String size,
      String tag)
          throws Exception {
    
    System.out.println(x);
    System.out.println(y);

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

    return "redirect:../main";
  }
}

