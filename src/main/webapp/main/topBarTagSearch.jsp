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
<br>
<br>
<br>
<br>
<br>
<br>
<h3>[태그]</h3>
<c:if test="${empty tagList}">검색결과가 없습니다.</c:if>
<c:forEach items="${tagList}" var="t">
#${t.title}<br>
</c:forEach>
<%-- <a href='../main/search?selectedTagTitle=${t.title}'> --%>

</body>
</html>
