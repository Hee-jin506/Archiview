<%@page import="java.util.List"%>
<%@page import="bitcamp.acv.domain.Comment"%>
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

<table border="1">
<thead>
<tr>
<th>댓글 번호</th>
<th>사진</th>
<th>작성자 닉네임</th>
<th>내용</th>
<th>그룹 번호</th>
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
  <c:when test='${c.level == 1}'>
<td>${c.member.nickName}</td>
<td>${c.content}<br>
<!-- add.jsp로 넘어간다.
-->
<form method='post'>
<input type='hidden' name='targetNo' value='${c.no}'>
  <button>대댓글 등록</button>
</form>

 </td>
    </c:when>
  <c:otherwise>
<td>${c.member.nickName}</td>
<td>${c.content}</td>
  </c:otherwise>
</c:choose>

<td>${c.groupNo}</td>
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

<form action="../comment/add" method="post">
<%
String targetWriter = null;
String targetNo = request.getParameter("targetNo");
if (targetNo != null) {
    for (Comment comment : (List<Comment>) (request.getAttribute("view"))) {
      if (comment.getNo()==Integer.parseInt(targetNo)) {
        targetWriter = comment.getMember().getNickName();
        System.out.println(targetWriter);
    }
  }
  %>
<input type='hidden' name='targetNo' value=<%=request.getParameter("targetNo") %>>
<%
}
%>
  코멘트: 
<input type='text' name='content' value='<%= targetWriter != null ? "@" + targetWriter : ""%>'>
<input type='hidden' name='groupNo' value='<%= targetNo %>'>
  
<button>등록</button>
</form>

<br>

</body>
</html>
