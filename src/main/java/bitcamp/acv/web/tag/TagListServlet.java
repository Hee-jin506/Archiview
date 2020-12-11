package bitcamp.acv.web.tag;

import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
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
    response.setContentType("text/html;charset=UTF-8");

    try {

      // 기본 검색 파라미터
      String keyword = request.getParameter("keyword");
      String no = request.getParameter("no");
      String name = request.getParameter("name");

      // 상세 검색 체크박스 파라미터
      String keywordNumber = request.getParameter("keywordNumber");
      String keywordTitle = request.getParameter("keywordTitle");
      String registeredDate= request.getParameter("registeredDate");
      String startDate= request.getParameter("startDate");
      String endDate= request.getParameter("endDate");
      String startNumber= request.getParameter("startNumber");
      String endNumber= request.getParameter("endNumber");
      String active = request.getParameter("active");
      String inactive = request.getParameter("inactive");


      // 검색 조건에 맞춰 가져올 리스트
      List<Tag> list = null;

      if (keyword != null) {
        HashMap<String,Object> keyMap = new HashMap<>();
        keyMap.put("keyword", keyword);
        keyMap.put("no", no);
        keyMap.put("name", name);


        list = tagService.list1(keyMap);

      } else if (keywordNumber != null) {
        HashMap<String,Object> keywordMap = new HashMap<>();
        keywordMap.put("number", keywordNumber);
        keywordMap.put("title", keywordTitle);
        keywordMap.put("startNumber", startNumber);
        keywordMap.put("endNumber", endNumber);
        keywordMap.put("active", active);
        keywordMap.put("inactive", inactive);

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



      // 총 태그 수
      List<Tag> chartList = tagService.list();

      // jsp에 넘겨줄 값들
      Map<String,Object> chartSizeMap = new HashMap<>();
      chartSizeMap.put("all",chartList.size());

      // 삭제된 태그 수
      HashMap<String,Object> keyMap = new HashMap<>();
      keyMap.put("status", 0);
      chartList = tagService.list(keyMap);
      chartSizeMap.put("inactive",chartList.size());

      // 게시중인 태그 수
      keyMap.put("status", 1);
      chartList = tagService.list(keyMap);
      chartSizeMap.put("active",chartList.size());

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
      chartSizeMap.put("yesterday",chartList.size());

      // 오늘 등록한 태그 수
      keyMap.remove("registeredDate");
      keyMap.put("registeredDate", today);
      chartList = tagService.list(keyMap);
      chartSizeMap.put("today",chartList.size());

      // 이번 주에 등록된 태그 수
      keyMap.remove("registeredDate");
      keyMap.put("startDate", firstWeekDay);
      keyMap.put("endDate", today);
      chartList = tagService.list(keyMap);
      chartSizeMap.put("thisWeek",chartList.size());

      // 이번 달에 등록된 태그 수
      keyMap.put("startDate", firstMonthDay);
      keyMap.put("endDate", today);
      chartList = tagService.list(keyMap);
      chartSizeMap.put("thisMonth",chartList.size());


      request.setAttribute("chartSizeMap", chartSizeMap);



      request.setAttribute("list", list);
      request.getRequestDispatcher("/tag/list.jsp").include(request, response);


    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error.jsp").forward(request, response);
    }
  }
}


