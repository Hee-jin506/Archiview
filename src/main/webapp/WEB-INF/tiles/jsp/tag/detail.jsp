<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head><title>태그 상세 조회</title></head>
<body>
<jsp:include page="../../admin/header.jsp"/>
<h3>[태그 상세 조회]</h3>
태그 번호: ${tag.no}<br>
태그명: ${tag.title}<br>
게시물 수:${tag.numOfReviews}<br>
등록일: ${tag.registeredDate}<br>
상태: ${tag.statusName}<br>
<a href='delete?no=${tag.no}'>삭제</a>
<a href='active?no=${tag.no}'>복구</a>
</body>
</html>
