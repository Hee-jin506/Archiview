<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head><title>코멘트 관리 화면</title>
<style>body {background-color: #000000;color: #ffffff;}</style>
</head>
<body>

<jsp:include page="/main/admin-topbar.jsp"></jsp:include>

<h1>[코멘트 관리]</h1>
<%
String keyword = request.getParameter("keyword");
%>

<form action='list' method='get'>
검색어: <input type='search' name='keyword' value='<%=keyword != null ? keyword : "리뷰 작성자로 검색"%>'>
<button>검색</button><br>
</form>
<br>

<form action='multipleDelete' method='get'>

<table border="1">
<thead>
<tr>
<th></th>
<th>코멘트 번호</th>
<th>리뷰 번호</th>
<th>리뷰 내용</th>
<th>사진</th>
<th>작성자 닉네임</th>
<th>코멘트</th>
<th>그룹번호</th>
<th>레벨</th>
<th>등록일</th>
<th>상태</th>
</tr></thead>

<tbody>
<c:forEach items="${list}" var="c"> 
<tr>
<td><input type='checkbox' name='comments' value='${c.no}'></td>
<td>${c.no}</td>
<td>${c.reviewNo}</td>
<td><a href='view?reviewNo=${c.reviewNo}'>${c.review.text}</a></td>
<td><img src='../../upload/${c.member.photo}_150x150.jpg'></td>
<td>${c.member.nickName}</td>
<td>${c.content}</td>
<td>${c.groupNo}</td>
<td>${c.level}</td>
<td>${c.registeredDate}</td>
<c:choose>
  <c:when test='${c.status == 1}'>
    <td>게시중</td>
  </c:when>
  <c:otherwise>
    <td>삭제</td>
  </c:otherwise>
</c:choose>
</tr>
</c:forEach>
</tbody>
</table>
<br>
<button>정지</button>
</form>


</body>
</html>
