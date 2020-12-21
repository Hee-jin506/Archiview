<%@page import="bitcamp.acv.domain.Follow"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%!private String getType(int followedType) {
    switch (followedType) {
      case 1:
        return "회원";
      case 2:
        return "태그";
      default:
        return "기타";
    }
  }%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 팔로잉하는 리스트</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>

<div class="container">
<h1>내가 팔로잉하는 리스트</h1>

<div id="content">
<jsp:include page="${follower}"></jsp:include>
  </div>

<table class="table">
    <thead>
      <tr>
        <th scope="col" class="text-center">팔로우</th>
        <th scope="col" class="text-center">나와랏</th>
      </tr>
    </thead>
    
      <tbody>
      
    <%  Follow follow = (Follow) request.getAttribute("follow"); %>
    <p>현재 로그인 사용자 : <%=follow.getFollowingMember().getNickName()%></p>
    
    </tbody>
  </table>
  </div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</body>
</html>