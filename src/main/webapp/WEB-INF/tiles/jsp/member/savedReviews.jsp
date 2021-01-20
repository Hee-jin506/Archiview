<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="appRoot" value="${pageContext.servletContext.contextPath}" />
   
   <div id="profile_contents">
    <div id="profile_top">
      <input type='hidden' name='no' value='${member.no}'>
      <img class="profile150px" src='../../upload/${member.photo}_150x150.jpg'>
        <div id="profile_top_text">
           <div id="profile_top_text_nickName">${member.nickName}</div>
           <div id="profile_top_text_email">${member.email}</div>
           <div id="profile_top_text_intro">${member.intro}</div>
        </div>
        
     <div id="profile_icon_report">
        <c:choose>
          <c:when test="${member.no==sessionScope.loginUser.no}">
          </c:when>
          <c:when test="${member.no!=sessionScope.loginUser.no}">
		        <a class="report-form" href='${appRoot}/ajax/report/form?reportedNo=${member.no}'> 
		          <img class=profile_icon_report  src="${appRoot}/profile_resource/report.png" height=20px class="center" data-no='${member.no}'>
		        </a>
          </c:when>
        </c:choose>
    </div>
    
       <div class="follow">
	       <c:choose>
	       
	        <c:when test="${member.no==sessionScope.loginUser.no}">
	        </c:when>
	        
	        <c:when test="${member.no!=sessionScope.loginUser.no}">
		         <button 
			         class='firstButton ${isFollowedByLoginUser==true ? "btn btn-twitter" : "btn btn-archiview"}'

			         target-no='${member.no}'
			         target-type='${member.getClass().simpleName}'
			         follow='${isFollowedByLoginUser==true ? "following" : "notFollowing"}'>
			         팔로우
			        
		         </button>
		         
			    <div class="modal fade" id="unfollowModal${member.getClass().simpleName}${member.no}" tabindex="-1" 
	                    aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-body">
						      <div class = "modal-body-image">
						       <img class="profile" style = "height: 75px; cursor: auto;" src='../../upload/${member.photo}_150x150.jpg'>
						      </div>
					        <div class="modal-body-text">
					         ${member.nickName}님의 팔로우를 취소하시겠어요?</div>
					      </div>
					       <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아뇨</button>
                  <button type="button" 
                  class="btn btn-archiview unfollow" 
                  data-bs-dismiss="modal" 
                  target-no='${member.no}'
                  target-type='${member.getClass().simpleName}'>네</button>
					    </div>
					  </div>
					</div>
	        </c:when>
	       </c:choose>
       </div>
    </div>
    
    <div id="profile_icon">
      <a> 
        <img class="profile_icon reviewIcon" data-no = "${member.no}" src="${appRoot}/profile_resource/review-border.png" height=30px class="center" alt="리뷰">
          <span class="profile_icon_text">리뷰</span>
          <span class="profile_icon_number"><c:out value="${member.numOfReviews}" ></c:out></span>
      </a>
      <a> 
        <img class="profile_icon followerIcon" data-no = "${member.no}" src="${appRoot}/profile_resource/follower-border.png" height=30px class="center" alt="팔로워">
          <span class="profile_icon_text">팔로워</span> 
          <span class="profile_icon_number followerListSize">${followerListSize}</span>
      </a>
      <a> 
        <img class="profile_icon followingIcon" data-no = "${member.no}" src="${appRoot}/profile_resource/following-border.png" height=30px class="center" alt="팔로잉">
          <span class="profile_icon_text">팔로잉</span> 
           <span class="profile_icon_number"><c:out value="${followingListSize}" ></c:out></span>
      </a>
      <a> 
        <img class="profile_icon savedIcon" data-no = "${member.no}" src="${appRoot}/profile_resource/saved.png" height=30px class="center" alt="저장">
          <span class="profile_icon_text">저장</span> 
          <span class="profile_icon_number"><c:out value="${member.numOfSaved}" ></c:out></span>
      </a>
    </div>
    
     <div id = "profile_bottom">
       <c:if test="${empty member.saved}">
         <div id = "profile_bottom_null">
              <img alt="saved-null" src="${appRoot}/profile_resource/saved-null.png">
              <div style="margin-top:15px">
              다시 보고 싶은 리뷰를 저장하세요. <br>
              리뷰를 저장해도 다른 사람에게 알림이 전송되지 않으며, <br>
              저장된 리뷰는 회원님만 볼 수 있습니다. <br>
              </div>
         </div>
       </c:if>
       <c:if test="${!empty member.saved}">
        <c:forEach items="${member.saved}" var="rv"> 
            <c:choose>
              <c:when test="${empty rv.stcUrl}">
                <div class='profile_stillcut'>
                  <img class='profile_bottom_review stillcut' data-no='${rv.no}' src="${appRoot}/main_resource/null.png">
                  
                  <div class='reviewText_box'>
                    <div class='reviewText' style='top:${rv.textY}%; left:${rv.textX}%; '>
                     <p>${rv.text}</p>
                    </div>
                  </div>
                  <div class='tags'>
                    <c:forEach items="${rv.tags}" var="t">
                      <c:if test="${t.title != null }">
                        <a class='tag' href='${appRoot}/app/main/search?keyword=%23${t.title}'>
                          #${t.title}
                        </a>
                      </c:if>
                    </c:forEach>
                  </div>
                </div>
              </c:when>
              <c:otherwise>
               <div class='profile_stillcut'>
                 <img class='profile_bottom_review stillcut' data-no='${rv.no}'  src='${rv.stcUrl}' s>
                <div class='reviewText_box'>
                  <div class='profile_stillcut_reviewText' style='top:${rv.textY}%; left:${rv.textX}%;' >
                   <p style="font-size: 10px;  font-weight: bold;">${rv.text}</p>
                  </div>
                </div>
            
                <div class='profile_stillcut_tags' >
                  <c:forEach items="${rv.tags}" var="t">
                    <c:if test="${t.title != null }">
                      <a class='tag' href='${appRoot}/app/main/search?keyword=%23${t.title}'>
                        <p style="font-size: 10px;  font-weight: bold;">#${t.title}</p>
                      </a>
                    </c:if>
                  </c:forEach>
                </div>
               </div>
              </c:otherwise>
            </c:choose>
        </c:forEach>
        </c:if>
      </div>
      <span class='add-one'></span>
  </div>



