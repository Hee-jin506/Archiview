<%@page import="bitcamp.acv.domain.Tag"%>
<%@page import="bitcamp.acv.domain.Movie"%>
<%@page import="bitcamp.acv.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사이드바</title>
<style>

 #sidebar {
   position: fixed;
   right:250px;
   top:70px;
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
  height: 200px;
  margin: 10px
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
<%
Member[] members = (Member[])request.getAttribute("topMembers");
for (Member member : members) {
%>
<p><img class='profile' src=<%=getServletContext().getContextPath()+"/upload/" + member.getPhoto() + "_35x35.jpg"%>><%=member.getNickName()%></p>
<p class='explanation'><%=member.getIntro() %></p>
<%
}
%>
</div>

<div id='topMovies' class='sidebar'>
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
</div>

</body>
</html>

<!-- select
    mb.mno,
    mb.nick,
  flw_length,
  lk_length
  from acv_mbr mb
    left outer join 
    (select target, fano, count(*) flw_length from acv_flw where fano=1 group by target, fano)fw
    on fw.target=mb.mno
    left outer join
    (select target, lano, count(*) lk_length, rv.mno from acv_like 
    inner join acv_rv rv on target=rvno 
where lano=1 
    group by target, lano)lk
   on lk.mno=mb.mno; -->
