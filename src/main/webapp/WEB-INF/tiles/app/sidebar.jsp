<%@page import="bitcamp.acv.domain.Tag"%>
<%@page import="bitcamp.acv.domain.Movie"%>
<%@page import="bitcamp.acv.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사이드바</title>
<style>

 #sidebar {
   float:right;
   xposition: absolute;
   xright:250px;
   xtop:70px;
   box-sizing: content-box;
   width: 300px;
 }

 .sidebar {
  padding: 10px;
  border-radius: 10px;
  background-color: #141517;
  box-sizing: border-box;
  color: white;
  width: 250px;
  height: 220px;
  margin-bottom: 10px;
  margin-left: 10px;
  margin-right: 10px;
 }
 
 .sidebar hr {
   border:0;
   height: 1px;
   background-color: #626473;
 }
 
 .sidebar .explanation {
   font-size: 14px;
   color: #626473;
   font-weight: normal;
 }
 
</style>
</head>
<body>
<div id='sidebar'>
<div id='topMembers' class='sidebar'>
<p>추천 리뷰어 목록</p>
<hr>

<c:forEach items="${applicationScope.topMembers}" var="tm">
<p>
  <a href='<%=getServletContext().getContextPath()%>/app/member/profile?no=${tm.no}'>
    <img class='profile' src='<%=getServletContext().getContextPath()%>/upload/${tm.photo}_35x35.jpg'>
    ${tm.nickName}
  </a>
</p>
<p class='explanation'>${tm.intro}</p>
</c:forEach>
</div>

<%-- <div id='topMovies' class='sidebar'>
<p>인기 영화 목록</p>
<hr>
<% Movie[] movies = (Movie[])request.getAttribute("topMovies");
int count = 1;
for (Movie movie : movies) {
%>
<p><%=count%> <%=movie.getTitle()%></p>
<p class='explanation'>게시물 <%=movie.getReviews().size()%>개</p>
<%
count++;
}
%>
</div>

<div id='topTags' class='sidebar'>
<p>인기 태그 목록</p>
<hr>
<% Tag[] tags = (Tag[])request.getAttribute("topTags");
for (Tag tag : tags) {
%>
<p># <%=tag.getTitle()%></p>
<p class='explanation'>게시물 <%=tag.getReviews().size()%>개 팔로워 <%=tag.getFollowers().size()%>명</p>
<%
}
%>
</div>
</div> --%>

</body>
</html>
