<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="bitcamp.acv.domain.Member"%>
<%@page import="bitcamp.acv.domain.Review"%>
<%@page import="bitcamp.acv.domain.Comment"%>
<%@page import="bitcamp.acv.domain.Like"%>
<%@page import="bitcamp.acv.domain.Follow"%>
<%@page import="bitcamp.acv.domain.NewsFeed"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<head><title>알람 화면</title>
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
   
   width: 600px;  /* 너비 */
   min-width: 650px;
   padding-left: 20px;  /* 패딩 */
   padding-right: 20px;  /* 패딩 */
   padding-bottom: 20px;  /* 패딩 */
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
 #title {
  font: inherit;
  text-height: 28px;
  vertical-align: middle;
 }
 
 #title hr {
  color: white;
  border: 0;
  height: 1px;
  background-color: #626473;
  margin-left: -20px;
  margin-right: -20px;
 }

 #list img {
  border-radius: 100px;
 }

 img.list-icon {
 vertical-align:middle;
 }
 
 
</style>
</head>
<body>

<%
Member loginUser = (Member) session.getAttribute("loginUser");
List<NewsFeed> newsFeeds = (List<NewsFeed>) request.getAttribute("newsFeedList");

%>

<div id = "contents">
<div id = "titlet">
뉴스피드
<hr>
</div>
<%

for (NewsFeed newsFeed : newsFeeds) {
  %>
  <div id="list">
  <tr>
    <td><a href="<%=getServletContext().getContextPath()%>/app/member/profile?no=<%=newsFeed.getNo()%>"><img class="list-icon" src=<%=getServletContext().getContextPath()+"/upload/" + newsFeed.getPhoto() +"_35x35.jpg"%>></td>
    <td><%=newsFeed.getNick()%></a> 님이</td> 
    <%
    
    if (newsFeed.getTargetType() == 1) {
      %>
      회원님의
      <a class="list-href" href="<%=getServletContext().getContextPath()%>/app/review/detail?no=<%=newsFeed.getTargetNo()%>">
      <td>리뷰</a>를 좋아합니다. </td>
      <td><%=((Map<Integer, String>)request.getAttribute("times")).get(newsFeed.getNo())%></td>
      <td><%=newsFeed.getDate() %> </td>
      <% 
    } else if (newsFeed.getTargetType() == 2) {
      %>
      <a class="list-href" href="<%=getServletContext().getContextPath()%>/app/comment/view?no=<%=newsFeed.getTargetNo()%>">
      <td>코멘트</a>를 좋아합니다. </td>
      <td><%=((Map<Integer, String>)request.getAttribute("times")).get(newsFeed.getNo())%></td>
            <td><%=newsFeed.getDate() %> </td>
      <% 
    } else if (newsFeed.getTargetType() == 3) {
      %>
      <td>회원님을 팔로우 합니다.</td>
      <td><%=((Map<Integer, String>)request.getAttribute("times")).get(newsFeed.getNo())%></td>
            <td><%=newsFeed.getDate() %> </td>
      <% 
    }
    %>
  </tr>
  </div>
    <%
}
    %>
      </div>


<script src="<%=getServletContext().getContextPath()%>/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>
