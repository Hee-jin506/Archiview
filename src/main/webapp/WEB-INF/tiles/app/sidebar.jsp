<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="appRoot" value="${pageContext.servletContext.contextPath}" /> 

<div id='sidebar'>
	<div id='topMembers' class='sidebar-member'>
		<div class='sidebar-title'>추천 리뷰어 목록</div>
		
		<hr>
		
		<c:forEach var="m" items="${topMembers}">
			<div class='sidebar-member-row'>
				<div class='sidebar-member-row-image'>
				  <a href='${appRoot}/app/member/profile?no=${m.no}'>
				    <img class='profile' src='${appRoot}/upload/${m.photo}_35x35.jpg'>
				  </a>
				</div>
				<div class='sidebar-member-row-image-text'>
					<p>
					  <a class='nickname' href='${appRoot}/app/member/profile?no=${m.no}'>
					    ${m.nickName}
					  </a>
					</p>
				  <p class='explanation'>${m.intro}</p>
				</div>
			</div>
		</c:forEach>
	</div>

	<div id='topMovies' class='sidebar'>
	 <div class='sidebar-title'>인기 영화 목록</div>
	 
		<hr>
		
	  <c:set var="count" value="1" />
	  
		<c:forEach var="mv" items="${topMovies}">
		
		  
			<div class='sidebar-movie-tag-row'>
				<p class='title'>${count} ${mv.title}</p>
				<p class='explanation'>게시물 ${fn:length(mv.reviews)}개</p>
			</div>
			
			<c:set var="count" value="${count + 1}" />
			
	  </c:forEach>
	</div>

	 <div id='topTags' class='sidebar'>
	  <div class='sidebar-title'>인기 태그 목록</div>
	 
		<hr>
		
		<c:forEach var="t" items="${topTags}">
			<div class='sidebar-movie-tag-row'>
				<p class='title'># ${t.title}</p>
				<p class='explanation'>게시물 ${fn:length(t.reviews)}개 팔로워 ${fn:length(t.followers)}명</p>
			</div>
		</c:forEach>
	</div>
</div>
