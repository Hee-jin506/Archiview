<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   
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
        <img class=profile_icon  src="<%=getServletContext().getContextPath()%>/profile_resource/review.png" height=30px class="center" alt="리뷰">
          <span class="profile_icon_text">리뷰</span>
          <%-- <span class="profile-icon-number"><span></span><c:out value="${member.numOfReviews}" ></c:out></span></span> --%>
      </a>
      <a href="<%=getServletContext().getContextPath()%>/app/follow/followerList?no=${member.no}"> 
        <img class=profile_icon  src="<%=getServletContext().getContextPath()%>/profile_resource/follower-border.png" height=30px class="center" alt="팔로워">
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
		
			<div id = "profile_bottom">
				<c:forEach items="${member.reviews}" var="rv"> 
				<input type='hidden' name='no' value='${rv.text}'>
				  <c:choose>
					  <c:when test="${empty rv.stcUrl}">
					    <img class='profile_bottom_review' src="<%=getServletContext().getContextPath()%>/main_resource/null.png">
					  </c:when>
					  <c:otherwise>
					   <img class='profile_bottom_review' src='${rv.stcUrl}'><br>
					  </c:otherwise>
				  </c:choose>
				</c:forEach>
			</div>
    </div>