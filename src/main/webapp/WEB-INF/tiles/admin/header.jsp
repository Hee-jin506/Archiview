<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		
		<a href='<%=getServletContext().getContextPath()%>/admin/main'>[메인]</a>
    <a href='<%=getServletContext().getContextPath()%>/admin/review/list'>[게시물 관리]</a>
    <a href='<%=getServletContext().getContextPath()%>/admin/tag/list'>[태그 관리]</a> 
    <a href='<%=getServletContext().getContextPath()%>/admin/member/list'>[회원 관리]</a>
    <a href='<%=getServletContext().getContextPath()%>/admin/movie/list'>[영화 관리]</a>
    <a href='<%=getServletContext().getContextPath()%>/admin/report/list'>[신고 관리]</a>
	</div>
</body>
</html>