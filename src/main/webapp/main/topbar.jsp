<%@page import="bitcamp.acv.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#menubar {
  position: fixed;
  top:0px;
  background-color: #141517;
  box-sizing: border-box;
  color: white;
  width: 100%;
  height: 65px;
  margin: 0px;
}
#menubar #search {
  position: absolute;
  left: 500px;
  top: 10px;
}
#menubar #icon {
  position: absolute;
  left: 1000px;
  top: 10px;
}
#menubar #profile {
  position: absolute;
  left: 1350px;
  top: 10px;
}
#menubar #logo img {
  position: absolute;
  width: 205px;
  height: 159px;
  left: 50px;
  top: 10px;
}
#menubar #search form {
  
}
#menubar #icon img {
  margin-right: 30px;
  
}
</style>
<body>
  <div id='menubar'>
    <div id='logo'>
      <a href="<%=getServletContext().getContextPath()%>/app/main/"> <img
        src="<%=getServletContext().getContextPath()%>/main_resource/logo.png"
        alt="로고"></a>
    </div>
<%
String keyword = request.getParameter("keyword");
%>
    <div id='search'>
      <form action='/app/main/search'>
        <label><img
          src='<%=getServletContext().getContextPath()%>/main_resource/search.png'></label>
        <input type='search' name='keyword' value='<%=keyword != null ? keyword : ""%>'>
      </form>
    </div>
    <div id='icon'>
  
      <a href='<%=getServletContext().getContextPath()%>'>
      <img src='<%=getServletContext().getContextPath()%>/main_resource/home.png' alt='메인화면'></a> <a
        href='<%=getServletContext().getContextPath()%>/app/write/movieSearch'>
        <img src='<%=getServletContext().getContextPath()%>/main_resource/plus.png' alt='글쓰기'></a> <a
        href='<%=getServletContext().getContextPath()%>/app/main/following'>
        <img src='<%=getServletContext().getContextPath()%>/main_resource/heart.png' alt='팔로우한 회원의 피드'></a> <a
        href='<%=getServletContext().getContextPath()%>/app/main/newsfeed'>
        <img src='<%=getServletContext().getContextPath()%>/main_resource/bell.png' alt='알람'></a>
    </div>
<% Member member = (Member) request.getAttribute("loginUser"); %>
   <div id='profile'>
      <a href='<%=getServletContext().getContextPath()%>/member/profile'>
      <img class='profile' src='<%=getServletContext().getContextPath()+"/upload/" + member.getPhoto() + "_35x35.jpg"%>' alt='프로필'>
      </a>
    </div>
  </div>
</body>
</html>