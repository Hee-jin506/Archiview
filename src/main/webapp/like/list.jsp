<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head><title>좋아요 화면</title>
<style>body {background-color: #000000;color: #ffffff;}</style>
</head>
<body>

<jsp:include page="/main/admin-topbar.jsp"></jsp:include>

<h1>좋아요</h1>

<br>

<table border="1">
<thead>
<tr>
<th>좋아요 이력 번호</th>
<th>좋아요 한 회원 번호</th>
<th>좋아요 한 회원 닉네임</th>
<th>좋아요 된 대상 유형</th>
<th>좋아요 된 대상 유형 이름</th>
<th>좋아요 된 대상 번호</th>
<th>좋아요 누른 일시</th>
</tr>
</thead>

<tbody>
<c:forEach items="${list}" var="l"> 
<tr>
<td>${l.no}</td>
<td>${l.likingMember.no}</td>
<td>${l.likingMember.nickName}</td>
<td>${l.likedType}</td>
<td>${l.likedTypeName}</td>
<td>${l.likedNo}</td>
<td>${l.likedDate}</td>
</tr>
</c:forEach>
</body>
</html>
