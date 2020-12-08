<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화관리(상세조회)</title>
<style>

 html {
    background-color: #000000;
    color: #ffffff;
    }
    
 #movie_info {
 width: 50%;
 text-align: left;
 }
 
 #aside {
 float: right;
 width: 45%;
 margin-top: -350px;
 }
 
 #movie_body {
    color: white;
    font-size: xx-small;
 }
 
 #menu {
 text-align: right;
 }
 
 #syn {
 width: 85%;
 }
</style>
</head>

<body>
<table id="movie_info" border="0">
	 <tbody id="movie_body">
	  <tr><th id="movie_no">영화번호</th><td>${movie.no}</td></tr>
	  <tr><th id="movie_rdt">등록일</th><td>${movie.registeredDate}</td></tr>
	  <tr><th id="movie_title">제목</th><td>${movie.title}</td></tr>
	  <tr><th id="movie_eng">영문명</th><td>${movie.englishTitle}</td></tr>
	  <tr><th id="movie_gnr">장르</th><td><c:forEach items="${movie.genres}" var="ganre">${ganre},</c:forEach></td></tr>
	  <tr><th id="movie_run">상영시간</th><td>${movie.runtime}분</td></tr>
	  <tr><th id="movie_dir">감독</th><td>${movie.directors}</td></tr>
	  <tr><th id="movie_nat">제작국가</th><td>${movie.nation}</td></tr>
	  <tr><th id="movie_odt">개봉일</th><td>${movie.openDate}</td></tr>
	  <tr><th id="movie_act">출연</th><td>${movie.actors}</td></tr>
	  <tr><th id="movie_syn">시놉시스</th><td id="syn">${movie.synopsis}</td></tr>
	 
	 </tbody>
</table>

<div id ="aside">
	<div id="menu">
	<a href='update?no=${movie.no}'>[수정]</a>
	<a href='delete?no=${movie.no}'>[삭제]</a>
	<a href='active?no=${movie.no}'>[복구]</a>
	<a href='list'>[취소]</a><br>
	</div>

	<div id="post">포스터<br>
	<c:forEach items="${movie.posters}" var="poster"><img src='${poster}' width='120'></c:forEach><br>
  </div>

	<div id="still">스틸컷<br>
	<c:forEach items="${movie.stillcuts}" var="stillcut"><img src='${stillcut}' width='120'></c:forEach><br>
  </div>
</div>
</body>
</html>