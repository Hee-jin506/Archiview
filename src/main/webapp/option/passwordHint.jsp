<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%!
    private String getHint(int questionsNo) {
      switch (questionsNo) {
        case 1 :
          return "내가 키우는 애완 동물의 이름은 ?";
        case 2:
          return "가장 기억에 남는 선생님의 성함은 ?";
        case 3:
          return "어머니의 고향은 ?";
        case 4:
          return "아버지의 고향은 ?";
        default:
          return "가장 친한 친구의 이름은 ?";
      }
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 힌트변경</title>
<style>

 body {
 position: fix;
 width: 500px;
 border-color: #ffffff;
 border-radius: 3px;
 background-color: #141517;
 color: #ffffff;
 }
 
  #profile-photo {
 border-radius: 50px;
 }
 
  #submit {
  position: absolute;
  border-radius: 3px;
  border: 1px solid #6B6B6B;
  background: #000000;
  padding: 5px;
  text-align: center;
  color: white;
  width: 100px;
  height: 40px;
  }
  
  #submit:hover {
  background: #626473;
  color: blue;
  }
  
  input {
  width: 300px;
  height: 30px;
  border-radius: 3px;
  border: 1px solid #6B6B6B;
  color: white;
  background-color: #000000;
  font-size: x-small;
  }
  
</style>
</head>
<body>
<form action='password/hintUpdate' method='post'>
<input type='hidden' name='no' value='${member.no}'><br>
<img id='profile-photo' src='../../upload/${member.photo}_150x150.jpg' width="60"> ${member.email}<br><br>
내 질문 <input type='text' name='hint' value='
<c:if test='${member.questionsNo == 1}'>내가 키우는 애완 동물의 이름은 ?</c:if>
<c:if test='${member.questionsNo == 2}'>가장 기억에 남는 선생님의 성함은 ?</c:if>
<c:if test='${member.questionsNo == 3}'>어머니의 고향은 ?</c:if>
<c:if test='${member.questionsNo == 4}'>아버지의 고향은 ?</c:if>
<c:if test='${member.questionsNo == 5}'>가장 친한 친구의 이름은 ?</c:if>'><br><br>
답 <input type='text' name='hintAnswer' value='${member.questionsAnswer}'><br><br>
<button id='submit'>변경</button>
</form>
</body>
</html>