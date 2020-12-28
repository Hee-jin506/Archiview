<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="bitcamp.acv.domain.Member"%>
<%@page import="bitcamp.acv.domain.NewsFeed"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
</head>
<body>

<%
Member loginUser = (Member) session.getAttribute("loginUser");
List<NewsFeed> newsFeeds = (List<NewsFeed>) request.getAttribute("newsFeedList");

%>
<div id = "contents">
<div id = "title">
	<div id = "title-text">뉴스피드</div>
	<hr>
</div>
<div id = "lists">
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

      <% 
    } else if (newsFeed.getTargetType() == 2) {
      %>
      <a class="list-href" href="<%=getServletContext().getContextPath()%>/app/comment/view?no=<%=newsFeed.getTargetNo()%>">
      <td>코멘트</a>를 좋아합니다. </td>
      <td><%=((Map<Integer, String>)request.getAttribute("times")).get(newsFeed.getNo())%></td>
 
      <% 
    } else if (newsFeed.getTargetType() == 3) {
      %>
      <td>회원님을 팔로우 합니다.</td>
      <td><%=((Map<Integer, String>)request.getAttribute("times")).get(newsFeed.getNo())%></td>

      <%}%>
    </tr>
    </div>
    <%}%>
  </div>
  </div>
</body>
