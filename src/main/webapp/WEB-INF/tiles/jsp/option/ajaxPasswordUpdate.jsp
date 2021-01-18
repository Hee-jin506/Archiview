<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="appRoot" value="${pageContext.servletContext.contextPath}"/>
    <form action='passwordCheck' method='post'>
        <input type='hidden' name='no' value='${member.no}'>
        <img id='profile-photo' src='${appRoot}/upload/${member.photo}_150x150.jpg' style="border-radius: 50px" width="60">
        <span id='email'>${member.email}</span>
      <div class="form-group" style="margin-top: 30px">
        <label for="oldpassword" class="col-sm-4 control-label"  style="margin: 20px; font-size: small;">기존 비밀번호</label>
        <div class="col-sm-7">
          <input type='password' class='form-control' name='oldpassword' placeholder="영어, 숫자 포함 6자 이상" style="border:1px solid #6B6B6B; background-color: #000000; color: white;">
        </div>
      </div>
      <div class="form-group">
        <label for="newpassword1" class="col-sm-4 control-label"  style="margin: 20px; font-size: small;">새 비밀번호</label>
        <div class="col-sm-7">
          <input type='password' class='form-control' name='newpassword1' placeholder="새 비밀번호" style="border:1px solid #6B6B6B; background-color: #000000; color: white;">
        </div>
      </div>
      <div class="form-group">
        <label for="newpassword2" class="col-sm-4 control-label"  style="margin: 20px; font-size: small;">비밀번호 확인</label>
        <div class="col-sm-7">
          <input type='password' class='form-control' name='newpassword2' placeholder="비밀번호 확인" style="border:1px solid #6B6B6B; background-color: #000000; color: white;">
        </div>
      </div>
      <button id='next'>변경</button>
    </form>
