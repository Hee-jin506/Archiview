<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<c:forEach items="${tagList}" var="t">
<a href='../main/search?selectedTagTitle=${t.title}'>#${t.title}</a><br>
</c:forEach>

${selectedTag.title}