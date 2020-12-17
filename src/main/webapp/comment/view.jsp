<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head><title>코멘트 화면</title>
<style>body {background-color: #000000;color: #ffffff;}</style>
</head>
<body>

<jsp:include page="/main/admin-topbar.jsp"></jsp:include>

<h1>[코멘트] </h1>
<br>
<input type='hidden' name='reviewNo' value='${comment.reviewNo}'>

<table border="1">
<thead>
<tr>
<th>cno</th>
<th>사진</th>
<th>작성자 닉네임 / 내용</th>
<th>오더</th>
<th>레벨</th>
<th>등록일</th>
</tr></thead>



<tbody>
<c:forEach items="${view}" var="c"> 
<tr>
<c:choose>
  <c:when test='${c.status == 1}'>
<td>${c.no}</td>
<td><img src='../../upload/${c.member.photo}_150x150.jpg'></td>

<c:set var='level' value='${c.level}'/>
<c:choose>
  <c:when test='${c.level == 0}'>
<td>${c.member.nickName}  ${c.content}<br>
<!-- 인스타는 코멘트 등록을 눌렀을 때 add.jsp에 댓글을 달
     대상 코멘트의 유저 이름이 넘어가서 표시되도록
     되어있다.
-->
<a href='add?No=${c.no}'>코멘트 등록</a>
 </td>
    </c:when>
  <c:otherwise>
<td>${c.member.nickName}  ${c.content}<br></td>
  </c:otherwise>
</c:choose>

<td>${c.order}</td>
<td>${c.level}</td>
<td>${c.registeredDate}</td>
    </c:when>
  <c:otherwise>
<td> 삭제된 코멘트입니다. </td>
  </c:otherwise>
</c:choose>
</tr>
</c:forEach>
</tbody>
</table>


<br>

</body>
</html>
