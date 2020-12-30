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
  <style>
  /*
  #container {
      width:960px;
      margin:0 auto;
      margin-top: 75px;
    }
  #headerLine {
      width:100%;
      height:65px;
      position:absolute;
      xtop:65px;
      background-color:white;
      z-index:-1;
    } */
    
  </style>
</head>
  <body>

	  <!-- <div id="headerLine"></div> -->
	  <div id="container">
		  <tiles:insertAttribute name="body"/>
	  </div>
  </body>
</html>