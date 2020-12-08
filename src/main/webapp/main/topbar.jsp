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
		<a href='<%=getServletContext().getContextPath()%>/index.html'>메인</a>
    <a href='<%=getServletContext().getContextPath()%>/'>글쓰기</a>
    <a href='<%=getServletContext().getContextPath()%>/'>팔로잉피드 하트</a> 
    <a href='<%=getServletContext().getContextPath()%>/'>뉴스피드 알람</a>
    <a href='<%=getServletContext().getContextPath()%>/auth/loginUser'>회원</a>
    <a href='<%=getServletContext().getContextPath()%>/member/list'>회원리스트</a>
    <a href='<%=getServletContext().getContextPath()%>/auth/login'>로그인</a>
    <a href='<%=getServletContext().getContextPath()%>/auth/logout'>로그아웃</a>
	</div>
</body>
</html>