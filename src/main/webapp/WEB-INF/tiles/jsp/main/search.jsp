<%@page import="java.util.List"%>
<%@page import="bitcamp.acv.domain.Tag"%>
<%@page import="bitcamp.acv.domain.Movie"%>
<%@page import="bitcamp.acv.domain.Member"%>
<%@page import="bitcamp.acv.domain.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

검색화면

<%
List<Member> members = (List<Member>) request.getAttribute("members");
List<Movie> movies = (List<Movie>) request.getAttribute("movies");
List<Tag> tags = (List<Tag>) request.getAttribute("tags");

%>


</body>
</html>