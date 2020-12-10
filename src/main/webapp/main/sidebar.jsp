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
</head>
<body>

<div id='topMembers'>
<h3>추천 리뷰어 목록</h3>
<hr>
<%
Member[] members = (Member[])request.getAttribute("topMembers");
for (Member member : members) {
%>
<h3><img src=<%=member.getPhoto()%>><%=member.getNickName() %></h3>
<p><%=member.getIntro() %></p>
<%
}
%>
</div>

<div id='topMovies'>
<h3>인기 영화 목록</h3>
<hr>
<% Movie[] movies = (Movie[])request.getAttribute("topMovies");
int count = 1;
for (Movie movie : movies) {
%>
<h3><%=count%> <%=movie.getTitle()%></h3>
<p>게시물 <%=movie.getReviews().size()%>개</p>
<%
count++;
}
%>
</div>

<div id='topTags'>
<h3>인기 태그 목록</h3>
<hr>
<% Tag[] tags = (Tag[])request.getAttribute("topTags");
for (Tag tag : tags) {
%>
<h3># <%=tag.getTitle()%></h3>
<p>게시물 <%=tag.getReviews().size()%>개 팔로워 <%=tag.getFollowers().size()%>명</p>
<%
}
%>
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
