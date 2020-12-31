<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<style>
</style>
</head>

<body style="background-color: #000000">
<div id="box">
  <div class="menus">
    <div id='menu1'>
      <a href='<%=getServletContext().getContextPath()%>/app/option/profile'>프로필 변경</a>
    </div>
    <div id='menu2'>
      <a href='<%=getServletContext().getContextPath()%>/app/option/passwordUpdate'>비밀번호 변경</a>
    </div>
    <div id='menu3'>
      <a href='<%=getServletContext().getContextPath()%>/app/option/passwordHint'>비밀번호 힌트 변경</a>
    </div>
    <div id='menu4'>
      <a href='<%=getServletContext().getContextPath()%>/app/option/withdraw'>회원탈퇴</a>
    </div>
  </div>
  
  <div class="contents">
	  <form action='<%=getServletContext().getContextPath()%>/app/member/delete' method='post'>
		  <input type='hidden' name='no' value='${member.no}'>
		  <input type='hidden' name='email' value='${member.email}'>
		  <img id='profile-photo' src='<%=getServletContext().getContextPath()%>/upload/${member.photo}_150x150.jpg' style="border-radius: 50px" width="60">
		  <span id='email'>${member.email}</span>
		  <div class="form-group" style="margin-top: 30px">
		    <label for="password" class="col-sm-4 control-label" style="margin: 20px; font-size: small;">비밀번호 확인</label>
		    <div class="col-sm-7">
		      <input type='password' class='form-control' name='password' style="border:1px solid #6B6B6B; background-color: #000000; color: white;">
				</div>
			</div>
		  <button id='next'>탈퇴</button>
		</form>
  </div>
</div>
</body>
</html>

