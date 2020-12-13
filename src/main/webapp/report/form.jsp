<%@page import="bitcamp.acv.domain.Review"%>
<%@page import="bitcamp.acv.domain.Report"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[신고 등록]</title>
</head>

<body>
<h1>[신고 등록 - JSP]</h1>

<% Report report = (Report) request.getAttribute("report"); %>
<% Review review = (Review) request.getAttribute("review"); %>

<form action='add' method='post'>
<input type='hidden' name='no' value='<%=review.getNo()%>'>

신고 유형:
<select name='reportedType'>
  <option value='1'>회원</option>
  <option value='2'>게시물</option>
  <option value='3'>댓글</option>
  <option value='4'>태그</option>
</select><br>
신고 사유:
<select name='status'>
	<option value='1'>음란성/선정성</option>
	<option value='2'>폭력성</option>
	<option value='3'>혐오/인신공격</option>
	<option value='4'>광고성/스팸</option>
	<option value='5'>개인정보 노출</option>
	<option value='6'>도배</option>
</select><br>
<button>등록</button> 
</form>
</body>
</html>