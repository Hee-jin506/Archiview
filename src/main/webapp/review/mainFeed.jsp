<%@page import="java.util.Map"%>
<%@page import="bitcamp.acv.domain.Tag"%>
<%@page import="bitcamp.acv.domain.Member"%>
<%@page import="java.util.List"%>
<%@page import="bitcamp.acv.domain.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  #cards {
   overflow: hidden;
   overflow-y: scroll;
   position: absolute;
   left:230px;
   top:70px;
   box-sizing: content-box;
   width: 700px;
   height: 700px;
   padding: 0px;
   -ms-overflow-style: none;
   scrollbar-width: none;
  }
  #cards::-webkit-scrollbar {
    display: none; 
  }
  
  .card {
  padding: 10px;
  border-radius: 10px;
  background-color: #141517;
  box-sizing: border-box;
  color: white;
  width: 650px;
  height: 500px;
  margin: 10px;
  padding: 0px;
  }
  .card .member {
  position: absolute;
  width: 300px;
  margin: 10px;
  }
  .card img.profile {
  width: 50px;
  }
  .card .member p {
  position: absolute;
  left: 57px;
  top: 15px;
  }
  
  .card .follow {
  
  }
  
  
}
</style>
</head>
<body>
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
<button class='follow'>언팔로우</button>
<button class="btn btn-primary" type="submit" style='background-color: #000000;'>팔로우</button>
<%} else {%>
<button class='follow' >팔로우</button>
<button class="btn btn-primary" type="submit" style='background-color: #000000;'>팔로우</button>
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
<p><%=((Map<Integer, String>)request.getAttribute("times")).get(review.getNo()) %></p>
<p>좋아요 <%=review.getLiking() %>개</p>
</div>
<%}%>
</div>
</body>
</html>