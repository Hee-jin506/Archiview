<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<title>탑바 검색창 검색 결과</title>
<style>body {background-color: #000000;color: #ffffff;}</style>
</head>
<body>
<jsp:include page="/app/main/topbar"></jsp:include>

<%
String keyword = request.getParameter("keyword");
%>

<h3>[리뷰어]</h3>
<jsp:include page="app/member/search?keyword=${keyword}"></jsp:include>
<h3>[영화]</h3>
<jsp:include page="app/movie/search?keyword=${keyword}"></jsp:include>


</body>
</html>
