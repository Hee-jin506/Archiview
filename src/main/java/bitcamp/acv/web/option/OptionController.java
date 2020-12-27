package bitcamp.acv.web.option;

import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import bitcamp.acv.domain.Member;
import bitcamp.acv.service.MemberService;
import net.coobird.thumbnailator.ThumbnailParameter;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.geometry.Positions;
import net.coobird.thumbnailator.name.Rename;

@Controller
@RequestMapping("/option")
public class OptionController {

  @Autowired MemberService memberService;
  @Autowired ServletContext servletContext;

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


  @RequestMapping("profile")
  protected ModelAndView profile(HttpServletRequest request) throws Exception {

    ModelAndView mv = new ModelAndView();
    HttpSession session = request.getSession();

    Member member = (Member) session.getAttribute("loginUser");
    if (member == null) {
      throw new Exception("로그인 되어있지 않습니다.");
    } else {
      mv.addObject("member", member);
      mv.setViewName("option/profile");
      return mv;
    }
  }

  @RequestMapping("profileUpdate")
  protected String update(HttpServletRequest request, HttpServletRequest response, Member member) throws Exception {
    member.setNo(Integer.parseInt(request.getParameter("no")));

    Part photoPart = request.getPart("photo");
    if (photoPart.getSize() > 0) {
      String filename = UUID.randomUUID().toString();
      String saveFilePath = servletContext.getRealPath("/upload/" + filename);
      photoPart.write(saveFilePath);
      member.setPhoto(filename);

      // 회원 사진의 썸네일 이미지 파일 생성하기
      generatePhotoThumbnail(saveFilePath);
    }
    memberService.update(member);
    return "redirect:profile";
  }

  @RequestMapping("passwordHint")
  protected ModelAndView passwordHint(HttpServletRequest request) throws Exception {

    HttpSession session = request.getSession();
    ModelAndView mv = new ModelAndView();

    Member member = (Member) session.getAttribute("loginUser");

    if (member == null) {
      throw new Exception("로그인 되어있지 않습니다.");
    } else {
      mv.addObject("member", member);
      mv.setViewName("option/passwordHint");
      return mv;
    }
  }

  @RequestMapping("passwordUpdate")
  protected ModelAndView passwordUpdate(HttpServletRequest request) throws Exception {

    HttpSession session = request.getSession();
    ModelAndView mv = new ModelAndView();

    Member member = (Member) session.getAttribute("loginUser");

    if (member == null) {
      throw new Exception("로그인 되어있지 않습니다.");
    } else {
      mv.addObject("member", member);
      mv.setViewName("option/passwordUpdate");
      return mv;
    }
  }

  @RequestMapping("passwordCheck")
  protected String passwordCheck(HttpServletRequest request) throws Exception {

    HttpSession session = request.getSession();

    Member old = (Member) session.getAttribute("loginUser");
    String email = old.getEmail();
    String oldPassword = request.getParameter("oldpassword");

    Member m = memberService.get(email, oldPassword);

    if (m != null && request.getParameter("newpassword1").equals(request.getParameter("newpassword2"))) {
      m.setPassword(request.getParameter("newpassword1"));
      memberService.updatePassword(m);
      session.setAttribute("loginUser", m);
    } else {
    }
    return "redirect:/app/option/passwordUpdate";
  }

  @RequestMapping("updateHint")
  protected String updateHint(HttpServletRequest request) throws Exception {
    HttpSession session = request.getSession();

    Member member = (Member) session.getAttribute("loginUser");
    int qno = Integer.parseInt(request.getParameter("hint"));
    System.out.println("qno"+qno);
    String answer = request.getParameter("hintAnswer");
    System.out.println("qa"+answer);

    if (answer.equals("")) {
      throw new Exception("답을 입력하지 않았습니다.");
    } else {
      member.setQuestionsNo(qno);
      member.setQuestionsAnswer(answer);
      memberService.updateHint(member);
    }
    return "redirect:passwordHint";

  }
  @RequestMapping("withdraw")
  protected ModelAndView withdraw(HttpServletRequest request) throws Exception {

    HttpSession session = request.getSession();
    ModelAndView mv = new ModelAndView();

    Member member = (Member) session.getAttribute("loginUser");

    if (member == null) {
      throw new Exception("로그인 되어있지 않습니다.");
    } else {
      mv.addObject("member", member);
      mv.setViewName("option/withdraw");
      return mv;
    }
  }

  /* 멤버 add 가져옴
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
   */
}
