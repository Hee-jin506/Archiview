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
<c:set var="appRoot" value="${pageContext.servletContext.contextPath}"/>

<% Member member = (Member) request.getAttribute("member"); %>
<img src="${appRoot}/upload/${member.photo}_35x35.jpg">
<br>
<p>회원 번호 : <%=member.getNo() %></p>
<p>닉네임 : <%=member.getNickName() %></p>
<p>이메일 : <%=member.getEmail() %></p>
<p>가입일 : <%=member.getRegisteredDate() %>
<p>소개글 : <%=member.getIntro()%>

</body>
</html>