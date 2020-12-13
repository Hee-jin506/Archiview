<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action='../../member/delete' method='post'>
<input type='hidden' name='no', value='${member.no}'>
이메일 : <input type='email' name='email' value='${member.email}' readonly><br>
패스워드 : <input type='password' name='password'><br>
<button>탈퇴</button>
</form>
</body>
</html>