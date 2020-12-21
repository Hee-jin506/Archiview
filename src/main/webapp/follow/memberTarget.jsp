<%@page import="bitcamp.acv.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

<% Member member = (Member) request.getAttribute("member"); %>

<p>회원 번호 : <%=member.getNo() %></p>
<p>닉네임    : <%=member.getNickName() %></p>
<p>소개글    : <%=member.getIntro()%></p>

</body>
</html>