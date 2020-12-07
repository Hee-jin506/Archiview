<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화관리(상세조회)</title>
</head>

<body>
영화번호    ${movie.no}<br>
등록일      ${movie.registeredDate}<br>
제목        ${movie.title}<br>
영문명      ${movie.englishTitle}<br>
장르        <c:forEach items="${movie.genres}" var="ganre">${ganre},</c:forEach><br>
상영시간    ${movie.runtime}분<br>
감독        ${movie.directors}<br>
제작국가    ${movie.nation}<br>
개봉일      ${movie.openDate}<br>
출연        ${movie.actors}<br>
시놉시스    ${movie.synopsis}<br>

포스터<br>
<c:forEach items="${movie.posters}" var="poster"><img src='${poster}' width='120'></c:forEach><br>

스틸컷<br>
<c:forEach items="${movie.stillcuts}" var="stillcut"><img src='${stillcut}' width='120'></c:forEach><br>

<a href='update?no=${movie.no}'>[수정]</a>
<a href='delete?no=${movie.no}'>[삭제]</a>
<a href='active?no=${movie.no}'>[복구]</a>
<a href='list'>[취소]</a>

</body>
</html>