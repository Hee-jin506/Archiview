<%@page import="bitcamp.acv.service.MovieService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>후기 등록 : 스틸컷 선택</title>
</head>
<body>
	<h1>인상 깊은 장면을 골라주세요.</h1>
	<%
	  ServletContext ctx = request.getServletContext();
	MovieService movieService = (MovieService) ctx.getAttribute("movieService");
	List<String> stillcuts = (List<String>) request.getAttribute("stillcuts");
	for (String stillcut : stillcuts) {
	%>
	<form action='editCard'>
		<input type='radio' name='stc'
			value='<%=movieService.getStcNo(stillcut)%>'
			<%=stillcuts.indexOf(stillcut) == 0 ? "checked" : ""%>> <img
			src='<%=stillcut%>'
			alt='<%=stillcuts.indexOf(stillcut)%>번 스틸컷'>
		<%
		  }
		%>
		<button>다음</button>
	</form>
	<br>
	<a href='movieSearch'>뒤로</a>
</body>
</html>