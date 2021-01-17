<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<c:set var="appRoot" value="${pageContext.servletContext.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>아카이뷰</title>

  <link href="${appRoot}/node_modules/jquery-ui-dist/jquery-ui.min.css" rel="stylesheet" type="text/css" />
  <link href="${appRoot}/node_modules/jquery-ui-dist/jquery-ui.theme.min.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${appRoot}/css/custom-image-picker.css">
	<link rel="stylesheet"href="${appRoot}/css/bootstrap/dist/css/custom.css">
  <link rel="stylesheet" href="${appRoot}/css/reset.css">
  <link rel="stylesheet" href="${appRoot}/css/sidebar.css">
  <link rel="stylesheet" href="${appRoot}/css/footer.css">
  <link rel="stylesheet" href="${appRoot}/css/header.css">
  <link rel="stylesheet" href="${appRoot}/css/main.css">
  <link rel="stylesheet" href="${appRoot}/css/mainFeed.css">
  <link rel="stylesheet" href="${appRoot}/css/newsfeed.css">
  <link rel="stylesheet" href="${appRoot}/css/profile.css">
  <link rel="stylesheet" href="${appRoot}/css/detailForUser.css">
<style>
#container {
	width: 960px;
	margin: 0 auto;
	position: relative;
	top: -10px;
}

#footer {
	margin-top: 30px;
}
</style>
</head>
<body>

	<tiles:insertAttribute name="header" />

	<div id="container">
		<tiles:insertAttribute name="body" />

		<tiles:insertAttribute name="footer" />

	</div>
	
	<script
    src="${appRoot}/node_modules/bootstrap/dist/js/bootstrap.bundle.js"></script>
    <script src="${appRoot}/node_modules/jquery/dist/jquery.min.js"></script>
    <script src="${appRoot}/js/image-picker.min.js"></script>
    
    <script>
    /* 스틸컷 고를때 이미지 검은색으로 만듬 */
       $("select").imagepicker()
    </script>
    
    <script>
      /* 스틸컷 고를때 체크표시 띄우기 */
      var checkedPng = document.createElement("img");
      checkedPng.setAttribute("src","${appRoot}/checked.png");
      checkedPng.setAttribute("style","width:56px; height:40px; position:absolute; top:50px; right:82px; z-index:51;opacity: 100;");
      
      var selected = document.querySelector(".selected");
      selected.appendChild(checkedPng);
      
      var thumbnails = document.querySelectorAll(".thumbnail");
      var lis = document.querySelectorAll("li");
      
      for (var li of lis) {
    	    li.setAttribute("style","position:relative;");
    	}
      for (var e of thumbnails) {
    	    e.addEventListener("click", function(e) {
    	         if (this.getAttribute("class") == "thumbnail selected") {
    	        	  this.appendChild(checkedPng);
    	              } else {
    	            	  this.removeChild(checkedPng);
    	              }
    	       
    	      });
    	}
    </script>
<script>

/* 뒤로가기버튼 */
function goBack() {
  window.history.back();
}

/* 헤더 아이콘 색채우기 */
var currentPath = window.location.pathname;
var profile = document.getElementById('profile');
var homeIcon = document.querySelector("#icon a:nth-child(1) img");
var plusIcon = document.querySelector("#icon a:nth-child(2) img");
var heartIcon = document.querySelector("#icon a:nth-child(3) img");
var bellIcon = document.querySelector("#icon a:nth-child(4) img");

console.log(plusIcon);

plusIcon.onclick = function(plusIcon) {
    console.log("아니 클릭햇다고");
  };


if (currentPath.includes("profile") || 
    currentPath.includes("followerList") ||
    currentPath.includes("followingList") ||
    currentPath.includes("savedReviews")
    ) {
  profile.setAttribute("style", "border: 2px solid white; margin-top: 5px; margin-right : 0px; cursor:pointer;");
} else if (currentPath.includes("write")) {
  console.log("write");
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

console.log(currentPath);
</script>
<script>
$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
</script>
</body>
</html>