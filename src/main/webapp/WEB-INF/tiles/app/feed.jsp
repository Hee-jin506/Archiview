<%@page import="java.util.Map"%>
<%@page import="bitcamp.acv.domain.Tag"%>
<%@page import="bitcamp.acv.domain.Member"%>
<%@page import="java.util.List"%>
<%@page import="bitcamp.acv.domain.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id='cards'>
	<%
	  List<Review> list = (List<Review>) request.getAttribute("list");
	for (Review review : list) {
	%>
	<div class='card'>
		<div class='cardHeader'>
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
			<img class='more' src='<%=getServletContext().getContextPath()%>/main_resource/more.png'>
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
			<a class='movie'><%=review.getMovieTitle()%></a>
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
		      src='<%=getServletContext().getContextPath()%>/main_resource/like.png'
		      alt='좋아요'>
		    </a> <span class='pop'><%=review.getLiking()%>개</span>
		  </div>
		  <%
		  }%>
		</div>
	<div class='reviewDetail'>
	<button></button>
	</div>
	</div>
	<%
	}%>
	
	<script>
	</script>
	<script>
      "use strict"

      var el = document.querySelectorAll(".like a img")
      
      for (var e of el) {
        e.addEventListener("mouseover", function(e) {
              console.log(this);
              // 이벤트가 발생한 객체의 속성 값 알아내기
              this.setAttribute("src", "<%=getServletContext().getContextPath()%>/main_resource/like2.png");  // undefined
            });
      }
      
      for (var e of el) {
        e.addEventListener("mouseout", function(e) {
                console.log(this);
                // 이벤트가 발생한 객체의 속성 값 알아내기
                this.setAttribute("src", "<%=getServletContext().getContextPath()%>/main_resource/like.png");  // undefined
              });
        }
      
      var el = document.querySelectorAll(".card .cardHeader img.more")
      
      for (var e of el) {
        e.addEventListener("click", function(e) {
              console.log(this);
              // 이벤트가 발생한 객체의 속성 값 알아내기
              this.setAttribute("src", "<%=getServletContext().getContextPath()%>/main_resource/like2.png");  // undefined
            });
      }
      </script>
</div>
