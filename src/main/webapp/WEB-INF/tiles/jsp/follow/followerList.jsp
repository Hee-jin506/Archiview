<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="appRoot" value="${pageContext.servletContext.contextPath}"/>

<div id = 'followerList'>
<c:forEach items="${targetTaglist}" var="t"> 
  <p>#${t.title}</p>
  ${t.reviews}<br>
</c:forEach>

<c:forEach items="${targetMemberlist}" var="m"> 
  <p><img src="${appRoot}/upload/${m.photo}_35x35.jpg"> ${m.nickName}</p>
  ${m.intro}<br>
</c:forEach>
</div>