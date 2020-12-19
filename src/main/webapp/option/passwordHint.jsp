<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%!
    private String getHint(int questionsNo) {
      switch (questionsNo) {
        case 1 :
          return "내가 키우는 애완 동물의 이름은 ?";
        case 2:
          return "가장 기억에 남는 선생님의 성함은 ?";
        case 3:
          return "어머니의 고향은 ?";
        case 4:
          return "아버지의 고향은 ?";
        default:
          return "가장 친한 친구의 이름은 ?";
      }
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 힌트변경</title>
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
  font-size: large;
  font: bold;
  color: white;
  margin: 10px;
}
.ex-layout .main .content{
  float: left;
  width: 580px;
}
</style>
</head>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<body>
<div id='option'>
<div class="ex-layout">
  <div class="main">

  <div class="lnb">
    <a href='<%=getServletContext().getContextPath()%>/app/option'>프로필 변경</a><br>
    <a href='<%=getServletContext().getContextPath()%>/app/option/passwordUpdate'>비밀번호 변경</a><br>
    <a href='<%=getServletContext().getContextPath()%>/app/option/passwordHint' style="color: white">비밀번호 힌트 변경</a><br>
    <a href='<%=getServletContext().getContextPath()%>/app/option/withdraw'>회원탈퇴</a><br>
  </div>
  <div class="content">
<form action='password/hintUpdate' method='post'>
<input type='hidden' name='no' value='${member.no}'><br>
<img id='profile-photo' src='<%=getServletContext().getContextPath()%>/upload/${member.photo}_150x150.jpg' width="60"> ${member.email}<br><br>
내 질문 <select class="form-select" aria-label="Default select example" name='hint' style="background-color: #000000"> <option selected value="${member.questionsNo}">
<c:if test='${member.questionsNo == 1}'>내가 키우는 애완 동물의 이름은 ?</c:if>
<c:if test='${member.questionsNo == 2}'>가장 기억에 남는 선생님의 성함은 ?</c:if>
<c:if test='${member.questionsNo == 3}'>어머니의 고향은 ?</c:if>
<c:if test='${member.questionsNo == 4}'>아버지의 고향은 ?</c:if>
<c:if test='${member.questionsNo == 5}'>가장 친한 친구의 이름은 ?</c:if>
</option>
<option value="1">내가 키우는 애완 동물의 이름은 ?</option>
<option value="2">가장 기억에 남는 선생님의 성함은 ?</option>
<option value="3">어머니의 고향은 ?</option>
<option value="4">아버지의 고향은 ?</option>
<option value="5">가장 친한 친구의 이름은 ?</option>
</select><br><br>
답 <input type='text' name='hintAnswer' value='${member.questionsAnswer}'><br><br>
<button id='submit'>변경</button>
</form>
</div>
</div>
</div>
</div>
</body>
</html>