<%@page import="bitcamp.acv.domain.Movie"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화관리</title>
<style>

  html {
    background-color: #000000;
    color: #ffffff;
    }
    
  #movielist {
  position: absolute;
  /* top: 100%; */
  left: 10%;
  width: 80%;
  }
    
  #bar1 {
    background-color: #141517;
    font-size: x-small;
    font-style: normal;
    color: #ffffff;
    text-align: left;
  }
  
  #check {
  width: 1%;
  }
  
  #movieno {
  width: 5%;
  }
  
  #moviename {
  width: 19%;
  }
  
  #reviews {
  width: 5%;
  }
  
  #rdt {
  width: 8%;
  }
  
  #stat {
  width: 5%;
  }
  
  #movies * {
  color: white;
  font-size:xx-small;
  text-decoration: none;
  }
  
   
    
</style>
</head>
<body>

<h1>[영화 관리]</h1>
  <%String keyword = request.getParameter("keyword");%>
   <form action='list' method='get'>
    <input type='text' name='keyword' value='<%=keyword != null ? keyword : ""%>'>
    <button>검색</button> 
   </form>
  
<%
List<Movie> list = (List<Movie>) request.getAttribute("list");
%>
<span>총 영화 수 : <%list.size();%></span>
  <table id="movielist" border='0'>
  <thead id="bar1"><tr>
  <th id="check"> </th>
  <th id="movieno">영화번호</th>
  <th id="moviename">영화제목</th>
  <th id="reviews">게시글 수</th>
  <th id="rdt">등록일</th>
  <th id="stat">상태</th>
  </tr></thead>
  
  <tbody>
  <%
  for (Movie movie : list) {
    String stat;
    if (movie.getStatus() != 0) {
      stat = "게시중";
    } else {
      stat = "삭제";
    }%>
    <tr id="movies">
      <td><input type='checkbox' name='movie' value='<%=movie.getNo()%>'></td>
      <td><a  href='detail?no=<%=movie.getNo()%>'><%=movie.getNo()%></a></td> 
      <td><a href='detail?no=<%=movie.getNo()%>'><%=movie.getTitle()%></a></td>
      <td><%=movie.getReviews().size()%></td>
      <td><%=movie.getRegisteredDate()%></td>
      <td><%=stat%></td>
    </tr>
  <%}%>
  </tbody></table>
</body>
</html>