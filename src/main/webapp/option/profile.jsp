<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필편집</title>
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
  
  textarea {
  border-radius: 3px;
  border: 1px solid #6B6B6B;
  color: white;
  background-color: #000000;
  font-size: x-small;
  }
  
</style>
</head>
<body>


<form action='updatePhoto' method='post' enctype='multipart/form-data'>
  <input type='hidden' name='no' value='${member.no}'><br>
  <img id='profile-photo' src='../upload/${member.photo}_150x150.jpg' width="60"> <p>${member.email}</p><br><br>
  <input type='file' name='photo'>
  <button>변경</button>
</form>
<br>

<form action='update' method='post'>
<input type='hidden' name='no' value='${member.photo}'><br>
이름: <input type='text' name='name' value='${member.name}' readonly="readonly"><br><br>
닉네임: <input type='text' name='nickName' value='${member.nickName}'><br><br>
소개: <textarea name='intro'>${member.intro}</textarea><br><br>
<button id='submit'>제출</button>
</form>

</body>
</html>