<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="bitcamp.acv.domain.Member"%>
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
HttpSession session1 = request.getSession();
Member loginUser = (Member) session1.getAttribute("loginUser");
%>

<tbody>
<%
for (Like like : likes) {
  if (like.getLikingMember().getNo() != loginUser.getNo()) {

    String[] url = like.getLikingMember().getPhoto().split("\\.");
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
