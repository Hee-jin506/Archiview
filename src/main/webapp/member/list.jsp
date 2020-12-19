<%@page import="bitcamp.acv.domain.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head><title>회원 관리 화면</title>
<style>


  * {
    margin: 0; padding: 0;
  }
 
  html {
    background-color: #000000;
    color: #ffffff;
    }
    
  body {
  position: absolute;
  /* top: 100%; */
  margin: 0 auto;
  left: 10%;
  width: 960px;
  }
  
  #bar1 {
  background-color: #141517;
  font-size: x-small;
  font-style: normal;
  color: #ffffff;
  text-align: left;
    
  }
  
  #check {
  width: 1%;
  }
  
  #memberno {
  width: 5%;
  }
  
  #membername {
  width: 19%;
  }
  
  #email {
  width: 5%;
  }
  
  #rdt {
  width: 8%;
  }
  
  #stat {
  width: 5%;
  }
  
  #members * {
  color: white;
  font-size:xx-small;
  text-decoration: none;
  }
  
  #active {
  position: absolute;
  border-radius: 3px;
  border: 1px solid #6B6B6B;
  background: #000000;
  padding: 5px;
  text-align: center;
  color: white;
  }
  
  #active:hover {
  background: #626473;
  color: blue;
  }
  
  #delete {
  position: absolute;
  border-radius: 3px;
  border: 1px solid #6B6B6B;
  background: #000000;
  padding: 5px;
  text-align: center;
  color: white;
  }
  
  #delete:hover {
  background: #626473;
  color: red;
  }
  
  #search-box {
  position: absolute;
  border-radius: 3px;
  border: 1px solid #6B6B6B;
  background: #000000;
  left: 38%;
  top: 0%;
  }
  
  #search-txt {
  border: none;
  color: white;
  background-color: #000000;
  font-size: x-small;
  
  }
  
  #search-btn {
  border: 0px;
  background-color: #000000;
  }
  
  #search-txt::-webkit-input-placeholder {
  text-align: center;
  }
  
  #memberAll {
  position: absolute;
  left: 85%;
  top: 0%;
  font-size: xx-small;
  }
  
  #refresh {
  display: inline-block;
  color: white;
  font-size: xx-small;
  margin-top: 15px;
  text-decoration: none; 
  font-size: small;
  }
  
  #check-type {
  margin: 0 auto;
  width: 200px;
  }
  
  
</style>
</head>
<body>

<!-- <jsp:include page="/main/admin-topbar.jsp"></jsp:include> -->

<img src='../../admin_resource/movie.png' width='18'> 회원 관리<br>
<%
String keyword = request.getParameter("keyword");
String email = request.getParameter("email");
String no = request.getParameter("no");
String nickName = request.getParameter("nickName");
%>

<form action='list' method='get'>
<div id='search-box'>
    <input id='search-txt' type='text' placeholder='    검색' name='keyword' value='<%=keyword != null ? keyword : ""%>'>
    <button id='search-btn'><img src='../../admin_resource/search.png' width='15'></button> 
</div>
<div id='check-type'>
    <br><input id='search-no' type='checkbox' name='no' value='no' <%=no != null ? "checked" : ""%>>번호
    <input id='seaech-email' type='checkbox' name='email' value='tt' <%=email != null ? "checked" : ""%>>이메일
    <input id='seaech-nickName' type='checkbox' name='nickName' value='tt' <%=email != null ? "checked" : ""%>>닉네임  
    </div>    
</form>

<%
List<Member> list = (List<Member>) request.getAttribute("list");
%>

<div id='memberAll'>
총 멤버 수 : <%=list.size()%>
</div>

<a href='list' id='refresh' style=""><img src='../../admin_resource/refresh.png' width='15'>  새로고침</a><br>

<form action='multipleDelete' method='get'>
<table border="1">
<thead>
<tr>
<th></th>
<th>회원 번호</th>
<th>권한</th>
<th>이름</th>
<th>로그인 유형 번호</th>
<th>이메일</th>
<th>별명</th>
<th>소개글</th>
<th>회원 가입일</th>
<th>회원 상태</th>
<th>회원 상태 변경일</th>
</tr></thead>

<tbody>
<c:forEach items="${list}" var="m"> 
<tr id="members">
<td><input type='checkbox' name='members' value='${m.no}'></td>
<td>${m.no}</td>
<td>${m.authority}</td>
<td><a href='detail?no=${m.no}'>${m.name}</a></td>
<td>${m.loginNo}</td>
<td>${m.email}</td>
<td>${m.nickName}</td>
<td>${m.intro}</td>
<td>${m.registeredDate}</td>
<td>${m.statusTitle}</td>
<td>${m.statusModifiedDate}</td>
</tr>
</c:forEach>
</tbody>
</table>
<br>
  <button id='delete' formaction="multipleDelete"><img src='../../admin_resource/minus.png' width="13"> 삭제</button><br><br>
  <button id='active' formaction="multipleActive"><img src='../../admin_resource/minus.png' width="13"> 복구</button>
<button>정지</button>
</form>

</body>
</html>
