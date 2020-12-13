<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>[회원 프로필]</h1>

<form action='updatePhoto' method='post' enctype='multipart/form-data'>
  <input type='hidden' name='no' value='${member.no}'><br>
  <a href='../upload/${member.photo}'><img src='../upload/${member.photo}_150x150.jpg'></a><br>
  <input type='file' name='photo'>
  <button>변경</button>
</form>
<br>

<form action='update' method='post'>
<input type='hidden' name='no' value='${member.photo}'><br>
이메일: ${member.email}<br>
닉네임: <input type='text' name='nickName' value='${member.nickName}'><br>
소개: <textarea name='intro'>${member.intro}</textarea><br>
비밀번호 힌트 질문 번호 - ${member.questionsNo}<br>
비밀번호 힌트 정답 - ${member.questionsAnswer}<br>
<button>변경</button>
</form>

<a href='../option/member/withdraw'>탈퇴</a>

</body>
</html>