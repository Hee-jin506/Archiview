<%@page import="bitcamp.acv.domain.Comment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

<%Comment comment = (Comment) request.getAttribute("comment"); %>
  
<p>게시물 번호 : <%=comment.getReviewNo()%> </p>
<p>작성자 : <%=comment.getMember().getNickName()  %></p>
<p>댓글 작성자 : <%=comment.getMemberNo() %></p>
<p>댓글 작성일 : <%=comment.getRegisteredDate() %> </p>
<p>댓글 내용 : <%=comment.getContent() %> </p>

</body>
</html>