<%@page import="bitcamp.acv.domain.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<jsp:include page="/main/admin-topbar.jsp"></jsp:include>

<%Review review = (Review) request.getAttribute("review"); %>

<p>리뷰 번호 : <%=review.getNo()%></p>
<p>작성자 : <%=review.getWriter().getNickName()%></p>
<p>등록일 : <%=review.getRegisteredDate() %></p>
<p>영화 번호 : 이 부분 확인 필요..</p>
<p>영화 제목 : <%=review.getMovieTitle() %></p>
<p>#해시태그 : <%=review.getTags() %></p>
<p>내용 : <%=review.getWriter().getIntro() %> </p>
</body>
</html>