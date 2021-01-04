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
        <a class="report-form" href='<%=getServletContext().getContextPath()%>ajax/report/form?reportedNo=${member.no}'> 
        <img class=profile_icon_report  src="<%=getServletContext().getContextPath()%>/profile_resource/report.png" height=20px class="center" data-no='${member.no}'></a>
      </div>
        
        <form method="post">
          <c:choose>
           <c:when test="${member.no==sessionScope.loginUser.no}">
           </c:when>
           <c:when test="${isFollowedByLoginUser==true}">
             <button type="submit" formaction="../follow/deleteUser?followedNo=${member.no}" class="btn btn-twitter">팔로우
             </button>
           </c:when>
           <c:when test="${isFollowedByLoginUser==false}">
             <button type="submit" formaction="../follow/addUser?followedNo=${member.no}" class="btn btn-archiview">팔로우
             </button>
           </c:when>
          </c:choose>
        </form>
        
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
            
            <c:choose>
               <c:when test="${t.followingState==true}">
                 <form action="../follow/deleteTag">
                   <input type='hidden' name='followedNo' value='${t.no}'>
                   <button class="btn btn-twitter">팔로우</button>
                 </form>
               </c:when>
               <c:when test="${t.followingState==false}">
                 <form action="../follow/addTag">
                   <input type='hidden' name='followedNo' value='${t.no}'>
                   <button class="btn btn-archiview">팔로우</button>
                 </form>
               </c:when>
              </c:choose>
            
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
            
              <c:choose>
               <c:when test="${m.no==sessionScope.loginUser.no}">
               </c:when>
               <c:when test="${m.followingState==true}">
                 <form action="../follow/deleteUser">
                   <input type='hidden' name='followedNo' value='${m.no}'>
                   <button class="btn btn-twitter">팔로우</button>
                 </form>
               </c:when>
               <c:when test="${m.followingState==false}">
                 <form action="../follow/addUser">
                   <input type='hidden' name='followedNo' value='${m.no}'>
                   <button class="btn btn-archiview">팔로우</button>
                 </form>
               </c:when>
              </c:choose>
            
          </div>
       </c:forEach>
    </div>
   </div>
   
 <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
        <!-- 모달 화면 -->
      </div>
    </div>
  </div>
</div>
   
<script>
var el = document.querySelectorAll(".report-form");
var myModal = new bootstrap.Modal(document.getElementById('exampleModal'), {});
var exampleModal = document.querySelector("#exampleModal");
var exampleModalBody = exampleModal.querySelector(".modal-body");
var memberNo;

exampleModal.addEventListener('show.bs.modal', function (event) {
  console.log("show.bs.modal")
  var xhr = new XMLHttpRequest();
  xhr.open("GET", "../ajax/report/form?reportedNo=" + memberNo, false);
  xhr.send();
  exampleModalBody.innerHTML = xhr.responseText;
});

exampleModal.addEventListener('shown.bs.modal', function (event) {
  console.log("shown.bs.modal")
});

exampleModal.addEventListener('hidden.bs.modal', function (event) {
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
