package bitcamp.acv.web.member;

import java.util.List;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import bitcamp.acv.domain.Follow;
import bitcamp.acv.domain.Member;
import bitcamp.acv.domain.Review;
import bitcamp.acv.service.FollowService;
import bitcamp.acv.service.MemberService;
import net.coobird.thumbnailator.ThumbnailParameter;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.geometry.Positions;
import net.coobird.thumbnailator.name.Rename;

@Controller
@RequestMapping("/member")
public class MemberController {

  @Autowired MemberService memberService;
  @Autowired ServletContext servletContext;
  @Autowired FollowService followService;

  @RequestMapping("active")
  public String active(int no) throws Exception {
    if (memberService.active(no) == 0) {
      throw new Exception("해당 회원이 존재하지 않습니다.");
    }
    return "redirect:list";
  }

  @RequestMapping(value="add")
  public String add(
      int loginNo,
      String name,
      String email,
      String password,
      String nickName,
      Part photoFile,
      String intro,
      int questionsNo,
      String questionsAnswer) throws Exception {

    Member member = new Member();
    member.setAuthority(1);
    member.setStatus(1);
    member.setLoginNo(loginNo);
    member.setName(name);
    member.setEmail(email);
    member.setPassword(password);
    member.setNickName(nickName);
    member.setIntro(intro);
    member.setQuestionsNo(questionsNo);
    member.setQuestionsAnswer(questionsAnswer);


    String filename = UUID.randomUUID().toString();
    System.out.println(filename);
    String saveFilePath = servletContext.getRealPath("/upload/" + filename);
    System.out.println(saveFilePath);
    System.out.println(photoFile);
    photoFile.write(saveFilePath);
    member.setPhoto(filename);

    generatePhotoThumbnail(saveFilePath);

    memberService.add(member);
    return "redirect:../auth/login";
  }

  private void generatePhotoThumbnail(String saveFilePath) {
    try {
      Thumbnails.of(saveFilePath)
      .size(35, 35)
      .outputFormat("jpg")
      .crop(Positions.CENTER)
      .toFiles(new Rename() {
        @Override
        public String apply(String name, ThumbnailParameter param) {
          return name + "_35x35";
        }
      });

      Thumbnails.of(saveFilePath)
      .size(150, 150)
      .outputFormat("jpg")
      .crop(Positions.CENTER)
      .toFiles(new Rename() {
        @Override
        public String apply(String name, ThumbnailParameter param) {
          return name + "_150x150";
        }
      });
    } catch (Exception e) {
      e.printStackTrace();
    }
  }


  @RequestMapping("delete")
  public ModelAndView delete(String password, HttpServletRequest request)
      throws Exception {

    ModelAndView mv = new ModelAndView();
    HttpSession session = request.getSession();
    boolean wrongInput = false;

    if (request.getMethod().equals("GET")) {
      Member member = (Member) session.getAttribute("loginUser");

      if (member == null) {
        throw new Exception("로그인 되어있지 않습니다.");
      } else {
        mv.addObject("wrongInput", wrongInput);
        mv.setViewName("/member/withdrawForm.jsp");
        return mv;
      }
    }

    String inputPassword = request.getParameter("password");
    Member member = (Member) session.getAttribute("loginUser");

    String email = member.getEmail();

    Member m = memberService.get(email, inputPassword);

    if (m == null) {
      wrongInput = true;
      mv.addObject("wrongInput", wrongInput);
      mv.setViewName("/member/withdrawForm.jsp");
    } else {
      memberService.delete(m.getNo());
      mv.setViewName("redirect:/auth/login.jsp");
    }
    return mv;
  }

  @RequestMapping("detail")
  public ModelAndView detail(int no) throws Exception {

    Member member = memberService.get(no);

    if (member == null) {
      throw new Exception("해당 회원이 없습니다.");
    }

    ModelAndView mv = new ModelAndView();
    mv.addObject("member", member);
    mv.setViewName("/member/detail.jsp");
    return mv;
  }

  // 프로필 화면(프로필 + 본인이 작성한 리뷰들이 나옴)
  @RequestMapping("profile")
  public ModelAndView profile(int no) throws Exception {

    Member member = memberService.get(no);
    if (member == null) {
      throw new Exception("해당 회원이 없습니다.");
    }

    ModelAndView mv = new ModelAndView();
    List<Review> rvs = member.getReviews();
    for(Review rv : rvs) {
      System.out.println(rv.getNo());
    }
    mv.addObject("member", member);
    mv.setViewName("/member/profile.jsp");
    return mv;
  }

  // 프로필 화면(프로필 + 본인이 저장한 리뷰들이 나옴)
  @RequestMapping("profileSavedReviews")
  public ModelAndView profileSavedReviews(int no) throws Exception {

    Member member = memberService.get(no);
    if (member == null) {
      throw new Exception("해당 회원이 없습니다.");
    }

    ModelAndView mv = new ModelAndView();
    List<Review> rvs = member.getSaved();
    for(Review rv : rvs) {
      System.out.println(rv.getNo());
    }
    mv.addObject("member", member);
    mv.setViewName("/member/profileSavedReviews.jsp");
    return mv;
  }

  @RequestMapping("inactive")
  public String inactive(int no) throws Exception {
    if (memberService.inactive(no) == 0) {
      throw new Exception("해당 번호의 회원이 없습니다.");
    } else {
      return "redirect:list";
    }
  }

  @RequestMapping("list")
  public ModelAndView list(String keyword) throws Exception {
    System.out.println("memberList 실행!");
    List<Member> list = memberService.list(keyword);
    List<Follow> follows = followService.list();
    ModelAndView mv = new ModelAndView();

    Follow[] myFollow = new Follow[follows.size()];
    for (int i = 0; i < myFollow.length; i++) {
      myFollow[i] = follows.get(i);
    }

    mv.addObject("follows", follows);
    mv.addObject("list", list);
    mv.setViewName("/member/list.jsp");
    return mv;
  }

  @RequestMapping("multipleDelete")
  public String multipleDelete(String[] members, HttpServletResponse response)
      throws Exception {
    int count = 0;
    if (members != null) {
      for (String memberNo : members) {
        count += memberService.inactive(Integer.parseInt(memberNo));
      }
    }

    if (count == 0) {
      throw new Exception("<p>해당 회원이 존재하지 않습니다.</p>\n");
    } else {
      return "redirect:list";
    }
  }

  @RequestMapping("multipleActive")
  protected String multipleActive(String[] members, HttpServletResponse response)
      throws Exception {
    int count = 0;
    if (members != null) {
      for (String memberNo : members) {
        count += memberService.active(Integer.parseInt(memberNo));
      }
    }

    if (count == 0) {
      throw new Exception("해당 번호의 회원이 없습니다.");
    } else {
      return "redirect:list";
    }
  }

  @RequestMapping("search")
  public ModelAndView search(String keyword) throws Exception {
    System.out.println("memberController 키워드: " + keyword);
    List<Member> memberList = memberService.listByKeywordNickName(keyword);
    ModelAndView mv = new ModelAndView();
    mv.addObject("memberList", memberList);
    mv.setViewName("/member/memberSearch.jsp");
    return mv;
  }

  @RequestMapping("update")
  public String update(Member member) throws Exception {
    memberService.update(member);
    return "redirect:list";
  }
}
