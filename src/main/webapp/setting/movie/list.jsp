<%@page import="bitcamp.acv.domain.Movie"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화관리</title>
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
  <table border='1'>
  <thead><tr>
    <th> </th>
    <th>영화번호</th>
    <th>영화제목</th>
    <th>게시글 수</th>
    <th>등록일</th>
    <th>상태</th>
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
    <tr>
      <td><input type='checkbox' name='movie' value='<%=movie.getNo()%>'></td>
      <td><a href='detail?no=<%=movie.getNo()%>'><%=movie.getNo()%></a></td> 
      <td><a href='detail?no=<%=movie.getNo()%>'><%=movie.getTitle()%></a></td>
      <td><%=movie.getReviews().size()%></td>
      <td><%=movie.getRegisteredDate()%></td>
      <td><%=stat%></td>
    </tr>
  <%}%>
  </tbody></table>
</body>
</html>