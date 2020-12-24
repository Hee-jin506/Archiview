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
<head><title>좋아요 화면</title>
<style>
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
 
 img.profile {
  border-radius: 100px;
 }
</style>
</head>
<body>

<jsp:include page="/app/main/topbar"/>

<h1>좋아요</h1>

<br>
<br>
<br>
<br>
<br>


<%
List<Like> likes = (List<Like>) request.getAttribute("list");
List<Review> reviews = (List<Review>) request.getAttribute("reviews");
List<Comment> comments = (List<Comment>) request.getAttribute("comments");
Member loginUser = (Member) session.getAttribute("loginUser");
%>

<tbody>
<%
for (Like like : likes) {
  if (like.getLikingMember().getNo() != loginUser.getNo()) {

    String[] url = like.getLikingMember().getPhoto().split("\\.");
    
    if (like.getLikedType() == 1) {
      for (Review review : reviews) {
        
      int lno = like.getLikedNo();
      System.out.println(lno);
      System.out.println("----");
      
      System.out.println(review.getNo());
        
      }
      
      
      
      
        
%>
        <tr>
        <td><img src=<%=getServletContext().getContextPath()+"/upload/" + url[0] +"_35x35.jpg"%>></td>


        <td><%=like.getLikingMember().getNickName()%> 님이 회원님의</td>
        <a href="<%=getServletContext().getContextPath()%>/app/review/detail?no=<%=like.getLikedNo()%>">
    <td><%=like.getLikedTypeName()%></a> 를 좋아합니다. </td>
        
<%
    
    }
%>

<tr>
<td><img src=<%=getServletContext().getContextPath()+"/upload/" + url[0] +"_35x35.jpg"%>></td>


<td><%=like.getLikingMember().getNickName()%> 님이 회원님의</td>

<%
  if (like.getLikedType() == 1) {
%>
    <a href="<%=getServletContext().getContextPath()%>/app/review/detail?no=<%=like.getLikedNo()%>">
    <td><%=like.getLikedTypeName()%></a> 를 좋아합니다. </td>
<%
  } else {
%>
  <a href="<%=getServletContext().getContextPath()%>/app/comment/view?reviewNo=<%=like.getLikedNo()%>">
    <td><%=like.getLikedTypeName()%></a> 을 좋아합니다.</td>
<%
  }
%>
<td><%=((Map<Integer, String>)request.getAttribute("times")).get(like.getNo())%></td>
</tr>
<br>
<% 
  }
%>
<%
}
%>

<jsp:include page="/app/main/sidebar"/>
<jsp:include page="/main/footer.jsp"/>
</body>
</html>
