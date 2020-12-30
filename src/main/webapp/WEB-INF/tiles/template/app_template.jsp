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
  /* #headerLine {
      width:100%;
      height:65px;
      position:absolute;
      xtop:65px;
      background-color:white;
      z-index:-1;
    } */
    
  </style>
  <script src="${appRoot}/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</head>
  <body>

	  <!-- <div id="headerLine"></div> -->
	  <div id="container">
	  <tiles:insertAttribute name="header"/>
		  <tiles:insertAttribute name="sidebar"/>
		  <tiles:insertAttribute name="body"/>
	  
	  <tiles:insertAttribute name="footer"/>

	  </div>
  </body>
</html>