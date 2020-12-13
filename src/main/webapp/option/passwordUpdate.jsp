<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호변경</title>
</head>
<body>
<form action='check' method='post'>");
<input type='hidden' name='no' value='${member.no}'><br>
기존 비밀번호 <input type='password' name='oldpassword'><br>
새 비밀번호 <input type='password' name='newpassword'><br>
<button>변경</button>
</form>
</body>
</html>