<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     

<jsp:include page="/main/admin-topbar.jsp"></jsp:include>

<h1>[테스트]</h1>

<c:forEach items="${tags}" var="t">
# ${t} 
</c:forEach>