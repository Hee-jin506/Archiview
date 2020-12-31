<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입(1단계)</title>
<style>

.box {
position: relative;
width: 500px; height: 600px;
left: 50%;
margin-left: -250px; margin-top: 30px;
}

.content1 {
margin: 20px;
color: white;
}

#level {
display: block;
font-size: x-small;
color: #B9B9BA;
}

#welcome {
display: block;
font-size: large;
}

#info {
display: block;
margin-top: 20px;
font-size: small;
font-weight: lighter;
}

.content2 *{
display: block;
margin: 5px 0px 0px 10px;
}

#next {
border-radius: 3px;
border: 1px solid #6B6B6B;
background: #000000;
padding: 3px;
text-align: center;
color: white;
width: 60px; height: 35px;
margin-left: 50%;
}
  
#next:hover {
background: #626473;
  box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset, 0 0 8px rgba(255, 255, 255, 0.6);
  outline: 0 none;
color: #F21BC9;
}


</style>
</head>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<body style="background-color: #000000">

<div class='box'>
  <div class='content1'>
    <div id='level'>1/2단계</div>
    <div id='welcome'>환영합니다.<br>Archiview에 가입 하셔서 리뷰를 남겨보세요.</div>
    <div id='info'>간단한 정보 입력 후 바로 서비스 이용이 가능합니다.</div>
  </div>
  
  <div class='content2'>
    <form class="form-box" action='add1' method="post">
      <input type='hidden' name='loginNo' value='1'>
      <div class="col-sm-10">
      <label for="name" style="color: white;">이름</label>
      <input type="text" autocomplete="off" class="form-control input-lg" name="name" autofocus required style="border:1px solid #6B6B6B; background-color: #000000; color: white;">
      </div>
      <div class="col-sm-10">
      <label for="email" style="color: white;">이메일</label>
      <input type="email" autocomplete="off" class="form-control input-lg" name="email" autofocus required style="border:1px solid #6B6B6B; background-color: #000000; color: white;">
      </div>
      <div class="col-sm-10">
      <label for="password" style="color: white;">비밀번호</label>
      <input type="password" class="form-control input-lg" name="password" placeholder="영어, 특수 기호 포함 6자 이상" autofocus required style="border:1px solid #6B6B6B; background-color: #000000; color: white;">
      </div>
      <div class="col-sm-10">
      <label for="nickName" style="color: white;">닉네임</label>
      <input type="text" autocomplete="off" class="form-control input-lg" name="nickName" autofocus required style="border:1px solid #6B6B6B; background-color: #000000; color: white;">
      </div>
      <div class="col-sm-9" style="margin-top: 20px;">
    <button id='next'>다음</button>
    </div>
    </form>
  </div>

</div>

</body>
</html>