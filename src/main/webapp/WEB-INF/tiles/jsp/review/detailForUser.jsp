<%@page import="bitcamp.acv.domain.Comment"%>
<%@page import="bitcamp.acv.domain.Member"%>
<%@page import="bitcamp.acv.domain.Tag"%>
<%@page import="java.util.List"%>
<%@page import="bitcamp.acv.domain.Review"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<c:set var="appRoot" value="${pageContext.servletContext.contextPath}"/>

<div id='cardDetail'>
  <div id='cardPart'>
    <div class='cardHeader'>
      <div class='movie'>${review.movieTitle}.archiview</div>
      <img class='cardHeader_more' src='${appRoot}/main_resource/more.png'>
    </div>
    
    <div class='stillcut'>
    
      <c:if test="${not empty review.stcUrl}">
        <img src='${review.stcUrl}'>
      </c:if>
      
      <div class='reviewText' style='top:${review.textY}; left:${review.textX}%;'>
        <p>
          ${review.text}
        </p>
      </div>

      <div class='tags'>
        <c:forEach items="${review.tags}" var="t">
          <c:if test="${not empty t.title}">
	          <a class='tag'
		          href='${appRoot}/app/main/search?keyword=%23${t.title}'>
		          #${t.title}
	          </a>
          </c:if>
        </c:forEach>
      </div>
    </div>

    <div class='cardFooter'>
      <a
        href='${appRoot}/app/member/profile?no=${loginUser.no}'>
        <img class='profile'
        src='${appRoot}/upload/${review.writerPhoto}_35x35.jpg'>
      </a> 
      <a class='nickname'
        href='${appRoot}/app/member/profile?no=${loginUser.no}'>
        ${review.writerNick}
      </a>
      
      <div class="follow">
         <c:choose>
          <c:when test="${review.writerNick==sessionScope.loginUser.nickName}">
          </c:when>
          <c:when test="${review.writerNick!=sessionScope.loginUser.nickName}">
             <button 
               class='${review.isFollowing != 0 ? "btn btn-twitter" : "btn btn-archiview"}'
               target-no='${review.writerNo}'
               target-type='Member'
               follow='${review.isFollowing != 0  ? "following" : "notFollowing"}'>
               팔로우
             </button>
          </c:when>
         </c:choose>
         
         <div class="modal fade" id="unfollowModaldMember${review.writerNo}" tabindex="-1" 
                      aria-hidden="true" >
            <div class="modal-dialog">
              <div class="modal-content" style=
	              "background-color: #141517;
		             padding: 50px;">
                <div class="modal-body">
                  <div class = "modal-body-image">
                   <img class="profile" src='${appRoot}/upload/${review.writerPhoto}_150x150.jpg'
                   style="width: 75px;">
                  </div>
                  <div class="modal-body-text">
                   ${review.writerNick}님의 팔로우를 취소하시겠어요?</div>
                </div>
                 <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아뇨</button>
                  <button type="button" 
                  class="btn btn-primary unfollow" 
                  data-bs-dismiss="modal" 
                  target-no='${review.writerNo}'
                  target-type='Member'>네</button>
              </div>
            </div>
          </div>
       </div>
      
      
      <%-- 
      <c:if test="${review.writerNick != loginUser.nickName}">
	      <c:choose>
	        <c:when test="${review.isFollowing != 0}">
	          <div class='follow'>
			        <form>
			          <button class="btn btn-twitter">팔로우</button>
			        </form>
			      </div>
	        </c:when>
	        <c:when test="${review.isFollowing == 0}">
	          <div class='follow'>
			        <form>
			          <button class="btn btn-archiview">팔로우</button>
			        </form>
			      </div>
	        </c:when>
	      </c:choose>
      </c:if> --%>

      <p class='rdt'>${review.rdtFromNow}</p>
      <c:if test="${review.isLiking != 0 }">
	      <div class='like'>
	        <a
	          href='${appRoot}/app/like/dislikeReview?likedNo=${review.no}'>
	          <img
	          src='${appRoot}/main_resource/like2.png'
	          alt='좋아요'>
	        </a> 
	        <span class='pop'>
	         ${review.liking}개
	        </span>
	      </div>
      </c:if>
	      <div class='like'>
	      
	        <img
	        src='${appRoot}/main_resource/comment.png'
	        alt='댓글 보기'>
	
	        <img
	        src='${appRoot}/main_resource/like.png'
	        alt='좋아요'>
	        
	        <span class = 'save'>
	          <img
	          src='${appRoot}/main_resource/${review.isSaving != 0? "saved.png" : "saved-outline.png"}'
	          alt='저장'
            data-no='${review.no}' 
            save='${review.isSaving != 0? "saving" : "notSaving"}'>
	        </span>
	        
	        <img
	        src='${appRoot}/main_resource/info-circle.png'
	        alt='영화 상세'>
	
	      </div>
    </div>
  </div>


	<div class='comments'>
		<div class='commentsBody'>
		
				<c:set var="count" value="0"/>
				
				<script>
				var comments = new Array();
				var count= 0;
				</script>
				
			    <!-- ${c.level}=2이면 margin-left를 준다-->
				  <c:forEach items="${view}" var="c"> 
				    <div class="commentRow_${c.level}">
					    <c:choose>
					      <c:when test='${c.status == 1}'>
					        <div class='commentRow_profileImage'>
					          <img class='profile' src='${appRoot}/upload/${c.member.photo}_35x35.jpg'>
					        </div>
					        <div class='commentRow_body'>
						        <div class='commentRow_nickName'>
								     ${c.member.nickName} 
								    </div>
						        <div class='commentRow_content'>
	                   ${c.content}
	                  </div>
						        <div class='commentRow_bottom'>
						        <c:set var = "cno" value = "${c.no}"/>
		                 ${c.rdtFromNow}
									    <c:choose>
										    <c:when test='${c.level == 1}'>
										      <!-- 대댓글 -->
									        <input type='hidden' name='targetNo' value='${c.no}'>
									        <input type='hidden' name='groupNo' value='${c.groupNo}'>
									        <input type='hidden' name='level' value='${c.level}'>
									        <button class='level-2 btn btn-outline-secondary' data-no='${count}' type="button" >답글 달기</button>
									        
									        <c:set var="count" value="${count+1}"/>
									        
									        <script>
									        comments[count] = {
									        		targetNo: ${c.no},
									        		writer: "${c.member.nickName}"
									        };
									        
									        count++;
									        </script>
									        
									        <c:if test="${c.member.no==sessionScope.loginUser.no}">
											      <form action="../../comment/delete" method="post">
											        <input type='hidden' name='no' value='${c.no}'>
											        <input type='hidden' name='reviewNo' value=<%=request.getParameter("reviewNo")%>>
											        <button type="button" class="btn btn-outline-danger">삭제</button>
											      </form>
									        </c:if>
										    </c:when>
										    <c:otherwise>
											    <!-- 댓글 -->
											    <c:if test="${c.member.no==sessionScope.loginUser.no}">
											      <form action="../../delete" method="post">
											        <input type='hidden' name='no' value='${c.no}'>
											        <input type='hidden' name='reviewNo' value=<%=request.getParameter("reviewNo")%>>
											        <button type="button" class="btn btn-outline-danger">삭제</button>
											      </form>
										      </c:if>
										    </c:otherwise>
										  </c:choose>
									  </div>
								  </div>
										  <img class='commentRow_more' src='${appRoot}/main_resource/more.png' alt='more'>
										  <img class='commentRow_like' src='${appRoot}/main_resource/like.png' alt='좋아요'>
							  </c:when>
							<c:otherwise>
						   	 삭제된 코멘트입니다.
						  </c:otherwise>
						</c:choose>
				  </div>
				</c:forEach>
				
		</div>


		<div class='commentsFooter'>
			<form action="/Archiview/app/comment/add" method="post" class="register">
				<input type='hidden' name='reviewNo' value='<%=request.getParameter("reviewNo")%>'>
				<input type='hidden' name='level' value='1'>
				<input class="form-control form-control-sm" type="text" placeholder="댓글 달기" name='content'>
			</form>
		</div>
  </div>
  
  
</div>

<script>
var level2btn = document.querySelectorAll(".level-2");
  var register = document.querySelector(".register");
  var targetNo, groupNo, level;
  
  for (var e of level2btn) {
    e.onclick = function(e) {
        var dataNo = e.target.getAttribute("data-no");
        var comment = comments[dataNo];
        var originContent = register.innerHTML;
        register.innerHTML = originContent + 
           "<input type='hidden' name='targetNo' value='"+ comment.targetNo +"'>";
        document.querySelector(".register input[name='level']").setAttribute("value", 2);
        document.querySelector(".register input[name='reviewNo']").setAttribute("value", ${param.reviewNo});
        document.querySelector(".register input[name='content']").setAttribute("value", "@" + comment.writer +" ");
        console.log(register.innerHTML)
      };
    }
  </script>

