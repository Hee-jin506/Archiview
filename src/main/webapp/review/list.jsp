<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<title>게시물 관리 화면</title>
<style>body {background-color: #000000;color: #ffffff;}</style>
</head>
<body>

<jsp:include page="/main/admin-topbar.jsp"></jsp:include>

<h1>[게시물 관리]</h1>
<%
String keyword = request.getParameter("keyword");
String no = request.getParameter("no");
String writer = request.getParameter("writer");
String movie = request.getParameter("movie");
%>

<form action='list' method='get'>
<input type='search' name='keyword' value='<%=keyword != null ? keyword : ""%>'>
<button>검색</button><br>
<input type='checkbox' name='no' value='no' <%=no != null ? "checked" : ""%>>번호
<input type='checkbox' name='writer' value='writer' <%=writer != null ? "checked" : ""%>>작성자
<input type='checkbox' name='movie' value='movie' <%=movie != null ? "checked" : ""%>>영화<br>
</form>
<hr>
<h2>상세 검색</h2>

<%
String keywordNumber = request.getParameter("keywordNumber");
String keywordWriterName = request.getParameter("keywordWriterName");
String keywordMovieTitle = request.getParameter("keywordMovieTitle");
String registeredDate= request.getParameter("registeredDate");
String startDate= request.getParameter("startDate");
String endDate= request.getParameter("endDate");
String startNumber= request.getParameter("startNumber");
String endNumber= request.getParameter("endNumber");
String active = request.getParameter("active");
String inactive = request.getParameter("inactive");
%>

<form action='list' method='post'>
게시물 번호: <input type='text' name='keywordNumber' 
  value='<%=keywordNumber != null ? keywordNumber : ""%>'><br>
작성자: <input type='text' name='keywordWriterName' 
  value='<%=keywordWriterName != null ? keywordWriterName : ""%>'><br>
영화 제목: <input type='text' name='keywordMovieTitle' 
  value='<%=keywordMovieTitle != null ? keywordMovieTitle : ""%>'><br>
등록일: <input type='date' name='registeredDate' 
  value='<%=registeredDate != null ? registeredDate : ""%>'><br>
날짜 범위: <input type='date' name='startDate' 
  value='<%=startDate != null ? startDate : ""%>'>~
<input type='date' name='endDate' 
  value='<%=endDate != null ? endDate : ""%>'><br>
번호 범위: <input type='text' name='startNumber' 
  value='<%=startNumber != null ? startNumber : ""%>'>~
<input type='text' name='endNumber' 
  value='<%=endNumber != null ? endNumber : ""%>'><br>
<span>상태 선택: </span>
<input type='checkbox' name='active' 
  value='active' <%=active != null ? "checked" : ""%>>게시중
<input type='checkbox' name='inactive' 
  value='inactive' <%=inactive != null ? "checked" : ""%>>삭제<br>
<button>검색</button>
<input type='reset'>
</form>


<span>총 게시물 수 : ${chartSizeMap.all}</span><br>
<span>삭제된 게시물 수 : ${chartSizeMap.inactive}</span><br>
<span>게시 중인 게시물 수 : ${chartSizeMap.active}</span><br>
<span>어제 등록된 게시물 수 : ${chartSizeMap.yesterday}</span><br>
<span>오늘 등록된 게시물 수 : ${chartSizeMap.today}</span><br>
<span>이번주에 등록된 게시물 수 : ${chartSizeMap.thisWeek}</span><br>
<span>이번달에 등록된 게시물 수 : ${chartSizeMap.thisMonth}</span><br>


<form>
<input type='submit' value='복구' formaction='multipleActive'>
<input type='submit' value='삭제' formaction='multipleDelete'>
<input type='reset'>

<table border="1">
<thead>
<tr>
	<th>선택
	<th>게시물 번호</th>
	<th>작성자</th>
	<th>영화 제목</th>
	<th>등록일</th>
	<th>상태</th>
</tr>
</thead>

<tbody>
<c:forEach items="${list}" var="r">
<tr>
	<td><input type='checkbox' name='reviews' value='${r.no}'></td>
	<td><a href='detail?no=${r.no}'>${r.no}</a></td>
	<td>${r.writer.nickName}</td>
	<td>${r.movieTitle}</td>
	<td>${r.registeredDate}</td>
	<td>${r.statusName}</td>
</tr>
</c:forEach>
</tbody>
</table>
</form>

</body>
</html>
