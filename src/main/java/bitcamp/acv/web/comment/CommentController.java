package bitcamp.acv.web.comment;

import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import bitcamp.acv.domain.Comment;
import bitcamp.acv.service.CommentService;
import bitcamp.acv.service.MemberService;
import bitcamp.acv.service.ReviewService;

@Controller
@RequestMapping("/comment")
public class CommentController {

  @Autowired CommentService commentService;
  @Autowired ReviewService reviewService;
  @Autowired MemberService memberService;
  @Autowired ServletContext servletContext;

  @RequestMapping("list")
  protected ModelAndView list(String keyword) throws Exception {
    List<Comment> list = commentService.list(keyword);
    ModelAndView mv = new ModelAndView();
    mv.addObject("list", list);
    mv.setViewName("/comment/list.jsp");
    return mv;
  }
}
//
//  comment.getReview().getText(),
//  comment.getMemberNo(),
//  comment.getMember().getNickName(),
//  comment.getContent(),
//  comment.getOrder(),
//  comment.getLevel(),
//  comment.getRegisteredDate(),
//  comment.getMember().getPhoto(),
//  comment.getReview().getStillCut()
//
//  ServletContext ctx = request.getServletContext();
//  CommentService commentService = (CommentService) ctx.getAttribute("commentService");
//  response.setContentType("text/html;charset=UTF-8");
//  PrintWriter out = response.getWriter();
//
//  out.println("<!DOCTYPE html>");
//  out.println("<html>");
//  out.println("<head><title>코멘트 목록</title></head>");
//  out.println("<body>");
//
//  try {
//
//    out.println("<h1>[코멘트 목록]</h1>");
//
//    String keyword = request.getParameter("keyword");
//
//    out.println("<form action='list' method='get'>");
//    out.printf("검색어: <input type='search' name='keyword' value='%s'>\n",
//        keyword != null ? keyword : "코멘트 번호, 리뷰 작성자로 검색");
//    out.println("<button>검색</button>");
//    out.println("</form>");
//    out.println("</p>");
//
//
//    List<Comment> list = commentService.list(keyword);
//
//    //      private int no; // 댓글 번호
//    //      private int reviewNo; // 영화 후기 번호 motherNo
//    //      private int order; // 댓글 순서
//    //      private int level; // 댓글 단계
//    //      private int memberNo; // 댓글단 회원
//    //      private String content; // 내용
//    //      private Date registeredDate; // 등록일
//    //      private int status; // 상태
//    //      private Date modifiedDate; // 수정일
//
//    out.println("<table border='1'>");
//    out.println("<thead><tr>"
//        + "<th>코멘트 번호</th>"
//        + "<th>리뷰 번호</th>"
//        + "<th>리뷰 내용</th>"
//        + "<th>작성자 번호</th>"
//        + "<th>작성자 닉네임</th>"
//        + "<th>내용</th>"
//        + "<th>오더</th>"
//        + "<th>레벨</th>"
//        + "<th>등록일</th>"
//        + "<th>사진</th>"
//        + "<th>스틸컷 번호</th>"
//        + "</tr></thead>");
//
//    for (Comment comment : list) {
//      out.printf("<tr>"
//          + "<td>%d</td>"
//          + "<td>%d</td>"
//          + "<td>%s</td>"
//          + "<td>%d</td>"
//          + "<td>%s</td>"
//          + "<td>%s</td>"
//          + "<td>%d</td>"
//          + "<td>%d</td>"
//          + "<td>%s</td>"
//          + "<td>%s</td>"
//          + "<td>%s</td>"
//          + "</tr>\n",
//          comment.getNo(),
//          comment.getReviewNo(),
//          comment.getReview().getText(),
//          comment.getMemberNo(),
//          comment.getMember().getNickName(),
//          comment.getContent(),
//          comment.getOrder(),
//          comment.getLevel(),
//          comment.getRegisteredDate(),
//          comment.getMember().getPhoto(),
//          comment.getReview().getStillCut()
//          );
//
//    }
//    out.println("</tbody>");
//    out.println("</table>");
//  } catch (Exception e) {
//    out.printf("작업 처리 중 오류 발생! - %s\n", e.getMessage());
//    StringWriter errOut = new StringWriter();
//    e.printStackTrace(new PrintWriter(errOut));
//    out.printf("<pre>%s</pre>\n", errOut.toString());
//  }
//  out.println("</body>");
//  out.println("</html>");
//}
//}