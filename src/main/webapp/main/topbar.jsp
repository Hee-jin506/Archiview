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
  position: absolute;
  left:0px;
  top:0px;
  width: 100%;
  background-color: #141517;
  box-sizing: border-box;
  color: white;
  height: 65px;
  margin: 0px;
}
#menubar #inner {
      width:960px;
      xpadding:20px;
      margin:0 auto;
}
#menubar #search {
  xposition: absolute;
  xleft: 600px;
  xtop: 20px;
      margin:0 auto;
}
#menubar #profile {
  xposition: absolute;
  xleft: 1350px;
  xtop: 15px;
  margin-left:12px;
  margin-top:12px;
  float: right;
}
#menubar #icon {
  xposition: absolute;
  xleft: 1000px;
  xtop: 20px;
  margin-top:17px;
  float: right;
}
#menubar #logo img {
float:left;
margin-top:10px;
margin-right:150px;
  xposition: absolute;
  width: 200px;
  xleft: 200px;
  xtop: 15px;
}
#menubar #search form {
margin-top:20px;
float:left;
  
}
#menubar #icon img {
  margin-right: 15px;
}
</style>
<body>
  <div id='menubar'>
  <div id='inner'>
    <div id='logo'>
      <a href="<%=getServletContext().getContextPath()%>/app/main/"> 
        <img src="<%=getServletContext().getContextPath()%>/main_resource/logo.png" alt="로고">
      </a>
    </div>
<%
String keyword = request.getParameter("keyword");
%>
    <div id='search'>
      <form action='<%=getServletContext().getContextPath()%>/app/main/search'>
        <label><img
          src='<%=getServletContext().getContextPath()%>/main_resource/search-outline.png' width="12"></label>
        <input type='search' name='keyword' value='<%=keyword != null ? keyword : "검색"%>'>
      </form>
    </div>
    <% Member member = (Member) session.getAttribute("loginUser"); %>
    <div id='profile'>
      <a href='<%=getServletContext().getContextPath() + "/app/member/profile?no=" + member.getNo()%>'>
      <img class='profile' src='<%=getServletContext().getContextPath()+"/upload/" + member.getPhoto() + "_35x35.jpg"%>' alt='프로필'>
      </a>
    </div> 
    <div id='icon'>
  
      <a href='<%=getServletContext().getContextPath()%>'>
      <img src='<%=getServletContext().getContextPath()%>/main_resource/home-outline.png' width="20" alt='메인화면'></a> <a
        href='<%=getServletContext().getContextPath()%>/app/write/movieSearch'>
        <img src='<%=getServletContext().getContextPath()%>/main_resource/plus-outline.png' width="20"  alt='글쓰기'></a> <a
        href='<%=getServletContext().getContextPath()%>/app/main/following'>
        <img src='<%=getServletContext().getContextPath()%>/main_resource/heart-outline.png' width="20"  alt='팔로우한 회원의 피드'></a> <a
        href='<%=getServletContext().getContextPath()%>/app/main/newsfeed'>
        <img src='<%=getServletContext().getContextPath()%>/main_resource/bell-outline.png' width="20"  alt='알람'></a>
    </div>

    </div>
   </div> 
</body>
</html>