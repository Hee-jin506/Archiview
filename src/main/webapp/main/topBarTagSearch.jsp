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
<jsp:include page="/main/topbar.jsp"></jsp:include>
<%
String keyword = request.getParameter("keyword");
%>

<h3>[태그]</h3>
<jsp:include page="/tag/search?keyword=${keyword}"></jsp:include>

</body>
</html>
