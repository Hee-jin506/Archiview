<%@page import="bitcamp.acv.domain.Movie"%>
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
	<form action='editCard' method='post'>
		<label><input type='hidden' name='movieNo'
			value='<%=request.getParameter("movieNo")%>'></label>
		<%
		  List<String> stillcuts = (List<String>) request.getAttribute("stillcuts");
		for (String stillcut : stillcuts) {
		%>
		<label><input type='radio' name='stc' value='<%=stillcut%>'> 
<%
   if (stillcut.equals("default")) {
%> 
기본</label>
<%
} else {
%> <img src='<%=stillcut%>' alt='<%=stillcuts.indexOf(stillcut)%>번 스틸컷'></label>
			<%
			  }
			}
			%>
		<button>다음</button>
	</form>
	<br>
	<a href='movieSearch'>뒤로</a>
</body>
</html>