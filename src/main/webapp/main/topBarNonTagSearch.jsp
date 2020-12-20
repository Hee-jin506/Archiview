<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<title>탑바 검색창 검색 결과</title>
<style>
 body {
   background-color : #000000;
   color: #ffffff;
   margin: 0px;
 }
 
 p {
   font-size: 18px;
   font-weight: bold;
   margin:0px;
 }
 
 img.profile {
  border-radius: 100px;
 }
</style>
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
<h3>리뷰어</h3>
<c:if test="${empty memberList}">검색결과가 없습니다.</c:if>
<c:forEach items="${memberList}" var="mb">
${mb.nickName}<br>
</c:forEach>
<h3>영화</h3>
<c:if test="${empty movieList}">검색결과가 없습니다.</c:if>
<c:forEach items="${movieList}" var="mv">
${mv.title}<br>
</c:forEach>

<jsp:include page="/app/main/sidebar"/>
<jsp:include page="/main/footer.jsp"/>
</body>
</html>
