<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="appRoot" value="${pageContext.servletContext.contextPath}" />

<c:if test="${targetTaglist == '[]' && targetMemberlist == '[]'}">
  <div id = "profile_bottom_null">
       <img alt="saved-null" src="${appRoot}/profile_resource/following-null.png">
       <div style="margin-top:15px">
       회원님이 팔로잉하는 모든 사람이 <br>
       여기에 표시됩니다. <br>
       </div>
  </div>
</c:if>

<c:if test="${targetTaglist != '[]' || targetMemberlist != '[]'}">
  <c:forEach items="${targetTaglist}" var="t"> 
          <div class="profile_bottom_row">
            <div class="profile_bottom_object_image">
              <a href="">
                <c:if test="${t.thumbnailstillCutUrl==null}">
                  <img class = "profile" src='${appRoot}/main_resource/null.png' width = 35px, height = 35px>
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
            
            <div class="follow">
                   <button 
                     class='firstButton ${t.followingState==true ? "btn btn-twitter" : "btn btn-archiview"}'
                     target-no='${t.no}'
                     target-type='${t.getClass().simpleName}'
                     follow='${t.followingState==true ? "following" : "notFollowing"}'>
                     팔로우
                   </button>
                   <div class="modal fade" id="unfollowModal${t.getClass().simpleName}${t.no}" tabindex="-1" 
                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-body">
                      <div class = "modal-body-image">
                       <img class="profile" src='${t.thumbnailstillCutUrl}'>
                      </div>
                      <div class="modal-body-text">
                       #${t.title}의 팔로우를 취소하시겠어요?</div>
                    </div>
                     <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아뇨</button>
                      <button type="button" 
                      class="btn btn-archiview unfollow" 
                      data-bs-dismiss="modal" 
                      target-no='${t.no}'
                      target-type='${t.getClass().simpleName}'}>네</button>
                  </div>
                </div>
               </div>
             </div>
             
             
            
          </div>
  </c:forEach>
  <c:forEach items="${targetMemberlist}" var="m"> 
          <div class="profile_bottom_row">
            <div class="profile_bottom_object_image">
              <a href="${appRoot}/app/member/profile?no=${m.no}">
                <img class = "profile" src='../../upload/${m.photo}_35x35.jpg'>
              </a>
            </div>
            <div class="profile_bottom_object_text">
              <div class="profile_bottom_object_text_nick">
              <a href="${appRoot}/app/member/profile?no=${m.no}">
                ${m.nickName}
              </a>
              </div>
              <div class="profile_bottom_object_text_intro">
                ${m.intro}
              </div>
            </div>
            
              <div class="follow">
               <c:choose>
               
                <c:when test="${m.no==sessionScope.loginUser.no}">
                </c:when>
                
                <c:when test="${m.no!=sessionScope.loginUser.no}">
                   <button 
                     class='firstButton ${m.followingState==true ? "btn btn-twitter" : "btn btn-archiview"}'
                     target-no='${m.no}'
                     target-type='${m.getClass().simpleName}'
                     follow='${m.followingState==true ? "following" : "notFollowing"}'>
                     팔로우
                   </button>
                </c:when>
                
               </c:choose>
               
               <div class="modal fade" id="unfollowModal${m.getClass().simpleName}${m.no}" tabindex="-1" 
                        aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-body">
                      <div class = "modal-body-image">
                       <img class="profile" src='../../upload/${m.photo}_150x150.jpg'>
                      </div>
                      <div class="modal-body-text">
                       ${m.nickName}님의 팔로우를 취소하시겠어요?</div>
                    </div>
                     <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아뇨</button>
                      <button type="button" 
                      class="btn btn-archiview unfollow" 
                      data-bs-dismiss="modal" 
                      target-no='${m.no}'
                      target-type='${m.getClass().simpleName}'}>네</button>
                  </div>
                </div>
               </div>
             </div>
            
          </div>
  </c:forEach>
</c:if>

<span class='add-one'></span>


