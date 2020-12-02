package bitcamp.acv.web.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import bitcamp.acv.domain.Member;
import bitcamp.acv.service.MemberService;
import net.coobird.thumbnailator.ThumbnailParameter;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.geometry.Positions;
import net.coobird.thumbnailator.name.Rename;

@MultipartConfig(maxFileSize = 1024 * 1024 * 10)
@WebServlet("/member/add")
public class MemberAddServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;
  private String uploadDir;

  @Override
  public void init() throws ServletException {
    this.uploadDir = this.getServletContext().getRealPath("/upload");
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    MemberService memberService =  (MemberService) ctx.getAttribute("memberService");
    response.setContentType("text/html;charset=UTF-8");

    Member member = new Member();
    member.setAuthority(1);
    member.setStatus(1);
    member.setLoginNo(Integer.parseInt((request.getParameter("loginNo"))));
    member.setName(request.getParameter("name"));
    member.setEmail(request.getParameter("email"));
    member.setPassword(request.getParameter("password"));
    member.setNickName(request.getParameter("nickName"));
    member.setPhoto(request.getParameter("photo"));
    member.setIntro(request.getParameter("intro"));
    member.setQuestionsNo(Integer.parseInt(request.getParameter("questionsNo")));
    member.setQuestionsAnswer(request.getParameter("questionsAnswer"));

    Part photoPart = request.getPart("photo");

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



