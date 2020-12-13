<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head><title>회원 상세 조회</title>
<style>body {background-color: #000000;color: #ffffff;}</style>
</head>
<body>

<jsp:include page="/main/admin-topbar.jsp"></jsp:include>

<h1>[회원 상세 조회]</h1>
<br>
<input type='hidden' name='no' value='${member.no}'><br>
사진 : <img src='../../upload/${member.photo}_150x150.jpg'><br>
번호 : ${member.no}<br>
이름 : ${member.name}<br>
이메일 : ${member.email}<br>
닉네임 : ${member.nickName}<br>
소개 : ${member.intro}<br>
회원 가입일 : ${member.registeredDate}<br>
회원 상태 : ${member.statusTitle}<br>
회원 상태 변경일 : ${member.statusModifiedDate}<br>

<br>
<c:set var='status' value='${member.status}'/>
<c:choose>
  <c:when test='${member.status == 1}'>
    <a href='inactive?no=${member.no}'>[비활성화]</a>
    </c:when>
  <c:when test='${member.status == 2}'>
    <a href='active?no=${member.no}'>[활성화]</a>
    </c:when>
  <c:otherwise>
  탈퇴
  </c:otherwise>
</c:choose>

</body>
</html>
