<%@page import="bitcamp.acv.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
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