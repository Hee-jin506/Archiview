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
    
  body {
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
  
  #delete {
  position: absolute;
  border-radius: 3px;
  border: 1px solid #6B6B6B;
  background: #000000;
  padding: 5px;
  text-align: center;
  color: white;
  }
  
  #delete:hover {
  background: #626473;
  color: red;
  }
  
  #search-box {
  position: absolute;
  border-radius: 3px;
  border: 1px solid #6B6B6B;
  background: #000000;
  left: 38%;
  top: 0%;
  }
  
  #search-txt {
  border: none;
  color: white;
  background-color: #000000;
  font-size: x-small;
  
  }
  
  #search-btn {
  border: 0px;
  background-color: #000000;
  }
  
  #search-txt::-webkit-input-placeholder {
  text-align: center;
  }
  
  #movieAll {
  position: absolute;
  left: 85%;
  top: 0%;
  font-size: xx-small;
  }
  
  #refresh {
  display: inline-block;
  color: white;
  font-size: xx-small;
  margin-top: 15px;
  text-decoration: none; 
  font-size: small;
  }
  
  
</style>
</head>
<body>

<img src='../../../setting_resource/movie.png' width='18'> 영화 관리<br>

<div id='search-box'>
  <%String keyword = request.getParameter("keyword");%>
   <form action='list' method='get'>
    <input id='search-txt' type='text' placeholder='    검색' name='keyword' value='<%=keyword != null ? keyword : ""%>'>
    <button id='search-btn'><img src='../../../setting_resource/search.png' width='15'></button> 
   </form>
</div>
  
<%
List<Movie> list = (List<Movie>) request.getAttribute("list");
%>
<div id='movieAll'>
총 영화 수 : <%=list.size()%>
</div>

<a href='list' id='refresh' style=""><img src='../../../setting_resource/refresh.png' width='15'>  새로고침</a><br>
   
  <table id="movielist">
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
      <td><input type='checkbox' id='ck' name='movie' value='<%=movie.getNo()%>'>
          <label for='ck'></label></td>
      <td><a href='detail?no=<%=movie.getNo()%>'><%=movie.getNo()%></a></td> 
      <td><a href='detail?no=<%=movie.getNo()%>'><%=movie.getTitle()%></a></td>
      <td><%=movie.getReviews().size()%></td>
      <td><%=movie.getRegisteredDate()%></td>
      <td><%=stat%></td>
    </tr>
  <%}%>
  </tbody></table>
  <br>
  <button id='delete'><img src='../../../setting_resource/minus.png' width="13"> 삭제</button>
</body>
</html>