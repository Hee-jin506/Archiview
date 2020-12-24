<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head><title>코멘트 등록</title>
<style>body {background-color: #000000;color: #ffffff;}</style>
</head>
<body>

<br>
<br>

<form action="../comment/add" method="post">
  코멘트: 
<input type='hidden' name='memberNo' value='${c.no}'>
<input type='text' name='content' value='${c.content}'>
<input type='hidden' name='reviewNo' value='${c.reviewNo}'>
<input type='hidden' name='order' value='${c.groupNo}'>
<input type='hidden' name='level' value='${c.level}'>
<input type='hidden' name='memberNo' value='${member.no}'>
  
<button>등록</button>
</form>
</body>
</html>