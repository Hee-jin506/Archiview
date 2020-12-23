<%@page import="java.util.Map"%>
<%@page import="bitcamp.acv.domain.Tag"%>
<%@page import="bitcamp.acv.domain.Member"%>
<%@page import="java.util.List"%>
<%@page import="bitcamp.acv.domain.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id='cards'>
<%List<Review> list = (List<Review>) request.getAttribute("list");
for (Review review : list) {
%>
<div class='card'>
<div class='member'>
<img class='profile' src=<%=getServletContext().getContextPath()+"/upload/" + review.getWriterPhoto() + "_35x35.jpg"%>>
<p><%=review.getWriterNick() %></p>
</div>
<% if (!review.getWriterNick().equals(((Member)(request.getAttribute("loginUser"))).getNickName())) {%>
<form>
<% if (review.getIsFollowing() != 0) { %>
<button class="btn btn-twitter">팔로우</button>
<%} else {%>
<button class="btn btn-archiview">팔로우</button>
<%} %>
</form>
<%}%>
<img src=<%=review.getStcUrl() %>><br>
<p><%=review.getText() %></p>
<% 
List<Tag> tags = review.getTags();
for (Tag tag : tags) { 
if (tag.getTitle() != null) {%>
<a href='<%=getServletContext().getContextPath()+"/app/main/search?keyword=%23"+tag.getTitle()%>'>
#<%= tag.getTitle() %></a>
<%}
}%>
<br>
<p><%=review.getMovieTitle() %></p>
<p><%=(review.getRdtFromNow()) %></p>
<p>좋아요 <%=review.getLiking() %>개</p>
</div>
<%}%>
</div>