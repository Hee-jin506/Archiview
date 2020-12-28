<%@page import="bitcamp.acv.domain.Follow"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head><title>회원 프로필 화면</title>
<style>
a { text-decoration: none; }

 body {
   background-color : #000000;
   color: #ffffff;
   margin: 0px;
    
 }
 
 #contents {
   background-color: #141517;
   border-radius: 10px;
   
   float: left;
   
   box-sizing: border-box;
   width: 650px;  
   padding: 40px; 
   
   height: 700px;
   overflow: hidden;
   overflow-y: scroll;
   -ms-overflow-style: none;
   scrollbar-width: none;
 }
 
 #contents::-webkit-scrollbar {
  display: none;
 }

 /* 프로필 상단 */
 #profile_top{
 width : 550px;
 height : 150px;
 margin-right : 10px;
 margin-left : 10px;
 }
 #profile_top img {
 margin-right : 30px;
 float: left;
 }
 #profile_top_text {
 margin-top : 22px;
 float: left;
 }
 #profile_top_text_nickName {
 margin-bottom : 5px;
 font-size : 24px;
 font-weight : bold;
 }
 #profile_top_text_email {
 margin-bottom : 30px;
 font-size : 18px;
 }
 #profile_top_text_intro {
 font-size : 18px;
 }
 
 #profile_top button {
 margin-top : 14px;
 margin-right : 10px;
 float : right;
 
 }
 
 /* 아이콘 덩어리*/
 #profile_icon {
 width : 550px;
 margin-right : 10px;
 margin-left : 10px;
 height : 100.8px;
 clear: both;
 }
 #profile_icon a {
 margin-top : 48px;
 margin-left : 80px;
 float: left;
 }
 #profile_icon .profile_icon_text {
 font-size :15px;
 font-weight : normal;
 display : block;
 padding-top : 8px;
 }
 #profile_icon .profile_icon_number {
 display: block;
 }
 
 .profile_icon { 
   display: block; 
   margin: 0px auto; 
 }
 
 img.profile {
  border-radius: 100px;
 }
 
 
 /* 밑부분 */
 
 #profile_bottom {
 margin-top : 66px;
 clear: both;
 }
 #profile_bottom button{
 float : right;
 }
 
 .profile_bottom_row{
  clear: both;
  margin-bottom : 25px;  
  height : 50px;
 }
 
 
 .profile_bottom_object_image {
  float:left;
  margin-right : 15px;
  border-radius: 100px;
 }
 .profile_bottom_object_text {
 float: left;
 }
 .profile_bottom_object_text_nick {
 font-weight: bold;
 margin-bottom : 10px;
 }
 .profile_bottom_object_text_intro {
 font-weight: normal;
 font-size: 14px;
 color: #626473;
 }
 
 
</style>

</head>
<body>

  <div id="contents">
    <div id="profile_top">
      <input type='hidden' name='no' value='${member.no}'>
      <img class="profile" src='../../upload/${member.photo}_150x150.jpg'>
        <div id="profile_top_text">
           <div id="profile_top_text_nickName">${member.nickName}</div>
           <div id="profile_top_text_email">${member.email}</div>
           <div id="profile_top_text_intro">${member.intro}</div>
        </div>
        
        <form method="get">
          <c:choose>
           <c:when test="${member.no==sessionScope.loginUser.no}">
           </c:when>
           <c:when test="${following==true}">
             <button type="submit" formaction="../follow/deleteUser?followedNo=${member.no}" class="btn btn-twitter">팔로우
             </button>
           </c:when>
           <c:when test="${following==false}">
             <button type="submit" formaction="../follow/addUser?followedNo=${member.no}" class="btn btn-archiview">팔로우
             </button>
           </c:when>
          </c:choose>
        </form>
        
      <%-- <a href="../report/form?reportedNo=${member.no}">신고</a>  --%>
    </div>
    
    <div id="profile_icon">
      <a href="<%=getServletContext().getContextPath()%>/app/member/profile?no=${member.no}"> 
        <img class=profile_icon  src="<%=getServletContext().getContextPath()%>/profile_resource/review-border.png" height=30px class="center" alt="리뷰">
          <span class="profile_icon_text">리뷰</span>
          <%-- <span class="profile-icon-number"><span></span><c:out value="${member.numOfReviews}" ></c:out></span></span> --%>
      </a>
      <a href="<%=getServletContext().getContextPath()%>/app/follow/followerList?no=${member.no}"> 
        <img class=profile_icon  src="<%=getServletContext().getContextPath()%>/profile_resource/follower.png" height=30px class="center" alt="팔로워">
          <span class="profile_icon_text">팔로워</span> 
      </a>
      <a href="<%=getServletContext().getContextPath()%>/app/follow/followingList?no=${member.no}"> 
        <img class=profile_icon  src="<%=getServletContext().getContextPath()%>/profile_resource/following-border.png" height=30px class="center" alt="팔로잉">
          <span class="profile_icon_text">팔로잉</span> 
      </a>
      <a href="<%=getServletContext().getContextPath()%>/app/member/savedReviews?no=${member.no}"> 
        <img class=profile_icon  src="<%=getServletContext().getContextPath()%>/profile_resource/saved-border.png" height=30px class="center" alt="저장">
          <span class="profile_icon_text">저장</span> 
      </a>
    </div>
       
    <div id="profile_bottom">
       <c:forEach items="${targetMemberlist}" var="m"> 
          <div class="profile_bottom_row">
	          <div class="profile_bottom_object_image">
              <a href="<%=getServletContext().getContextPath()%>/app/member/profile?no=${m.no}">
                <img class = "profile" src='../../upload/${m.photo}_35x35.jpg'>
              </a>
            </div>
	          <div class="profile_bottom_object_text">
		          <div class="profile_bottom_object_text_nick">
              <a href="<%=getServletContext().getContextPath()%>/app/member/profile?no=${m.no}">
                ${m.nickName}
              </a>
	            </div>
		          <div class="profile_bottom_object_text_intro">
		            ${m.intro}
	            </div>
            </div>
            
			      <form method="get">
		          <c:choose>
		           <c:when test="${m.no==sessionScope.loginUser.no}">
		           </c:when>
		           <c:when test="${m.followingState==true}">
		             <button type="submit" formaction="../follow/deleteUser?followedNo=${m.no}" class="btn btn-twitter">팔로우
		             </button>
		           </c:when>
		           <c:when test="${m.followingState==false}">
		             <button type="submit" formaction="../follow/addUser?followedNo=${m.no}" class="btn btn-archiview">팔로우
		             </button>
		           </c:when>
		          </c:choose>
		        </form>
		        
          </div>
       </c:forEach>
    </div>
   </div>
</body>
</html>