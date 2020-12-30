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
  <link rel="stylesheet" href="${appRoot}/css/reset.css">
  <link rel="stylesheet" href="${appRoot}/css/header.css">
  <link rel="stylesheet" href="${appRoot}/css/sidebar.css">
  <link rel="stylesheet" href="${appRoot}/css/footer.css">
  <link rel="stylesheet" href="${appRoot}/css/bootstrap/dist/css/custom.css">
  <link rel="stylesheet" href="${appRoot}/css/main.css">
  <link rel="stylesheet" href="${appRoot}/css/mainFeed.css">
  <link rel="stylesheet" href="${appRoot}/css/newsfeed.css">
  <link rel="stylesheet" href="${appRoot}/css/profile.css">
  <style>
  
  #container {
      width:960px;
      margin:0 auto;
      margin-top: 75px;
    }

#body {
  xposition: absolute;
  xleft: 230px;
  xtop: 70px;
  box-sizing: content-box;
  width: 700px;
  height: 700px;
  padding: 0px;
  overflow: hidden;
  overflow-y: scroll;
  -ms-overflow-style: none;
  scrollbar-width: none;
}

#body::-webkit-scrollbar {
  display: none;
}
    
  </style>
  <script src="${appRoot}/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</head>
  <body>

	  <!-- <div id="headerLine"></div> -->
	  <div id="container">
	  <tiles:insertAttribute name="header"/>
		  <tiles:insertAttribute name="sidebar"/>
		  <div id="body">
		  <tiles:insertAttribute name="body"/>
	  </div>
	  <tiles:insertAttribute name="footer"/>

	  </div>
	  
<script>
"use strict" 
var count = 1;
var body = document.querySelector("#body");
body.onscroll = function(e) {
    console.log(body.scrollTop)
    if(body.scrollTop >= 1850) {
        count++;
        console.log("스크롤 끝 감지") 
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "../../app/ajax/review/moreFeed?pageNo=" + count, false);
        xhr.send();
        var originContent = body.innerHTML;
        body.innerHTML = originContent + xhr.responseText;
    }
}; 

</script>
  </body>
</html>
