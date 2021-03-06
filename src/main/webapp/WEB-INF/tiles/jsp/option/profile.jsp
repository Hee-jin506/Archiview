<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="appRoot" value="${pageContext.servletContext.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필편집</title>
<style>
</style>
</head>

<body style="background-color: #000000">

<div id='box'>
  <div class='sideMenu'>
    <div id='menu1' class='sideMenu_row'>
      <a>프로필 변경</a>
    </div>
    <div id='menu2' class='sideMenu_row'>
      <a>비밀번호 변경</a>
    </div>
    <div id='menu3' class='sideMenu_row'>
      <a >비밀번호 힌트 변경</a>
    </div>
    <div id='menu4' class='sideMenu_row'>
      <a >회원탈퇴</a>
    </div>
  </div>
  
  <div class='contents'>
    <form action='profileUpdate' method='post' enctype='multipart/form-data'>
        <input type='hidden' name='no' value='${member.no}'>
        <img id='profile-photo' src='${appRoot}/upload/${member.photo}_150x150.jpg' style="border-radius: 50px" width="60">
        <span id='email'>${member.email}</span>
        <input type='file' name='photo'>
      <div class="form-group">
        <label for="inputName" class="col-sm-3 control-label"  style="margin: 20px; font-size: small;">이름</label>
        <div class="col-sm-8">
          <input type="text" class="form-control" id="inputName" name='name' value='${member.name}' style="border:1px solid #6B6B6B; background-color: #000000; color: #6B6B6B;" readonly="readonly">
        </div>
      </div>
      <div class="form-group">
        <label for="inputNik" class="col-sm-3 control-label"  style="margin: 20px; font-size: small;">닉네임</label>
        <div class="col-sm-8">
          <input type="text" autocomplete="off" class="form-control" id="inputNik" name='nickName' value='${member.nickName}' style="border:1px solid #6B6B6B; background-color: #000000; color: white;">
        </div>
      </div> 
      <div class="form-group">
        <label for="inputIntro" class="col-sm-3 control-label"  style="margin: 20px; font-size: small;">소개</label>
        <div class="col-sm-8">
          <textarea autocomplete="off" class='form-control' id='inputIntro' name='intro' rows='4' style="border:1px solid #6B6B6B; resize: none; background-color: #000000; color: white;">${member.intro}</textarea>
        </div> 
      </div> 
      <button id='next'>변경</button>
    </form>
  </div>
</div>
</body>
</html>