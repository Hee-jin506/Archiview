<%@page import="bitcamp.acv.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<jsp:include page="/main/admin-topbar.jsp"></jsp:include>
<% Member member = (Member) request.getAttribute("member"); %>
<%-- <img src="../upload/" + <%=member.getPhoto() + "_35x35.jpg"%>"> --%>
<img src="<%=member.getPhoto()%>"><br>
<p>회원 번호 : <%=member.getNo() %></p>
<p>닉네임 : <%=member.getNickName() %></p>
<p>이메일 : <%=member.getEmail() %></p>
<p>가입일 : <%=member.getRegisteredDate() %>
<p>소개글 : <%=member.getIntro()%>

</body>
</html>