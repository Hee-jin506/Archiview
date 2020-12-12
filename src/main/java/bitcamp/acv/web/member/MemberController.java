package bitcamp.acv.web.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
@RequestMapping("/member")
public class MemberController {

  @Autowired MemberService memberService;
  @Autowired ServletContext servletContext;

  @RequestMapping("active")
  public String active(int no) throws Exception {
    if (memberService.active(no) == 0) {
      throw new Exception("해당 회원이 존재하지 않습니다.");
    }
    return "redirect:list";
  }

  @RequestMapping("add")
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
    String saveFilePath = servletContext.getRealPath("/upload/" + filename);
    photoFile.write(saveFilePath);
    member.setPhoto(filename);

    generatePhotoThumbnail(saveFilePath);

    memberService.add(member);
    return "redirect:list";
  }

  @RequestMapping("delete")
  protected ModelAndView delete(String password, HttpServletRequest request)
      throws Exception {

    ModelAndView mv = new ModelAndView();
    HttpSession session = request.getSession();

    if (request.getMethod().equals("GET")) {
      Member member = (Member) session.getAttribute("loginUser");

      if (member != null) {
        return "/member/withdrawForm.jsp";
      }
    }

    Member member = (Member) session.getAttribute("loginUser");

    String email = member.getEmail();

    try {
      Member m = memberService.get(email, password);

      if (m == null) {
        return "
      } else {
        memberService.delete(m.getNo());
        out.println("회원탈퇴가 완료되었습니다.");
      }
    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error").forward(request, response);
      return;
    }
    out.println("</body>");
    out.println("</html>");
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
}
