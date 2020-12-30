<%@page import="bitcamp.acv.domain.Comment"%>
<%@page import="bitcamp.acv.domain.Member"%>
<%@page import="bitcamp.acv.domain.Tag"%>
<%@page import="java.util.List"%>
<%@page import="bitcamp.acv.domain.Review"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%Review review = (Review)request.getAttribute("review"); 
System.out.println(review.getText());%>
<div id='cardDetail'>
  <div id='cardPart'>
    <div class='cardHeader'>
      <div class='movie'><%=review.getMovieTitle()%>.archiview</div>
      <img class='cardHeader_more' src='<%=getServletContext().getContextPath()%>/main_resource/more.png'>
    </div>
    
    <div class='stillcut'>
      <%if (review.getStcUrl() != null) {%>
      <img src=<%=review.getStcUrl()%>>
      <%
        }
      %>
      <div class='reviewText'>
        <p><%=review.getText()%>
        </p>
      </div>

      <div class='tags'>
        <%
          List<Tag> tags = review.getTags();
        for (Tag tag : tags) {
          if (tag.getTitle() != null) {
        %>
        <a class='tag'
          href='<%=getServletContext().getContextPath() + "/app/main/search?keyword=%23" + tag.getTitle()%>'>
          #<%=tag.getTitle()%></a>
        <%}
}%>
      </div>
    </div>

    <div class='cardFooter'>
    <a
        href='<%=getServletContext().getContextPath()%>/app/member/profile?no=${tm.no}'>
        <img class='profile'
        src='<%=getServletContext().getContextPath() + "/upload/" + review.getWriterPhoto() + "_35x35.jpg"%>'>
      </a> <a class='nickname'
        href='<%=getServletContext().getContextPath()%>/app/member/profile?no=${tm.no}'>
        <%=review.getWriterNick()%></a>
      <%
        if (!review.getWriterNick().equals(((Member) (request.getAttribute("loginUser"))).getNickName())) {
      %>
      <%
        if (review.getIsFollowing() != 0) {
      %>
      <div class='follow'>
        <form>
          <button class="btn btn-twitter">팔로우</button>
        </form>
      </div>
      <%} else {%>
      <div class='follow'>
        <form>
          <button class="btn btn-archiview">팔로우</button>
        </form>
      </div>
      <%
        }
      }
      %>

      <p class='rdt'><%=(review.getRdtFromNow())%></p>
      <%
        if (review.getIsLiking() != 0) {
      %>
      <div class='like'>
        <a
          href='<%=getServletContext().getContextPath()%>/app/like/dislikeReview?likedNo=<%=review.getNo()%>'>
          <img
          src='<%=getServletContext().getContextPath()%>/main_resource/like2.png'
          alt='좋아요'>
        </a> <span class='pop'><%=review.getLiking()%>개</span>
      </div>
      <%} else {
      %>
      <div class='like'>
         <a
          href='<%=getServletContext().getContextPath()%>/app/like/likeReview?likedNo=<%=review.getNo()%>'>
          <img
          src='<%=getServletContext().getContextPath()%>/main_resource/comment.png'
          alt='댓글 보기'>
        </a>

        <a
          href='<%=getServletContext().getContextPath()%>/app/like/likeReview?likedNo=<%=review.getNo()%>'>
          <img
          src='<%=getServletContext().getContextPath()%>/main_resource/like.png'
          alt='좋아요'>
        </a> <span class='pop'><%=review.getLiking()%>개</span>
        
        <a
          href='<%=getServletContext().getContextPath()%>/app/like/likeReview?likedNo=<%=review.getNo()%>'>
          <img
          src='<%=getServletContext().getContextPath()%>/main_resource/save.png'
          alt='저장'>
        </a>
        
        <a
          href='<%=getServletContext().getContextPath()%>/app/like/likeReview?likedNo=<%=review.getNo()%>'>
          <img
          src='<%=getServletContext().getContextPath()%>/main_resource/info-circle.png'
          alt='영화 상세'>
        </a>

      </div>
      <%
      }%>
    </div>
    </div>


	<div class='comments'>
		<div class='commentsBody'>
				<%
				List<Comment> comments = (List<Comment>) request.getAttribute("view");
				for (Comment comment : comments) {
				  System.out.print("댓글" + comment.getContent());
				  System.out.println("  => 댓글 상태" + comment.getStatus());
				}
				HttpSession s = request.getSession();
				Member loginUser = (Member) s.getAttribute("loginUser");
				%>
				
				<%
				
				System.out.println(comments.size());
				int count = 0;
				%>
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
					          <img class='profile' src='<%=getServletContext().getContextPath()%>/upload/${c.member.photo}_35x35.jpg'>
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
									        <button class='level-2 btn btn-outline-secondary' data-no='<%=count%>' type="button" >답글 달기</button>
									        <%count++; %>
									
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
							  </c:when>
							<c:otherwise>
						   	 삭제된 코멘트입니다.
						  </c:otherwise>
						</c:choose>
				  </div>
				</c:forEach>
				
		</div>


		<div class='commentsFooter'>
			<form action="../../comment/add" method="post" class="register">
				<input type='hidden' name='reviewNo' value='<%=request.getParameter("reviewNo")%>'>
				<input type='hidden' name='level' value='1'>
				<input class="form-control form-control-sm" type="text" placeholder="댓글 달기" name='content'>
			</form>
		</div>
  </div>

	<script>
	var level2btn = document.querySelectorAll(".level-2");
	var register = document.querySelector(".register");
	var targetNo, groupNo, level;
	
	for (var e of level2btn) {
	  e.onclick = function(e) {
	      dataNo = e.target.getAttribute("data-no");
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
</div>