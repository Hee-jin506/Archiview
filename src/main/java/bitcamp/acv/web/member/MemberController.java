package bitcamp.acv.web.member;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.Part;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
    String saveFilePath = ctx.getRealPath("/upload/" + filename);
    photoPart.write(saveFilePath);

    member.setPhoto(filename);

    Thumbnails.of(this.uploadDir + "/" + filename)//
    .size(150, 150)//
    .outputFormat("jpg")//
    .crop(Positions.CENTER)
    .toFiles(new Rename() {
      @Override
      public String apply(String name, ThumbnailParameter param) {
        return name + "_150x150";
      }
    });

    Thumbnails.of(this.uploadDir + "/" + filename)//
    .size(35, 35)//
    .outputFormat("jpg")//
    .crop(Positions.CENTER)
    .toFiles(new Rename() {
      @Override
      public String apply(String name, ThumbnailParameter param) {
        return name + "_35x35";
      }
    });


    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head>");
    //    out.println("<meta http-equiv='Refresh' content='1;url=list'>");
    out.println("<title>회원 등록</title></head>");
    out.println("<body>");
    try {
      out.println("<h1>회원 등록</h1>");

      memberService.add(member);

      out.println("<p>회원 등록이 완료되었습니다.</p>");

    } catch (Exception e) {
      out.println("<h2>작업 처리 중 오류 발생!</h2>");
      out.printf("<pre>%s</pre>\n", e.getMessage());

      StringWriter errOut = new StringWriter();
      e.printStackTrace(new PrintWriter(errOut));
      out.println("<h3>상세 오류 내용</h3>");
      out.printf("<pre>%s</pre>\n", errOut.toString());
    }

    out.println("</body>");
    out.println("</html>");
  }
}
