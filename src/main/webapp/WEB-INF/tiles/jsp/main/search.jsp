<%@page import="java.util.List"%>
<%@page import="bitcamp.acv.domain.Movie"%>
<%@page import="bitcamp.acv.domain.Member"%>
<%@page import="bitcamp.acv.domain.Tag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Member loginUser = (Member) session.getAttribute("loginUser");
List<Movie> movies = (List<Movie>) request.getAttribute("movies");
List<Member> members = (List<Member>) request.getAttribute("members");
List<Tag> tags = (List<Tag>) request.getAttribute("tags");
%>

검색화면

<%
if (members != null || movies != null) {
  for (Member member : members) {
    %>
    멤버
<%=member.getNickName()%>
    <%
    }

  for (Movie movie : movies) {
    %>
    무비
<%=movie.getTitle()%>
    <%
    } 
} else {
  for (Tag tag : tags) {
    %>
    태그
<%=tag.getTitle()%>
    <%
  }
}
  %>


</body>
</html>