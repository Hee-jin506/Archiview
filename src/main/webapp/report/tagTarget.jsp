<%@page import="bitcamp.acv.domain.Tag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<jsp:include page="/main/admin-topbar.jsp"></jsp:include>

<%Tag tag = (Tag) request.getAttribute("tag"); %>

<p>태그 번호 : <%=tag.getNo() %></p>
<p>태그명 : <%=tag.getTitle() %></p>
<p>등록일 : <%=tag.getRegisteredDate() %></p>
<p>게시물 수 : <%=tag.getReviews() %></p>

</body>
</html>