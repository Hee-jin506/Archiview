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
	for (Review review : list) { %>
<div class='card'>
		<div class='cardHeader'>
			<a
				href='<%=getServletContext().getContextPath()%>/app/member/profile?no=${tm.no}'>
	<img class='profile'
		src=<%=getServletContext().getContextPath() + "/upload/" + review.getWriterPhoto() + "_35x35.jpg"%>>
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
</div>
<div class='stillcut'>
<%if (review.getStcUrl() != null) {%>
	<img src=<%=review.getStcUrl()%>>
<% }%>
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
			<div class='like'>
				<a
					href='<%=getServletContext().getContextPath()%>/app/like/addReview?likingMember=${loginUser.getNo()}'>
					<img
					src='<%=getServletContext().getContextPath()%>/main_resource/like.png'
					alt='좋아요'>
				</a> <span class='pop'><%=review.getLiking()%>개</span>
			</div>
		</div>
	</div>
	<%}%>
</div>
