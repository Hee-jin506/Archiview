<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head><title>회원 프로필 화면</title>
<style>
 body {
   background-color : #000000;
   color: #ffffff;
   margin: 0px;
 }
 
 p {
   font-size: 18px;
   font-weight: bold;
   margin:0px;
 }
 
 img.profile {
  border-radius: 100px;
 }
</style>
</head>
<body>

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


	<a href="<%=getServletContext().getContextPath()%>/app/member/profile?no=${member.no}"> 
	  <img src="<%=getServletContext().getContextPath()%>/profile_resource/review.png" alt="리뷰"><br>
	    리뷰 
	</a>
	<a href="<%=getServletContext().getContextPath()%>/app/member/profile?no=${member.no}"> 
	  <img src="<%=getServletContext().getContextPath()%>/profile_resource/follower.png" alt="팔로워"><br>
	    팔로워 
	</a>
	<a href="<%=getServletContext().getContextPath()%>/app/member/profile?no=${member.no}"> 
	  <img src="<%=getServletContext().getContextPath()%>/profile_resource/following.png" alt="팔로잉"><br>
	    팔로잉 
	</a>
	<a href="<%=getServletContext().getContextPath()%>/app/member/profileSavedReviews?no=${member.no}"> 
	  <img src="<%=getServletContext().getContextPath()%>/profile_resource/saved.png" alt="저장"><br>
	    저장 
	</a>
<br>
<c:forEach items="${member.saved}" var="rv"> 
<input type='hidden' name='no' value='${rv.no}'><br>
  ${rv.no}<br>
   <img src='${rv.stcUrl}'><br>
</c:forEach>
</body>
</html>
