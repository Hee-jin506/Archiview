<%@page import="bitcamp.acv.domain.Follow"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head><title>회원 프로필 화면</title>
<link rel="stylesheet" 
      href="<%=getServletContext().getContextPath()%>/node_modules/bootstrap/dist/css/bootstrap.min.css?after">
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
 
    #contents {
      border-radius: 10px;
      background-color: #141517;
      width: 699px;  /* 너비 */
      padding: 40px;  /* 패딩 */
      float: left;  /* 왼쪽으로 플로팅 */
    }
    
 .profile-icon { display: block; margin: 0px auto; }
 
 img.profile {
  border-radius: 100px;
 }
 
 
 #member img {
 margin-right : 30px;
 float: left;
 }
 #member p {
 float: left;
 }
 
 #profile-icon {
 clear: both;
 margin-bottom : 50px;
 }
 #profile-icon a {
 margin-top : 50px;
 margin-left : 99.8px;
 float: left;
 }
 #reviews {
 clear: both;
 }
 
 #reviews img{
 float:left;
 margin-right : 10px;
 }
</style>

</head>
<body>

  <div id="contents">
		<div id="member">
			<input type='hidden' name='no' value='${member.no}'>
			<img class="profile" src='../../upload/${member.photo}_150x150.jpg'><br>
			<p>${member.nickName}<br>
			   ${member.email}<br><br>
         ${member.intro}</p>
		</div>
		
  <a href="../follow/addUser?followedNo=${member.no}">팔로우</a>   
  <a href="../follow/deleteUser?followedNo=${member.no}">언팔로우</a>    
  <a href='../report/form'>신고</a><br>
		<div id="profile-icon">
		  <a href="<%=getServletContext().getContextPath()%>/app/member/profile?no=${member.no}"> 
		    <img class=profile-icon  src="<%=getServletContext().getContextPath()%>/profile_resource/review.png" height=30px class="center" alt="리뷰">
		      리뷰<br>
		      <c:out value="${member.numOfReviews}"></c:out>
		  </a>
		  <a href="<%=getServletContext().getContextPath()%>/app/member/profile?no=${member.no}"> 
		    <img class=profile-icon  src="<%=getServletContext().getContextPath()%>/profile_resource/follower.png" height=30px class="center" alt="팔로워">
		      팔로워 
		  </a>
		  <a href="<%=getServletContext().getContextPath()%>/app/follow/followingList?no=${member.no}"> 
		    <img class=profile-icon  src="<%=getServletContext().getContextPath()%>/profile_resource/following.png" height=30px class="center" alt="팔로잉">
		      팔로잉 
		  </a>
		  <a href="<%=getServletContext().getContextPath()%>/app/member/savedReviews?no=${member.no}"> 
		    <img class=profile-icon  src="<%=getServletContext().getContextPath()%>/profile_resource/saved.png" height=30px class="center" alt="저장">
		      저장 
		  </a>
		</div>
		
			<div id = "reviews">
			<c:forEach items="${member.reviews}" var="rv"> 
			<input type='hidden' name='no' value='${rv.no}'>
			  <c:choose>
				  <c:when test="${empty rv.stcUrl}">
				    <img width="280px" src="<%=getServletContext().getContextPath()%>/main_resource/null.png">
				  </c:when>
				  <c:otherwise>
				   <img width="280px" src='${rv.stcUrl}'><br>
				  </c:otherwise>
			  </c:choose>
			</c:forEach>
			</div>
    </div>
<script src="<%=getServletContext().getContextPath()%>/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>