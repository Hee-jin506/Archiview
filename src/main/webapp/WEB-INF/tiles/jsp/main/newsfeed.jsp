<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="bitcamp.acv.domain.Member"%>
<%@page import="bitcamp.acv.domain.Review"%>
<%@page import="bitcamp.acv.domain.Comment"%>
<%@page import="bitcamp.acv.domain.Like"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head><title>알람 화면</title>
<link rel="stylesheet" 
      href="<%=getServletContext().getContextPath()%>/node_modules/bootstrap/dist/css/bootstrap.min.css?after">
<style>

a { 
   text-decoration: none; color: #ffffff;
 }

 body {
   background-color : #000000;
   color: #ffffff;
   margin: 0px;
 }
 
 p {
   font-size: 18px;
   font-weight: bold;
   margin:0px;
 }
 
 hr {
 hegit: 1px;
 }
 
  #contents {
   border-radius: 10px;
   background-color: #141517;
   width: 619px;  /* 너비 */
   padding: 40px;  /* 패딩 */
   float: left;  /* 왼쪽으로 플로팅 */
   height: 700px;
    overflow: hidden;
  overflow-y: scroll;
  -ms-overflow-style: none;
  scrollbar-width: none;
  line-height: 80px;
  margin-top: 0px;
 }
 
  #contents::-webkit-scrollbar {
  display: none;
}

 #list img {
  border-radius: 100px;
 }

 img.list-icon {
 vertical-align:middle;
 }
 
 img.list-href {
 margin-bottom : 100px;
 }
 
 text {
 margin-bottom : 100px;
 }
 
</style>
</head>
<body>

<%
List<Like> likes = (List<Like>) request.getAttribute("list");
List<Review> reviews = (List<Review>) request.getAttribute("reviews");
List<Comment> comments = (List<Comment>) request.getAttribute("comments");
Member loginUser = (Member) session.getAttribute("loginUser");
%>

<div id = "contents">
<div id = "title">
<p> 뉴스피드</p>
<hr>
</div>
<%
for (Like like : likes) {
  if (like.getLikingMember().getNo() != loginUser.getNo()) {
    String[] url = like.getLikingMember().getPhoto().split("\\.");
    
    if (like.getLikedType() == 1) {
      for (Review review : reviews) {
        if (review.getNo() == like.getLikedNo()) {

        %>
        <div id="list">
        <tr>
          <td><a href="<%=getServletContext().getContextPath()%>/app/member/profile?no=<%=like.getLikingMember().getNo()%>"><img class="list-icon" src=<%=getServletContext().getContextPath()+"/upload/" + url[0] +"_35x35.jpg"%>></td>
          <td><%=like.getLikingMember().getNickName()%></a> 님이 회원님의</td>
          <a class="list-href" href="<%=getServletContext().getContextPath()%>/app/review/detail?no=<%=like.getLikedNo()%>">
          <td><%=like.getLikedTypeName()%></a>를 좋아합니다. </td>
          <td><%=((Map<Integer, String>)request.getAttribute("times")).get(like.getNo())%></td>
        </tr>
        </div>


<%
        }
      }
    } else {
      for (Comment comment : comments) {
        if (comment.getNo() == like.getLikedNo()) {
        

%>
        <div id="list">
        <tr>
          <td><a href="<%=getServletContext().getContextPath()%>/app/member/profile?no=<%=like.getLikingMember().getNo()%>"><img class="list-icon" src=<%=getServletContext().getContextPath()+"/upload/" + url[0] +"_35x35.jpg"%>></td>
          <td><%=like.getLikingMember().getNickName()%></a> 님이 회원님의</td>
          <a class="list-href" href="<%=getServletContext().getContextPath()%>/app/comment/view?reviewNo=<%=like.getLikedNo()%>">
          <td><%=like.getLikedTypeName()%></a> 을 좋아합니다.</td>
          <td><%=((Map<Integer, String>)request.getAttribute("times")).get(like.getNo())%></td>
        </tr>
        </div>

<%
       }
      }
    }
  }
}
%>
      </div>


<script src="<%=getServletContext().getContextPath()%>/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>