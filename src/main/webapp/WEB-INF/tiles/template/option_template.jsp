<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="appRoot" value="${pageContext.servletContext.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>아카이뷰</title>
    <link href="${appRoot}/node_modules/jquery-ui-dist/jquery-ui.min.css" rel="stylesheet" type="text/css" />
  <link href="${appRoot}/node_modules/jquery-ui-dist/jquery-ui.theme.min.css" rel="stylesheet" type="text/css" />
  <link rel="stylesheet" href="${appRoot}/css/reset.css">
  <link rel="stylesheet" href="${appRoot}/css/sidebar.css">
  <link rel="stylesheet" href="${appRoot}/css/footer.css">
    <link rel="stylesheet"
    href="${appRoot}/css/bootstrap/dist/css/custom.css">
  <link rel="stylesheet" href="${appRoot}/css/header.css">
  <link rel="stylesheet" href="${appRoot}/css/bootstrap/dist/css/formcustom.css">
  <link rel="stylesheet" href="${appRoot}/css/main.css">
  <link rel="stylesheet" href="${appRoot}/css/mainFeed.css">
  <link rel="stylesheet" href="${appRoot}/css/option.css">
  <link rel="stylesheet" href="${appRoot}/css/profile.css">
  <style>
  
    #container {
      width:960px;
      margin:0 auto;
      margin-top: 75px;
    }
  </style>
</head>
<body>

<tiles:insertAttribute name="header"/>

<div id='container'>
<tiles:insertAttribute name="body"/>
<tiles:insertAttribute name="footer"/>
</div>
<script src="${appRoot}/node_modules/jquery/dist/jquery.min.js"></script>
  <script
    src="${appRoot}/node_modules/bootstrap/dist/js/bootstrap.bundle.js"></script>
<script>
$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
</script>

<script>
/* 헤더 아이콘 색 채우기 */
var profile = document.getElementById('profile');
var homeIcon = document.querySelector("#icon a:nth-child(1) img");
var plusIcon = document.querySelector("#icon a:nth-child(2) img");
var heartIcon = document.querySelector("#icon a:nth-child(3) img");
var bellIcon = document.querySelector("#icon a:nth-child(4) img");

var currentPath = window.location.pathname;

plusIcon.onclick = function(plusIcon) {
    console.log("아니 클릭햇다고");
  };


if (currentPath.includes("profile") || 
    currentPath.includes("followerList") ||
    currentPath.includes("followingList") ||
    currentPath.includes("savedReviews")
    ) {
  profile.setAttribute("style", "border: 2px solid white; margin-top: 9px; margin-right : 0px; cursor:pointer;");
} else if (currentPath.includes("write")) {
  plusIcon.setAttribute("src", "${appRoot}/main_resource/plus.png");
} else if (currentPath.includes("followingFeed")) {
  heartIcon.setAttribute("src", "${appRoot}/main_resource/like2.png");
  heartIcon.setAttribute("style", "height:20px;");
} else if (currentPath.includes("newsfeed")) {
  bellIcon.setAttribute("src", "${appRoot}/main_resource/bell.png");
  bellIcon.setAttribute("style", "height:21.25px;");
} else {
  homeIcon.setAttribute("src", "${appRoot}/main_resource/home.png");
  homeIcon.setAttribute("style", "height:20px;");
}

</script>
</body>

</html>