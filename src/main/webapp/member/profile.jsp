<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head><title>회원 프로필 화면</title>
<style>body {background-color: #000000;color: #ffffff;}</style>
</head>
<body>
<jsp:include page="/app/main/topbar"/>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<input type='hidden' name='no' value='${member.no}'><br>
<img src='../../upload/${member.photo}_150x150.jpg'><br>
${member.nickName}<br>
${member.email}<br>
${member.intro}<br>

<%-- <c:set var='status' value='${member.status}'/>
<c:choose>
  <c:when test='${member.status == 1}'>
    <a href='inactive?no=${member.no}'>[팔로우]</a>
    </c:when>
  <c:when test='${member.status == 2}'>
    <a href='active?no=${member.no}'>[언팔로우]</a>
    </c:when>
</c:choose> --%>
리뷰 팔로워 팔로잉 저장<br>
<c:forEach items="${member.reviews}" var="rv"> 
<input type='hidden' name='no' value='${rv.no}'><br>
  ${rv.no}<br>
   <img src='${rv.stillCutUrl}'><br>
</c:forEach>

<jsp:include page="/main/footer.jsp"/>
</body>
</html>
