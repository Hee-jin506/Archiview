<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<style>

#box{
position: absolute;
border: 1px solid #6B6B6B;
border-radius: 5px;
background-color: #141517;
width: 520px; height: 300px;
top: 50%; left: 50%;
margin-top: -150px; margin-left: -260px;
}

</style>
</head>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<body style="background-color: #000000">
<div id='box'>
<h5>비밀번호 변경</h5>
<form action="../../app/auth/update" method="post">
  <div class="form-group">
    <label for="exampleInputPassword1">새 비밀번호</label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="영어, 숫자 포함 6자 이상" name='password'>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword2">비밀번호 확인</label>
    <input type="password" class="form-control" id="exampleInputPassword2" placeholder="새 비밀번호 확인" name='password2'>
  </div>
  <button type="submit" class="btn btn-default">제출</button>
</form>
</div>
</body>
</html>