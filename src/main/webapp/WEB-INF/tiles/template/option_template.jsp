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
  <link rel="stylesheet" href="${appRoot}/css/sidebar.css">
  <link rel="stylesheet" href="${appRoot}/css/footer.css">
    <link rel="stylesheet"
    href="${appRoot}/css/bootstrap/dist/css/custom.css">
  <link rel="stylesheet" href="${appRoot}/css/header.css">
  <link rel="stylesheet" href="${appRoot}/css/bootstrap/dist/css/formcustom.css">
  <link rel="stylesheet" href="${appRoot}/css/main.css">
  <link rel="stylesheet" href="${appRoot}/css/mainFeed.css">
  <link rel="stylesheet" href="${appRoot}/css/option.css">
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

  <script
    src="${appRoot}/node_modules/bootstrap/dist/js/bootstrap.bundle.js"></script>
</body>
</html>