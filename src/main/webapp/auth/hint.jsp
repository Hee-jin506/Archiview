<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기(힌트)</title>
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

 #q {
margin: 5px 0px 5px 40px;
color: white;
}

</style>
</head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<body style="background-color: #000000">
<div id='box'>
<h3 style="color: white; margin: 40px 0px 20px 40px;">비밀번호 찾기</h3>
<div id='q'>
<p>질문에 대한 답변을 입력하세요.</p>
<p>Q.<c:if test='${sessionScope.searchUser.questionsNo == 1}'>내가 키우는 애완 동물의 이름은 ?</c:if>
<c:if test='${searchUser.questionsNo == 2}'>가장 기억에 남는 선생님의 성함은 ?</c:if>
<c:if test='${searchUser.questionsNo == 3}'>어머니의 고향은 ?</c:if>
<c:if test='${searchUser.questionsNo == 4}'>아버지의 고향은 ?</c:if>
<c:if test='${searchUser.questionsNo == 5}'>가장 친한 친구의 이름은 ?</c:if>
</p>
</div>

<form action="hintCheck" method="post">
  <div class="form-group">
    <div class="row">
      <div class="col-xs-10">
        <input type="text" class="form-control" placeholder="답을 입력하세요" name='hint' style="border:1px solid #6B6B6B; color: white; background-color: #000000; margin: 5px 0px 0px 40px;">
      </div>
    </div>
  </div>
  <button type="submit" id='next'>다음</button>
</form>
</div>
</body>
</html>