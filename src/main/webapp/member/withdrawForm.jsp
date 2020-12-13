<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action='../../app/member/delete' method='post'>
<input type='hidden' name='no', value='${member.no}'>
패스워드 : <input type='password' name='password'><br>
<button>탈퇴</button>
</form>
</body>
</html>