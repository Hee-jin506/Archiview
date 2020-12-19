<%@page import="bitcamp.acv.domain.Tag"%>
<%@page import="bitcamp.acv.domain.Member"%>
<%@page import="java.util.List"%>
<%@page import="bitcamp.acv.domain.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%List<Review> list = (List<Review>) request.getAttribute("list");
for (Review review : list) {
%>
<img src=<%=getServletContext().getContextPath()+"/upload/" + review.getWriterPhoto() + "_35x35.jpg"%>>
<p><%=review.getWriterNick() %></p>
<% if (!review.getWriterNick().equals(((Member)(request.getAttribute("loginUser"))).getNickName())) {%>
<form>
<button>팔로우</button>
</form>
<%}%>
<img src=<%=review.getStcUrl() %>><br>
<p><%=review.getText() %></p>
<% 
List<Tag> tags = review.getTags();
if (tags.size() != 0) {%>
<p>
<% for (Tag tag : tags) { %>
#<%=tag.getTitle() %> 
<%}%></p>
<%}%>
<hr>
<%}%>
</body>
</html>