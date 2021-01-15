<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="appRoot" value="${pageContext.servletContext.contextPath}" />	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#menubar {
	background-color: gray;
	color: white;
	height: 30px;
	padding: 5px
}

#menubar a {
	color: white;
	text-decoration: none;
}

#menubar a:visited {
	color: white;
	text-decoration: none;
}

#menubar a:hover {
	text-decoration: underline;
}
</style>
<body>
	<div id='menubar'>
		
		<a href='${appRoot}/admin/main'>[메인]</a>
    <a href='${appRoot}/admin/review/list'>[게시물 관리]</a>
    <a href='${appRoot}/admin/tag/list'>[태그 관리]</a> 
    <a href='${appRoot}/admin/member/list'>[회원 관리]</a>
    <a href='${appRoot}/admin/movie/list'>[영화 관리]</a>
    <a href='${appRoot}/admin/report/list'>[신고 관리]</a>
	</div>
</body>
</html>