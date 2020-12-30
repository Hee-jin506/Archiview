<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   <div id="profile_contents">
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
        <img class=profile_icon  src="<%=getServletContext().getContextPath()%>/profile_resource/follower-border.png" height=30px class="center" alt="팔로워">
          <span class="profile_icon_text">팔로워</span> 
      </a>
      <a href="<%=getServletContext().getContextPath()%>/app/follow/followingList?no=${member.no}"> 
        <img class=profile_icon  src="<%=getServletContext().getContextPath()%>/profile_resource/following.png" height=30px class="center" alt="팔로잉">
          <span class="profile_icon_text">팔로잉</span> 
      </a>
      <a href="<%=getServletContext().getContextPath()%>/app/member/savedReviews?no=${member.no}"> 
        <img class=profile_icon  src="<%=getServletContext().getContextPath()%>/profile_resource/saved-border.png" height=30px class="center" alt="저장">
          <span class="profile_icon_text">저장</span> 
      </a>
    </div>
    
    
      <div id="profile_bottom">
        <c:forEach items="${targetTaglist}" var="t"> 
          <div class="profile_bottom_row">
            <div class="profile_bottom_object_image">
              <a href="">
	              <c:if test="${t.thumbnailstillCutUrl==null}">
	                <img class = "profile" src='<%=getServletContext().getContextPath()%>/main_resource/null.png' width = 35px, height = 35px>
	              </c:if>
	              <c:if test="${t.thumbnailstillCutUrl!=null}">
	                <img class = "profile" src='${t.thumbnailstillCutUrl}' width = 35px, height = 35px>
	              </c:if>
              </a>
            </div>
            <div class="profile_bottom_object_text">
              <div class="profile_bottom_object_text_nick">
              <a href="">
                #${t.title}
              </a>
              </div>
              <div class="profile_bottom_object_text_intro">
                리뷰 ${t.numOfReviews}개
              </div>
            </div>
            
            <form method="get">
                 <button type="submit" formaction="../follow/deleteUser?followedNo=${m.no}" class="btn btn-twitter">팔로우
                 </button>
            </form>
            
          </div>
       </c:forEach>
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
                 <button type="submit" formaction="../follow/deleteUser?followedNo=${m.no}" class="btn btn-twitter">팔로우
                 </button>
            </form>
            
          </div>
       </c:forEach>
    </div>
   </div>
