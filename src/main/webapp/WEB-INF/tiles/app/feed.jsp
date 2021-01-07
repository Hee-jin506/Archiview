<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id='cards'>

	<c:forEach items="${list}" var="r">
	  <div class='card'>
	    <div class='cardHeader'>
	      <a href='<%=getServletContext().getContextPath()%>/app/member/profile?no=${r.writerNo}'>
	        <img class='profile'
	        src='<%=getServletContext().getContextPath()%>/upload/${r.writerPhoto}_35x35.jpg'>
	      </a> 
	      <a class='nickname'
	        href='<%=getServletContext().getContextPath()%>/app/member/profile?no=${r.writerPhoto}'>
	        ${r.writerNick}
	      </a>
	      
	    <div class="follow">
	       <c:choose>
	        <c:when test="${r.writerNick==sessionScope.loginUser.nickName}">
	        </c:when>
	        <c:when test="${r.writerNick!=sessionScope.loginUser.nickName}">
	           <button 
	             class='${r.isFollowing != 0 ? "btn btn-twitter" : "btn btn-archiview"}'
	             target-no='${r.writerNo}'
	             target-type='Member'
	             follow='${r.isFollowing != 0  ? "following" : "notFollowing"}'>
	             팔로우
	           </button>
	        </c:when>
	       </c:choose>
	     </div>
	        
	     <div class="modal fade" id="unfollowModalMember${review.writerNo}" tabindex="-1" 
	                  aria-labelledby="exampleModalLabel" aria-hidden="true">
	         <div class="modal-dialog">
	           <div class="modal-content">
	             <div class="modal-header">
	               <h5 class="modal-title" id="exampleModalLabel">팔로우 취소</h5>
	               <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	             </div>
	             <div class="modal-body">
	               ${review.writerNick}님의 팔로우를 취소하시겠어요?
	             </div>
	             <div class="modal-footer">
	               <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아뇨</button>
	               <button type="button" 
	               class="btn btn-primary unfollow" 
	               data-bs-dismiss="modal" 
	               target-no='${review.writerNo}'
	               target-type='Member'}>네</button>
	             </div>
	           </div>
	         </div>
	       </div>
	      
	      <div class=moreIconBox>
		      <div class="dropdown1">
			      <button class='more' data-no='${r.no}'>
			        <img src='<%=getServletContext().getContextPath()%>/main_resource/more.png' >
			      </button>
		        <div class="dropdown-content1" data-no='${r.no}'>
		        <c:if test='${r.writerNick==loginUser.nickName}'>
		          <a href="#">수정</a>
		          <hr style="margin: 0px;">
		          <a href="<%=getServletContext().getContextPath()%>/app/review/delete?no=${r.no}" style="color: #f21b9c">삭제</a>
		        </c:if>
		        <c:if test='${r.writerNick!=loginUser.nickName}'>
		          <a herf="#">신고</a>
		        </c:if>
		        </div>
		      </div>
	      </div>
	    </div>
	    
	    <div class='stillcut' data-no='${r.no}'>
		    <c:if test="${r.stcUrl != null}">
		      <img src='${r.stcUrl}' data-no='${r.no}'>
		    </c:if>
	      <c:if test="${r.stcUrl == null}">
	        <div class='no-stillcut'>
	        </div>
	      </c:if>
	      <div class='reviewText_box'>
	          <span class='reviewText' style='top:${r.textY}%; left:${r.textX}%;'>${r.text}
	          </span>
	      </div>
	      <div class='tags'>
		      <c:forEach items="${r.tags}" var="t">
		        <c:if test="${t.title != null }">
			        <a class='tag'
			          href='<%=getServletContext().getContextPath()%>/app/main/search?keyword=%23${t.title}'>
			          #${t.title}
			        </a>
		        </c:if>
		      </c:forEach>
	      </div>
	    </div>
	
	    <div class='cardFooter'>
	      <a class='movie'>${r.movieTitle}</a>
	      <p class='rdt'>${r.rdtFromNow}</p>
	      <div class='like'>
	          <img
		          src='<%=getServletContext().getContextPath()%>/main_resource/${r.isLiking != 0? "like2.png" : "like.png"}'
		          alt='좋아요'
		          data-no='${r.no}' 
		          like='${r.isLiking != 0? "liking" : "notLiking"}'>
	         <span class='pop' data-no='${r.no}'>${r.liking}개</span>
	      </div>
	    </div>
		  <div class='reviewDetail'>
		   <button></button>
		  </div>
	  </div>
	</c:forEach>

</div>
  
