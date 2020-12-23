<%@page import="bitcamp.acv.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

<% Member member = (Member) request.getAttribute("member"); %>

    <c:set var='status' value='${follow.status}'/>
    <c:choose>
    <c:when test='${follow.status == 1}'>
    <a href='inactive?no=${follow.status}'>[언팔로우]</a>
    </c:when>
    <c:when test='${follow.status == 2}'>
    <a href='active?no=${follow.status}'>[팔로우]</a>
    </c:when>
  <c:otherwise>
  기타
  </c:otherwise>
</c:choose>

<p>회원 번호 : <%=member.getNo() %></p>
<p>닉네임    : <%=member.getNickName() %></p>
<p>소개글    : <%=member.getIntro()%></p>

</body>
</html>