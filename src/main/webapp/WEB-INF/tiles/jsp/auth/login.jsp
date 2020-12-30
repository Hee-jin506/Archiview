<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="appRoot" value="${pageContext.servletContext.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.box {
position: relative;
margin-top: 50px;
left: 50%;
margin-left: -200px;
width: 400px;
height: 600px;
color: white;
}

#logo {
display: block;
margin: 0px auto;
}

#intro {
text-align: center;
font-size: 30px; font-weight: bold;
}

#put {
position: relative;
display: block;
margin: 40px auto;
}

#next {
border-radius: 3px;
border: 1px solid #6B6B6B;
background: #000000;
padding: 5px;
text-align: center;
color: white;
width: 60px; height: 35px;
margin-left: 170px;
}
  
#next:hover {
background: #626473;
  box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset, 0 0 8px rgba(255, 255, 255, 0.6);
  outline: 0 none;
color: #F21BC9;
}

#search, #add {
display: block;
margin-top: 20px;
border-top: 1px solid #6B6B6B;
text-align: center;
text-decoration: none;
margin: 0 auto;
padding-top: 12px;
width: 300px;
height: 50px;
}
</style>
<link rel="stylesheet" href="${appRoot}/css/bootstrap/dist/css/custom.css">
</head>

<body style='background-color: black'>
<div class='box'>
    <img id='logo' src="<%=getServletContext().getContextPath()%>/Archiview_logo.png" alt="로고">
  <div id='intro'>
    당신의 감성을 담은<br>
    영화 후기를 만들어 보세요.
  </div>
  
  <div id="put">
    <form method="post">
      <div class="mb-2 row">
        <label for="email" class="col-sm-2 col-form-label">이메일 </label>
        <div class="col-sm-7">
          <input type="email" class="form-control form-control-sm" name="email" value=<%=request.getAttribute("email")%> autofocus required>
        </div>
      </div>
      <div class="mb-2 row">
        <label for="password" class="col-sm-2 col-form-label">비밀번호</label>
        <div class="col-sm-7">
          <input type="password" class="form-control form-control-sm" name="password" autofocus required>
        </div>
      </div>
      <div class="mb-3 row">
        <div class="col-sm-10 offset-sm-3">
          <div class="form-check">
            <input class="form-check-input" type="checkbox" name="saveEmail" id='saveEmail' checked>
            <label class="form-check-label" for="saveEmail">이메일 저장</label>
          </div>
        </div>
      </div>
      <%
      if (((Boolean) request.getAttribute("wrongInput")) == true) {
      %>
      <p>가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.</p>
      <%
      } else if (((Boolean) request.getAttribute("withdrawedMember")) == true) {
      %>
      <p>이미 탈퇴한 회원입니다. 새로 가입해주세요.</p>
      <%
      }
      %>
      <button id='next'>로그인</button>
    </form>
  </div>
  
  <div id='search'>
    <a href="<%=getServletContext().getContextPath()%>/app/auth/searchPassword" style="color: white;">비밀번호를 잊으셨나요?</a>
  </div>
  
  <div id='add'>
    계정이 없으신가요? <a href="<%=getServletContext().getContextPath()%>/app/auth/add" style="color: white;">지금 가입하세요.</a>
  </div>
</div>
</body>
</html>