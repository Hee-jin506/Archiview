<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="appRoot" value="${pageContext.servletContext.contextPath}" />
   
<c:forEach items="${member.saved}" var="rv"> 
    <c:choose>
      <c:when test="${empty rv.stcUrl}">
        <img class='profile_bottom_review stillcut' data-no='${rv.no}' src="${appRoot}/main_resource/null.png">
      </c:when>
      <c:otherwise>
       <img class='profile_bottom_review stillcut' data-no='${rv.no}'  src='${rv.stcUrl}'>
      </c:otherwise>
    </c:choose>
</c:forEach>



