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

#box {
position: absolute;
width: 600px;
height: 500px;
border: 1px solid #6B6B6B; border-radius: 5px;
background-color: #141517;
top: 50%; left: 50%;
margin-top: -250px; margin-left: -300px;
}

.menus {
display: inline-block;
float: left;
}

.menus * {
color: white;
text-decoration: none;
font-size: 20px;
margin: 10px;
}

.contents {
position:relative;
display:inline-block;
width:380px; height: 480px;
border-left: 1px solid #6B6B6B;
margin: 10px;
}

.contents * {
color: white;
margin: 5px 0px 0px 10px;
}

#next {
position:absolute;
border-radius: 3px;
border: 1px solid #6B6B6B;
background: #000000;
padding: 5px;
text-align: center;
color: white;
width: 60px; height: 35px;
left: 50%; bottom: 0%;
margin-left: -30px; margin-bottom: 15px;
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

<jsp:include page="/app/main/topbar"/>

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
    <form class="form-horizontal" action='password/hintUpdate' method='post'>
        <input type='hidden' name='no' value='${member.no}'>
        <img id='profile-photo' src='<%=getServletContext().getContextPath()%>/upload/${member.photo}_150x150.jpg' style="border-radius: 50px" width="60">
        <span id='email' style="font-size: 20px;">${member.email}</span>
      <div class="form-group" style="margin-top: 30px">
        <label for="hint" class="col-sm-2 control-label">질문</label>
        <div class="col-sm-9">
	        <select class="form-control" aria-label="Default select example" name='hint' style="border:1px solid #6B6B6B; background-color: #000000; color: white;"> <option selected value="${member.questionsNo}">
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
	        </select>
	      </div>
	    </div>
      <div class="form-group">
        <label for="hintAnswer" class="col-sm-2 control-label">답</label>
        <div class="col-sm-9">
          <input type='text' class='form-control' name='hintAnswer' value='${member.questionsAnswer}' style="border:1px solid #6B6B6B; background-color: #000000; color: white;">
        </div>
      </div>
      <button id='next'>변경</button>
    </form>
  </div>
</div>
<jsp:include page="/main/footer.jsp"/>
</body>
</html>