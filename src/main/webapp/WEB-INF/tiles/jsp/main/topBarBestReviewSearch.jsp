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
String selectedTagTitle = request.getParameter("selectedTagTitle");
%>

<h3>[태그]</h3>
<jsp:include page="/app/tag/search?selectedTagTitle=${selectedTagTitle}"></jsp:include>
<h3>[게시물]</h3>
<jsp:include page="/app/review/searchBest?keyword=${selectedTagTitle}"></jsp:include>



</body>
</html>