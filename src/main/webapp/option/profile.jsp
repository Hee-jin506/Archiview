<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>프로필편집</title>
<style>
 
 #option {
 background: #141517;
border: 0.4px solid #6B6B6B;
box-sizing: border-box;
box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
border-radius: 3px;
 width: 640px;
 height: 540px;
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
  
.ex-layout{
  width: 800px;
  height: 700px;
}
.ex-layout .main{
  background-color: #141517;
}
.ex-layout .main:after{ clear: both; display: block; content: '' }

.ex-layout .main .lnb{
  border-right: 1px solid #6B6B6B;
  float: left;
  width: 200px;
  height: 600px;
  background-color: #141517;
}
.ex-layout .main .content{
  float: left;
  width: 580px;
}
</style>
</head>
<div id='option'>
<div class="ex-layout">
  <div class="main">

  <div class="lnb">
    <a href='option/profile'>프로필 변경</a><br>
    <a href='option/password/update'>비밀번호 변경</a><br>
    <a href='option/password/hint'>비밀번호 힌트 변경</a><br>
    <a href='option/withdraw'>회원탈퇴</a><br>
  </div>
  
    <div class="content">
<form action='profile/updatePhoto' method='post' enctype='multipart/form-data'>
  <input type='hidden' name='no' value='${member.no}'><br>
  <img id='profile-photo' src='../../upload/${member.photo}_150x150.jpg' width="60"> <p>${member.email}</p><br><br>
  <input type='file' name='photo'>
  <button>변경</button>
</form>
<br>

<form action='profile/update' method='post'>
<input type='hidden' name='no' value='${member.no}'><br>
이름: <input type='text' name='name' value='${member.name}' readonly="readonly"><br><br>
닉네임: <input type='text' name='nickName' value='${member.nickName}'><br><br>
소개: <textarea name='intro'>${member.intro}</textarea><br><br>
<button id='submit'>제출</button>
</form>
    </div>
  </div>
</div>
</div>
