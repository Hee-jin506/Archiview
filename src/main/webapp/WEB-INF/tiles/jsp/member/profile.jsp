
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
        <a class="report-form" href='<%=getServletContext().getContextPath()%>/ajax/report/form?reportedNo=${member.no}'> 
        <img class=profile_icon_report  src="<%=getServletContext().getContextPath()%>/profile_resource/report.png" height=20px class="center" data-no='${member.no}'></a>
    </div>
    
          <c:choose>
           <c:when test="${member.no==sessionScope.loginUser.no}">
           </c:when>
           <c:when test="${isFollowedByLoginUser==true}">
             <form action='../follow/deleteUser'>
		          <input type='hidden' name='followedNo' value='${member.no}'>
		          <button class="btn btn-twitter">팔로우</button>
            </form>
           </c:when>
           <c:when test="${isFollowedByLoginUser==false}">
           
           <form action='../follow/addUser'>
	          <input type='hidden' name='followedNo' value='${member.no}'>
	          <button class="btn btn-archiview">팔로우</button>
         </form>
           
           </c:when>
          </c:choose>
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