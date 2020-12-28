<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입(완료)</title>
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

#log-btn {
display: block;
border-radius: 3px;
border: 1px solid #6B6B6B;
background: #000000;
padding: 6px;
text-align: center;
color: white;
width: 60px; height: 35px;
margin-left: 50%;
margin-top: 70px;
}
  
#log-btn:hover {
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
    <div id='welcome'>환영합니다.<br>Archivew에 가입이 완료되었습니다.</div>
    <div id='info'>로그인하여 리뷰를 남겨주세요.</div>
  </div>
    
  <a href="<%=getServletContext().getContextPath()%>/app/auth/login" id='log-btn'>로그인</a>
</div>

</body>
</html>