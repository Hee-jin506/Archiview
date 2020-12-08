<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<title>태그 관리 화면</title>
<style>body {background-color: #000000;color: #ffffff;}</style>
</head>
<body>

<jsp:include page="/main/admin-topbar.jsp"></jsp:include>

<h1>[태그 관리]</h1>
<%
String keyword = request.getParameter("keyword");
String no = request.getParameter("no");
String name = request.getParameter("name");
%>

<form action='list' method='get'>
<input type='search' name='keyword' value='<%=keyword != null ? keyword : ""%>'>
<button>검색</button><br>
<input type='checkbox' name='no' value='no' <%=no != null ? "checked" : ""%>>번호
<input type='checkbox' name='name' value='tt' <%=name != null ? "checked" : ""%>>태그명<br>
</form>
<hr>
<h2>상세 검색</h2>

<%
String keywordNumber = request.getParameter("keywordNumber");
String keywordTitle = request.getParameter("keywordTitle");
String registeredDate= request.getParameter("registeredDate");
String startDate= request.getParameter("startDate");
String endDate= request.getParameter("endDate");
String startNumber= request.getParameter("startNumber");
String endNumber= request.getParameter("endNumber");
String active = request.getParameter("active");
String inactive = request.getParameter("inactive");
%>

<form action='list' method='post'>
태그번호: <input type='text' name='keywordNumber' 
  value='<%=keywordNumber != null ? keywordNumber : ""%>'><br>
태그명: <input type='text' name='keywordTitle' 
  value='<%=keywordTitle != null ? keywordTitle : ""%>'><br>
등록일: <input type='date' name='registeredDate' 
  value='<%=registeredDate != null ? registeredDate : ""%>'><br>
날짜 범위: <input type='date' name='startDate' 
  value='<%=startNumber != null ? startNumber : ""%>'>~
<input type='date' name='endDate' 
  value='value='<%=endDate != null ? endDate : ""%>'><br>
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


<span>총 태그 수 : ${chartSizeMap.all}</span><br>
<span>삭제된 태그 수 : ${chartSizeMap.inactive}</span><br>
<span>게시 중인 태그 수 : ${chartSizeMap.active}</span><br>
<span>어제 등록된 태그 수 : ${chartSizeMap.yesterday}</span><br>
<span>오늘 등록된 태그 수 : ${chartSizeMap.today}</span><br>
<span>이번주에 등록된 태그 수 : ${chartSizeMap.thisWeek}</span><br>
<span>이번달에 등록된 태그 수 : ${chartSizeMap.thisMonth}</span><br>


<form>
<input type='submit' value='복구' formaction='multipleActive'>
<input type='submit' value='삭제' formaction='multipleDelete'>
<input type='reset'>

<table border="1">
<thead>
<tr>
	<th>선택
	<th>태그 번호</th>
	<th>태그명</th>
	<th>게시물 수</th>
	<th>등록일</th>
	<th>상태</th>
</tr>
</thead>

<tbody>
<c:forEach items="${list}" var="t">
<tr>
	<td><input type='checkbox' name='tags' value='${t.no}'></td>
	<td>${t.no}</td>
	<td><a href='detail?no=${t.no}'>${t.title}</a></td>
	<td>${t.title}</td>
	<td>${t.numOfReviews}</td>
	<td>${t.statusName}</td>
</tr>
</c:forEach>
</tbody>
</table>
</form>

</body>
</html>
