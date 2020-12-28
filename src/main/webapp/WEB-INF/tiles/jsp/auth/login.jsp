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
</head>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<body style='background-color: black'>
<div class='box'>
    <img id='logo' src="<%=getServletContext().getContextPath()%>/Archiview_logo.png" alt="로고">
  <div id='intro'>
    당신의 감성을 담은<br>
    영화 후기를 만들어 보세요.
  </div>
  
  <div id="put">
    <form class="form-horizontal" method="post">
      <div class="form-group">
        <label for="email" class="col-sm-3 control-label">이메일 </label>
        <div class="col-sm-8">
          <input type="email" class="form-control" name="email" value=<%=request.getAttribute("email")%> autofocus required
          style="border:1px solid #6B6B6B; background-color: #000000; color: white;">
        </div>
      </div>
      <div class="form-group">
        <label for="password" class="col-sm-3 control-label">비밀번호</label>
        <div class="col-sm-8">
          <input type="password" class="form-control" name="password" autofocus required
          style="border:1px solid #6B6B6B; background-color: #000000; color: white;">
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-offset-3 col-sm-10">
          <div class="checkbox">
          <label>
            <input type="checkbox" name="saveEmail" checked> 이메일 저장
          </label>
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
    <a href="<%=getServletContext().getContextPath()%>/app/auth/searchPassword">비밀번호를 잊으셨나요?</a>
  </div>
  
  <div id='add'>
    계정이 없으신가요? <a href="<%=getServletContext().getContextPath()%>/app/auth/add">지금 가입하세요.</a>
  </div>
</div>
</body>
</html>