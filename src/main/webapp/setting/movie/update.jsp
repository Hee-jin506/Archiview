<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화관리(정보수정)</title>
</head>
<body>
  <form action='set' method='post'>");
      <button>수정</button>");
      <a href='detail?no=%d'>취소</a>
      <p>영화번호 <input type='text' name='mvno' value='${movie.no}' readonly></p>
      <p>등록일 <input type='date' name='rdt' value='${movie.registeredDate}'></p>
      <p>제목 <input type='text' name='title' value='${movie.title}'></p>
      <p>영문명 <input type='text' name='eng_title' value='${movie.englishTitle}'></p>
      <p>장르 <input type='text' name='gnr' value='${movie.genres}' readonly></p>
      <p>상영시간 <input type='text' name='runtime' value='${movie.runtime}'>분</p>
      <p>감독 <input type='text' name='dir' value='${movie.directors}'></p>
      <p>제작국가 <input type='text' name='nation' value='${movie.nation}'></p>
      <p>개봉일 <input type='date' name='odt' value='${movie.openDate}'></p>
      <p>출연 <input type='text' name='actors' value='${movie.actores}'></p>
      <p>시놉시스 <textarea name='syn' cols='40' rows='10'>${movie.synopsis}</textarea></p>
    </form>
  <div id="post">포스터<br>
  <c:forEach items="${movie.posters}" var="poster"><img src='${poster}' width='120'></c:forEach><br>
  </div>

  <div id="still">스틸컷<br>
  <c:forEach items="${movie.stillcuts}" var="stillcut"><img src='${stillcut}' width='120'></c:forEach><br>
  </div>
</body>
</html>