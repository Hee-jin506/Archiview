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
<div id='reviewer'>
<p>추천 리뷰어 목록</p>
<hr>
<%
Member[] members = (Member[])request.getAttribute("topMembers");
for (Member member : members) {
%>
<img src=<%=member.getPhoto()%>>
<p><%=member.getNickName() %></p>
<p><%=member.getIntro() %></p>
<%
}
%>

<%-- Movie[] movies = (Movie[])request.getAttribute("topMovies");
for (Movie movie : movies) {
%>
<img src=<%=movie.getPhoto()%>>
<p><%=member.getNickName() %></p>
<p><%=member.getIntro() %></p>
<%
}
%> --%>

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
