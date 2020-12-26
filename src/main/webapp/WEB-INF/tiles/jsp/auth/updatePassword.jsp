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

#next {
position: absolute;
border-radius: 3px;
border: 1px solid #6B6B6B;
background: #000000;
padding: 5px;
text-align: center;
color: white;
width: 70px; height: 40px;
left: 50%; bottom: 0%;
margin-left: -35px; margin-bottom: 40px;
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
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<body style="background-color: #000000">
<div id='box'>
<h3 style="color: white; margin: 40px 0px 30px 40px;">비밀번호 변경</h3>

<form class="form-horizontal" action="../auth/update" method="post">
  <div class="form-group">
    <label for="exampleInputPassword1" class="col-sm-4 control-label" style="color: white;">새 비밀번호</label>
    <div class="col-sm-6">
      <input type="password" class="form-control" id="exampleInputPassword1" placeholder="영어, 숫자 포함 6자 이상" name='password' style="border:1px solid #6B6B6B; color: white; background-color: #000000; margin: 5px 0px 0px 40px;">
    </div>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword2" class="col-sm-4 control-label" style="color: white;">비밀번호 확인</label>
    <div class="col-sm-6">
      <input type="password" class="form-control" id="exampleInputPassword2" placeholder="새 비밀번호 확인" name='password2' style="border:1px solid #6B6B6B; color: white; background-color: #000000; margin: 5px 0px 0px 40px;">
    </div>
  </div> 
  <button type="submit" id='next'>변경</button>
</form>
</div>
</body>
</html>