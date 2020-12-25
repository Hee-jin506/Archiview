<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head><title>게시물 상세 조회</title></head>
<body>
<br>
<a href='../report/add?no=<%=request.getParameter("no")%>'>신고</a>
<jsp:include page="../../admin/header.jsp"/>
<h3>[게시물 상세 조회]</h3>
게시물 번호: ${review.no}<br>
작성자: ${review.writerNick}<br>
등록일: ${review.registeredDate}<br>
<%-- 영화 번호:${review.numOfReviews}<br> --%>
영화 제목: ${review.movieTitle}<br>
#해시태그: 
<c:forEach items="${tags}" var="t">
#${t.title} 
</c:forEach>
<br>
내용: ${review.text}<br>
<a href='delete?no=${review.no}'>삭제</a>
<a href='active?no=${review.no}'>복구</a>
</body>
</html>