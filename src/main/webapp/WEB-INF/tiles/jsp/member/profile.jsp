<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>회원 프로필 화면</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
a {
	text-decoration: none;
}

body {
	background-color: #000000;
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
#member {
	box-sizing: border-box;
	width: 570px;
	height: 150px;
	margin-left: 10px;
	margin-right: 10px;
	xfloat: left;
}

#member img {
	margin-right: 30px;
	float: left;
}

#member-text {
	margin-top: 22px;
	float: left;
}

#member-text-nickName {
	margin-bottom: 5px;
	font-size: 24px;
	font-weight: bold;
}

#member-text-email {
	margin-bottom: 30px;
	font-size: 18px;
}

#member-text-intro {
	font-size: 18px;
}

.profile-icon {
	display: block;
	margin: 0px auto;
}

img.profile {
	border-radius: 100px;
}

#profile-icon {
	clear: both;
	margin-bottom: 130px;
}

#profile-icon a {
	margin-top: 50px;
	margin-left: 91.8px;
	float: left;
}

#profile-icon .profile-icon-text {
	display: block;
	padding-top: 3px;
}

#profile-icon .profile-icon-number {
	display: block;
}

#reviews {
	margin-top: 50px;
	clear: both;
}

#reviews img {
	float: left;
	margin-top: 18px;
	margin-right: 10px;
	margin-left: 10px;
}
</style>

</head>
<body>

	<div id="contents">
		<div id="member">
			<input type='hidden' name='no' value='${member.no}'> <img
				class="profile" src='../../upload/${member.photo}_150x150.jpg'>
			<div id="member-text">
				<div id="member-text-nickName">${member.nickName}</div>
				<div id="member-text-email">${member.email}</div>
				<div id="member-text-intro">${member.intro}</div>
			</div>
			<c:choose>
				<c:when test="${member.no==sessionScope.loginUser.no}">
					<button class="btn btn-archiview">팔로우</button>
				</c:when>
				<c:when test=""></c:when>
				<c:when test=""></c:when>
			</c:choose>
			<button class="btn btn-twitter">팔로우</button>
			<a href="../follow/addUser?followedNo=${member.no}">팔로우</a>
			<a href="../follow/deleteUser?followedNo=${member.no}">언팔로우</a>
			
			<a href="../report/form?reportedNo=${member.no}">신고</a>
		</div>

		<div id="profile-icon">
			<a
				href="<%=getServletContext().getContextPath()%>/app/member/profile?no=${member.no}">
				<img class=profile-icon
				src="<%=getServletContext().getContextPath()%>/profile_resource/review.png"
				height=30px class="center" alt="리뷰"> <span
				class="profile-icon-text">리뷰</span> <%-- <span class="profile-icon-number"><span></span><c:out value="${member.numOfReviews}" ></c:out></span></span> --%>
			</a> <a
				href="<%=getServletContext().getContextPath()%>/app/follow/followerList?no=${member.no}">
				<img class=profile-icon
				src="<%=getServletContext().getContextPath()%>/profile_resource/follower-border.png"
				height=30px class="center" alt="팔로워"> <span
				class="profile-icon-text">팔로워</span>
			</a> <a
				href="<%=getServletContext().getContextPath()%>/app/follow/followingList?no=${member.no}">
				<img class=profile-icon
				src="<%=getServletContext().getContextPath()%>/profile_resource/following-border.png"
				height=30px class="center" alt="팔로잉"> <span
				class="profile-icon-text">팔로잉</span>
			</a> <a
				href="<%=getServletContext().getContextPath()%>/app/member/savedReviews?no=${member.no}">
				<img class=profile-icon
				src="<%=getServletContext().getContextPath()%>/profile_resource/saved-border.png"
				height=30px class="center" alt="저장"> <span
				class="profile-icon-text">저장</span>
			</a>
		</div>

		<div id="reviews">
			<c:forEach items="${member.reviews}" var="rv">
				<input type='hidden' name='no' value='${rv.text}'>
				<c:choose>
					<c:when test="${empty rv.stcUrl}">
						<img width="289.5x" height="160px"
							src="<%=getServletContext().getContextPath()%>/main_resource/null.png">
					</c:when>
					<c:otherwise>
						<img width="289.5px" height="160px" src='${rv.stcUrl}'>
						<br>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
	</div>
</body>
</html>