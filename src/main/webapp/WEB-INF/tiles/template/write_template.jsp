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


	<link rel="stylesheet" type="text/css" href="${appRoot}/css/custom-image-picker.css">
	
	<link rel="stylesheet" href="${appRoot}/css/header.css">
	<link rel="stylesheet" href="${appRoot}/css/footer.css">
	<link rel="stylesheet"
		href="${appRoot}/css/bootstrap/dist/css/custom.css">
	<link rel="stylesheet" href="${appRoot}/css/main.css">
	<link rel="stylesheet" href="${appRoot}/css/newsfeed.css">
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
	
    <script src="${appRoot}/node_modules/jquery/dist/jquery.min.js"></script>
    <script src="${appRoot}/js/image-picker.min.js"></script>
    <script>
       $("select").imagepicker()
    </script>
    <script>
      
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
function goBack() {
  window.history.back();
}
</script>
</body>
</html>