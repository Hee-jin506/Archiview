<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<title>관리자메인..</title>
<style>
  body {
  background-color : #000000;
  margin: 0px;
}

#todayview {
  width: 200px;
  height: 200px;
  padding: 20px;
  margin-bottom: 20px;
  float: left;
  border: 1px solid #bcbcbc;
  background-color: white;
}

</style>
</head>
<body>
  <jsp:include page="/main/admin-topbar.jsp"/>
  <jsp:include page="/main/footer.jsp"/>
    <div id="todayview">
		<span>오늘 등록된 게시물 수 : ${chartSizeMap.today}</span><br>
    </div>
</body>
</html>
