<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 힌트변경</title>
</head>
<body>
<form action='password/hintUpdate' method='post'>
<input type='hidden' name='no' value='${member.no}'><br>
<img src='../upload/${member.photo}_50x50.jpg'>${member.email}<br>
내 질문 <input type='text' name='hint' value='${member.questionsNo}'><br>
답 <input type='text' name='hintAnswer' value='${member.questionsAnswer}'><br>
<button>변경</button>
</form>
</body>
</html>