package bitcamp.acv.web.tag;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bitcamp.acv.domain.Tag;
import bitcamp.acv.service.TagService;

@WebServlet("/tag/list")
public class TagListServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;

  @Override
  protected void service(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    TagService tagService =  (TagService) ctx.getAttribute("tagService");

    PrintWriter out = response.getWriter();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head><title>태그 관리 화면</title>"
        + "<style>"
        + "body {" 
        + "background-color: #000000;"
        + "color: #ffffff;" 
        + "}"
        + "</style>"
        + "</head>");
    out.println("<body>");

    try {
      // 홈 아이콘
      out.println("<a href='../admin-main.html'>"
          + "<img src='../home-border-icon.svg' alt='home-border-icon'>"
          + "</a>");
      // 태그 아이콘
      out.println("<a href='list'>"
          + "<img src='../tag-border-icon.svg' alt='tag-border-icon'>"
          + "</a>");

      out.println("<h1>[태그 목록]</h1>");


      // 기본 검색 파라미터
      String keyword = request.getParameter("keyword");
      String no = request.getParameter("no");
      String name = request.getParameter("name");
      String state = request.getParameter("state");

      // 상세 검색 체크박스 파라미터
      String keywordNumber = request.getParameter("keywordNumber");
      String keywordTitle = request.getParameter("keywordTitle");
      String keywordStatus = request.getParameter("keywordStatus");
      String registeredDate= request.getParameter("registeredDate");
      String startDate= request.getParameter("startDate");
      String endDate= request.getParameter("endDate");
      String startNumber= request.getParameter("startNumber");
      String endNumber= request.getParameter("endNumber");


      // 검색 조건에 맞춰 가져올 리스트
      List<Tag> list = null;

      if (keyword != null) {
        HashMap<String,Object> keyMap = new HashMap<>();
        keyMap.put("keyword", keyword);
        keyMap.put("no", no);
        keyMap.put("name", name);
        keyMap.put("state", state);

        list = tagService.list(keyMap);

      } else if (keywordNumber != null) {
        HashMap<String,Object> keywordMap = new HashMap<>();
        keywordMap.put("number", keywordNumber);
        keywordMap.put("title", keywordTitle);
        keywordMap.put("status", keywordStatus);
        keywordMap.put("startNumber", startNumber);
        keywordMap.put("endNumber", endNumber);

        if(registeredDate != "") {
          String[] s = registeredDate.split("\n");
          java.sql.Date d = java.sql.Date.valueOf(s[0]);

          keywordMap.put("registeredDate", d);
        }
        if(startDate != "") {
          String[] s = startDate.split("\n");
          java.sql.Date d = java.sql.Date.valueOf(s[0]);

          keywordMap.put("startDate", d);
        }
        if(endDate != "") {
          String[] s = endDate.split("\n");
          java.sql.Date d = java.sql.Date.valueOf(s[0]);

          keywordMap.put("endDate", d);
        }

        list = tagService.list(keywordMap);

      } else {
        list = tagService.list();
      }

      // 기본 검색 폼
      out.println("<p>");
      out.println("<form action='list' method='get'>");
      out.printf("<input type='search' name='keyword' value='%s'>\n",
          keyword != null ? keyword : "번호, 이름, 상태로 검색");
      out.println("<button>검색</button><br>");
      out.printf("<input type='checkbox' name='no' value='no' %s>번호\n",
          no != null ? "checked" : "");
      out.printf("<input type='checkbox' name='name' value='name' %s>태그명\n",
          name != null ? "checked" : "");
      out.printf("<input type='checkbox' name='state' value='state' %s>상태\n",
          state != null ? "checked" : "");
      out.println("</form>");
      out.println("</p>");

      // 상세검색 폼
      out.println("<hr>");
      out.println("<h2>상세 검색</h2>");
      out.println("<p>");
      out.println("<form action='list' method='post'>");
      out.printf("태그번호: <input type='text' name='keywordNumber' value='%s'><br>\n",
          keywordNumber != null ? keywordNumber : "");
      out.printf("태그명: <input type='text' name='keywordTitle' value='%s'><br>\n",
          keywordTitle != null ? keywordTitle : "");
      out.printf("상태: <input type='text' name='keywordStatus' value='%s'><br>\n",
          keywordStatus != null ? keywordStatus : "");
      out.printf("등록일: <input type='date' name='registeredDate' value='%s'><br>\n",
          registeredDate != null ? registeredDate : "");
      out.printf("날짜 범위: <input type='date' name='startDate' value='%s'>~\n",
          startDate != null ? startDate : "");
      out.printf("<input type='date' name='endDate' value='%s'><br>\n",
          endDate != null ? endDate : "");
      out.printf("번호 범위: <input type='text' name='startNumber' value='%s'>~\n",
          startNumber != null ? startNumber : "");
      out.printf("<input type='text' name='endNumber' value='%s'><br>\n",
          endNumber != null ? endNumber : "");

      out.println("<button>검색</button>");
      out.println("<input type='reset'>");
      out.println("</form>");
      out.println("</p>");

      // 총 태그 수
      List<Tag> chartList = tagService.list();
      out.printf("<span>총 태그 수 : %d</span><br>", chartList.size());

      // 삭제된 태그 수
      HashMap<String,Object> keyMap = new HashMap<>();
      keyMap.put("status", 0);
      chartList = tagService.list(keyMap);
      out.printf("<span>삭제된 태그 수 : %d</span><br>", chartList.size());

      // 게시중인 태그 수
      keyMap.put("status", 1);
      chartList = tagService.list(keyMap);
      out.printf("<span>게시 중인 태그 수 : %d</span><br>", chartList.size());

      // 오늘날짜 구하기
      Calendar cal = new GregorianCalendar(Locale.KOREA);
      Date today = new Date(cal.getTimeInMillis());
      //      System.out.println("오늘날짜 : " + today);

      // 어제날짜 구하기
      cal.setTime(today);
      cal.add(Calendar.DATE, -1);
      Date yesterday = new Date(cal.getTimeInMillis());
      //      System.out.println("어제날짜 : " + yesterday);

      // 이번주의 시작(일요일) 날짜 구하기
      cal.setTime(today);
      cal.add(Calendar.DATE, 1 - cal.get(Calendar.DAY_OF_WEEK));
      Date firstWeekDay = new Date(cal.getTimeInMillis());
      //      System.out.println("이번주의 첫날(일요일) : " + firstWeekDay);

      // 이번달의 시작(1일) 날짜 구하기
      cal.setTime(today);
      cal.add(Calendar.DATE, 1-cal.get(Calendar.DAY_OF_MONTH));
      Date firstMonthDay = new Date(cal.getTimeInMillis());
      //      System.out.println("이번달의 첫날(1일) : " + firstMonthDay);

      // 어제 등록한 태그 수
      keyMap.remove("status");
      keyMap.put("registeredDate", yesterday);
      chartList = tagService.list(keyMap);
      out.printf("<span>어제 등록된 태그 수 : %d</span><br>", chartList.size());

      // 오늘 등록한 태그 수
      keyMap.remove("registeredDate");
      keyMap.put("registeredDate", today);
      chartList = tagService.list(keyMap);
      out.printf("<span>오늘 등록된 태그 수 : %d</span><br>", chartList.size());

      // 이번 주에 등록된 태그 수
      keyMap.remove("registeredDate");
      keyMap.put("startDate", firstWeekDay);
      keyMap.put("endDate", today);
      chartList = tagService.list(keyMap);
      out.printf("<span>이번주에 등록된 태그 수 : %d</span><br>", chartList.size());

      // 이번 달에 등록된 태그 수
      keyMap.put("startDate", firstMonthDay);
      keyMap.put("endDate", today);
      chartList = tagService.list(keyMap);
      out.printf("<span>이번달에 등록된 태그 수 : %d</span><br>", chartList.size());


      // 조회 및 선택 삭제, 선택 복구?
      out.println("<form action='multipleDelete' method='get'>");
      out.println("<button>삭제</button>");
      out.println("<input type='reset'>");
      out.println("<table border=\"1\">");
      out.println("<tr>");
      out.println("<th>선택");
      out.println("<th>태그 번호</th>");
      out.println("<th>태그명</th>");
      out.println("<th>게시물 수</th>");
      out.println("<th>등록일</th>");
      out.println("<th>상태</th>");
      out.println("</tr>");

      for (Tag tag : list ) {

        out.println("<tr>");
        out.printf(""
            + "<td><input type='checkbox' name='tags' value='%d'</td>\n" // 선택
            + "<td>%1$d</td>" // no
            + "<td><a href='detail?no=%1$d'>%s</a></td>" // title
            + "<td>%d</td>" // 게시물 수
            + "<td>%s</td>" // rdt
            + "<td>%s</td>", // stat,
            tag.getNo(), 
            tag.getTitle(),
            tag.getReviews().size(),
            tag.getRegisteredDate(),
            tag.isStatus() ? "게시중" : "삭제"
            );
        out.println("</tr>");
      }
      out.println("</table>");

      out.println("</form>");

    } catch (Exception e) {
      out.printf("작업 처리 중 오류 발생! - %s\n", e.getMessage());
      StringWriter errOut = new StringWriter();
      e.printStackTrace(new PrintWriter(errOut));
      out.printf("<pre>%s</pre>\n", errOut.toString());
    }
    out.println("</body>");
    out.println("</html>");
  }
}


