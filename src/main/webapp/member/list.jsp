<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head><title>회원 관리 화면</title>
<style>body {background-color: #000000;color: #ffffff;}</style>
</head>
<body>

<jsp:include page="/main/admin-topbar.jsp"></jsp:include>

<h1>[회원 관리]</h1>
<%
String keyword = request.getParameter("keyword");
%>

<form action='list' method='get'>
검색어: <input type='search' name='keyword' value='<%=keyword != null ? keyword : "회원 번호, 이름, 이메일, 닉네임, 회원상태로 검색"%>'>
<button>검색</button><br>
</form>
<br>

<form action='multipleDelete' method='get'>
<table border="1">
<thead>
<tr>
<th></th>
<th>회원 번호</th>
<th>권한</th>
<th>이름</th>
<th>로그인 유형 번호</th>
<th>이메일</th>
<th>별명</th>
<th>소개글</th>
<th>회원 가입일</th>
<th>회원 상태</th>
<th>회원 상태 변경일</th>
</tr></thead>

<tbody>
<c:forEach items="${list}" var="m"> 
<tr>
<td><input type='checkbox' name='members' value='${m.no}'></td>
<td>${m.no}</td>
<td>${m.authority}</td>
<td><a href='detail?no=${m.no}'>${m.name}</a></td>
<td>${m.loginNo}</td>
<td>${m.email}</td>
<td>${m.nickName}</td>
<td>${m.intro}</td>
<td>${m.registeredDate}</td>
<td>${m.statusTitle}</td>
<td>${m.statusModifiedDate}</td>
</tr>
</c:forEach>
</tbody>
</table>
<br>
<button>정지</button>
</form>

</body>
</html>
