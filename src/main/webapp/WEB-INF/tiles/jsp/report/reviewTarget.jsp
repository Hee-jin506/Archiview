<%@page import="bitcamp.acv.domain.Tag"%>
<%@page import="bitcamp.acv.domain.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

<%Review review = (Review) request.getAttribute("review"); %>

<p>리뷰 번호 : <%=review.getNo()%></p>
<p>작성자 : <%=review.getWriterNick() %></p>
<p>등록일 : <%=review.getRegisteredDate() %></p>
<p>영화 번호 : <%=review.getNo() %></p>
<p>영화 제목 : <%=review.getMovieTitle() %></p>
<p>내용 : <%=review.getText() %> </p>
</body>
</html>