<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<style>

 body {
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
  
  input {
  width: 300px;
  height: 30px;
  border-radius: 3px;
  border: 1px solid #6B6B6B;
  color: white;
  background-color: #000000;
  font-size: x-small;
  }
  
  #submit:hover {
  background: #626473;
  color: red;
  }
</style>
</head>
<body>
<form action='../../member/delete' method='post'>
<input type='hidden' name='no' value='${member.no}'>
<input type='hidden' name='email' value='${member.email}'>
<img id='profile-photo' src='../../upload/${member.photo}_150x150.jpg' width="60"> ${member.email}<br><br>
비밀번호 확인 <input type='password' name='password'><br><br>
<button id='submit'>탈퇴</button>
</form>
</body>
</html>