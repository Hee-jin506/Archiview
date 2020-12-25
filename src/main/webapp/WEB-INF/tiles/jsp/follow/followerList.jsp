<%@page import="bitcamp.acv.domain.Follow"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<br>
<br>
<br>
<br>
<br>

<ul>
<c:forEach items="${followList}" var="f">
    <li>${f.no}</li>
    <li>${f.followingMember.nickName}</li>
    <li>${f.followedNo}</li>
</c:forEach>
</ul>
