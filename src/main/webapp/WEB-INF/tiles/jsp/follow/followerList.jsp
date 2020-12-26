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
a { text-decoration: none; }
 body {
   background-color : #000000;
   color: #ffffff;
   margin: 0px;
    
 }
 
 p {
   font-size: 18px;
   xfont-weight: bold;
   margin:0px;
 }
 
 #contents {
   border-radius: 10px;
   background-color: #141517;
   width: 699px;  /* 너비 */
   padding: 40px;  /* 패딩 */
   float: left;  /* 왼쪽으로 플로팅 */
   height: 700px;
    overflow: hidden;
  overflow-y: scroll;
  -ms-overflow-style: none;
  scrollbar-width: none;
 }
 
 #contents::-webkit-scrollbar {
  display: none;
}
    
 .profile-icon { display: block; margin: 0px auto; }
 
 img.profile {
  border-radius: 100px;
 }
 
 #member{
 width : 599px;
 margin-left : 9px;
 margin-right : 9px;
 float: left;
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
 margin-bottom : 130px;
 }
 #profile-icon a {
 margin-top : 50px;
 margin-left : 91.8px;
 float: left;
 }
 
 /* 나를 팔로한 멤버 목록*/
 #follower-target-container {
 clear: both;
  margin-right : 9px;
  margin-left : 9px;  
 }
 
 .follower-target-row {
 clear: both;
  margin-bottom : 10px;  
  height : 50px;
 }
 
 .follower-target-img {
  margin-right : 10px;
  float:left;
  border-radius: 100px;
 }
 .follower-target-text {
 float: left;
 }
 .follower-target {
  float:left;
 }
 
 .follower-target-button {
  float:right;
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
      <a href="../follow/addUser?followedNo=${member.no}">팔로우</a>   
      <a href="../follow/deleteUser?followedNo=${member.no}">언팔로우</a>    
      <a href="../report/form?reportedNo=${member.no}">신고</a> 
    </div>
    
    <div id="profile-icon">
      <a href="<%=getServletContext().getContextPath()%>/app/member/profile?no=${member.no}"> 
        <img class=profile-icon  src="<%=getServletContext().getContextPath()%>/profile_resource/review-border.png" height=30px class="center" alt="리뷰">
          리뷰
          <%-- <c:out value="${member.numOfReviews}" ></c:out></span> --%>
      </a>
      <a href="<%=getServletContext().getContextPath()%>/app/follow/followerList?no=${member.no}"> 
        <img class=profile-icon  src="<%=getServletContext().getContextPath()%>/profile_resource/follower.png" height=30px class="center" alt="팔로워">
          팔로워 
      </a>
      <a href="<%=getServletContext().getContextPath()%>/app/follow/followingList?no=${member.no}"> 
        <img class=profile-icon  src="<%=getServletContext().getContextPath()%>/profile_resource/following-border.png" height=30px class="center" alt="팔로잉">
          팔로잉 
      </a>
      <a href="<%=getServletContext().getContextPath()%>/app/member/savedReviews?no=${member.no}"> 
        <img class=profile-icon  src="<%=getServletContext().getContextPath()%>/profile_resource/saved-border.png" height=30px class="center" alt="저장">
          저장 
      </a>
    </div>
       
    <div id="follower-target-container">
       <c:forEach items="${targetMemberlist}" var="m"> 
          <div class="follower-target-row">
              <a class="follower-target" href="<%=getServletContext().getContextPath()%>/app/member/profile?no=${m.no}">
                <input type='hidden' name='no' value='${m.no}'>
                    <img class="follower-target-img" src='../../upload/${m.photo}_35x35.jpg'>
                    <span class="follower-target-text">${m.nickName}<br>
                       ${m.intro}
                       </span>
              </a>
              <a class="follower-target-button" href="../follow/deleteUser?followedNo=${member.no}">언팔로우</a>
              <a class="follower-target-button" href="../follow/addUser?followedNo=${member.no}">팔로우</a>   
          </div>
       </c:forEach>
  
    </div>
   </div>
<script src="<%=getServletContext().getContextPath()%>/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>