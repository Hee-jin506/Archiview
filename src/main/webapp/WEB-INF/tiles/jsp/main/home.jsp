<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아카이뷰</title>
<link rel="stylesheet" href="<%=getServletContext().getContextPath()%>/css/bootstrap/dist/css/custom.css">
<style>
 body {
   background-color : #000000;
   margin: 0px;
   color: white;
 }
 
 p {
   font-size: 18px;
   font-weight: bold;
   margin:0px;
 }
 
 img.profile {
  border-radius: 100px;
 }
</style>
</head>
<body>
<jsp:include page="/app/main/topbar"/>
<jsp:include page="/app/main/sidebar"/>
<jsp:include page="/main/footer.jsp"/>
<jsp:include page="/app/review/mainFeed"/>
</body>
</html>