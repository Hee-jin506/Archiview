<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>프로필편집</title>
<style>
 
.ex-layout{
  text-decoration: none; 
  width: 650px;
  height: 560px;
  margin: 30px;
}
.ex-layout .main{
  background-color: #141517;
  border: 1px solid #6B6B6B;
  border-radius: 30px;
  width: 680px;
  height: 560px;
}
.ex-layout .main:after{ clear: both; display: block; content: '' }

.ex-layout .main .lnb{
  border-right: 1px solid #6B6B6B;
  float: left;
  font: bold;
  font-size: medium;
  margin: 40px 0px 0px 15px;
  width: 180px;
  height: 480px;
}
.ex-layout .main .content{
  float: left;
  width: 390px;
  height: 480px;
  margin: 30px 0px 0px 20px;
}
</style>
</head>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<div class="ex-layout">
  <div class="main">

  <div class="lnb">
    <a href='<%=getServletContext().getContextPath()%>/app/option' style="color: white">프로필 변경</a><br>
    <a href='<%=getServletContext().getContextPath()%>/app/option/passwordUpdate'>비밀번호 변경</a><br>
    <a href='<%=getServletContext().getContextPath()%>/app/option/passwordHint'>비밀번호 힌트 변경</a><br>
    <a href='<%=getServletContext().getContextPath()%>/app/option/withdraw'>회원탈퇴</a>
  </div>
  
<div class="content">
<form class='form-horizontal' action='profileUpdate' method='post' enctype='multipart/form-data'>
  <input type='hidden' name='no' value='${member.no}'>
   <div class='form-group'>
      <label for="inputEmail3" class="col-sm-2 control-label">
      <img id='profile-photo' src='<%=getServletContext().getContextPath()%>/upload/${member.photo}_150x150.jpg' style="border-radius: 50px" width="60">${member.email}</label>
    </div>
    <div class="form-group">
      <div class='col-sm-10'>
        <input type='file' name='photo'>
      </div>
    </div> 
    <div class='form-group'>
      <label for="inputText3" class="col-sm-2 control-label">이름</label>
      <div class='col-sm-10'>
        <div class="col-xs-9">
          <input type='text' class='form-control' id="inputEmail3" name='name' value='${member.name}' readonly="readonly">
        </div>
      </div>
    </div>
    <div class='form-group'>
      <label for="inputText3" class="col-sm-2 control-label">닉네임</label>
      <div class='col-sm-10'>
        <div class="col-xs-9">
          <input type='text' class='form-control' name='nickName' value='${member.nickName}'>
        </div>
      </div>
    </div>
    <div class='form-group'>
      <label for="inputText3" class="col-sm-2 control-label">소개</label>
      <div class='col-sm-10'>
        <div class="col-xs-9">
          <textarea class="form-control" name='intro' value="${member.intro}" rows='7'></textarea>
        </div>
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-offset-5 col-sm-15">
        <button class="btn btn-primary">제출</button>
      </div>
    </div>
</form>
    </div>
  </div>
</div>
