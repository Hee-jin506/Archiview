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
        
     <div id="profile_icon_report">
        <c:choose>
          <c:when test="${member.no==sessionScope.loginUser.no}">
          </c:when>
          <c:when test="${member.no!=sessionScope.loginUser.no}">
		        <a class="report-form" href='<%=getServletContext().getContextPath()%>/ajax/report/form?reportedNo=${member.no}'> 
		          <img class=profile_icon_report  src="<%=getServletContext().getContextPath()%>/profile_resource/report.png" height=20px class="center" data-no='${member.no}'>
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
			         class='${isFollowedByLoginUser==true ? "btn btn-twitter" : "btn btn-archiview"}'

			         target-no='${member.no}'
			         target-type='${member.getClass().simpleName}'
			         follow='${isFollowedByLoginUser==true ? "following" : "notFollowing"}'>
			         팔로우
			        
		         </button>
		         
			    <div class="modal fade" id="unfollowModal${member.getClass().simpleName}${member.no}" tabindex="-1" 
	                   aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-body">
						      <div class = "modal-body-image">
						       <img class="profile" src='../../upload/${member.photo}_150x150.jpg'>
						      </div>
					        <div class="modal-body-text">
					         ${member.nickName}님의 팔로우를 취소하시겠어요?</div>
					      </div>
					       <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아뇨</button>
                  <button type="button" 
                  class="btn btn-primary unfollow" 
                  data-bs-dismiss="modal" 
                  target-no='${member.no}'
                  target-type='${member.getClass().simpleName}'}>네</button>
					    </div>
					  </div>
					</div>
	        </c:when>
	       </c:choose>
       </div>
    </div>
    
    <div id="profile_icon">
      <a href="<%=getServletContext().getContextPath()%>/app/member/profile?no=${member.no}"> 
        <img class=profile_icon  src="<%=getServletContext().getContextPath()%>/profile_resource/review.png" height=30px class="center" alt="리뷰">
          <span class="profile_icon_text">리뷰</span>
          <span class="profile_icon_number"><c:out value="${member.numOfReviews}" ></c:out></span>
      </a>
      <a href="<%=getServletContext().getContextPath()%>/app/member/followerList?no=${member.no}"> 
        <img class=profile_icon  src="<%=getServletContext().getContextPath()%>/profile_resource/follower-border.png" height=30px class="center" alt="팔로워">
          <span class="profile_icon_text">팔로워</span> 
          <span class="profile_icon_number followerListSize">${followerListSize}</span>
      </a>
      <a href="<%=getServletContext().getContextPath()%>/app/member/followingList?no=${member.no}"> 
        <img class=profile_icon  src="<%=getServletContext().getContextPath()%>/profile_resource/following-border.png" height=30px class="center" alt="팔로잉">
          <span class="profile_icon_text">팔로잉</span> 
          <span class="profile_icon_number"><c:out value="${followingListSize}" ></c:out></span>
      </a>
      <a href="<%=getServletContext().getContextPath()%>/app/member/savedReviews?no=${member.no}"> 
        <img class=profile_icon  src="<%=getServletContext().getContextPath()%>/profile_resource/saved-border.png" height=30px class="center" alt="저장">
          <span class="profile_icon_text">저장</span> 
          <span class="profile_icon_number"><c:out value="${member.numOfSaved}" ></c:out></span>
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
            <img class='profile_bottom_review' src='${rv.stcUrl}'>
           </c:otherwise>
         </c:choose>
       </c:forEach>
     </div>
  </div>
    
<div class="modal fade" id ="reportModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div id="report-close">
        <button type="button" class="btn-close" aria-label="Close" data-bs-dismiss="modal"
        style="position: absolute;
         top: 20px;
         right: 30px;"></button>
      <div class="modal-body">
        <!-- 모달 화면 -->
        </div>
      </div>
    </div>
  </div>
</div>


<script>
var el = document.querySelectorAll(".report-form");
var myModal = new bootstrap.Modal(document.getElementById('reportModal'), {});
var reportModal = document.querySelector("#reportModal");
var exampleModalBody = reportModal.querySelector("#reportModal .modal-body");
var memberNo;

reportModal.addEventListener('show.bs.modal', function (event) {
  console.log("show.bs.modal")
  $(".modal-body").load("../ajax/report/form?reportedNo=" + memberNo);
  
});
reportModal.addEventListener('shown.bs.modal', function (event) {
  console.log("shown.bs.modal")
});
reportModal.addEventListener('hidden.bs.modal', function (event) {
  console.log("hidden.bs.modal 종료")
});  
for (var e of el) {
  e.onclick = function(e) {
    e.preventDefault();
    memberNo = e.target.getAttribute("data-no");
    console.log("click");
    myModal.show();
  };
}
</script>