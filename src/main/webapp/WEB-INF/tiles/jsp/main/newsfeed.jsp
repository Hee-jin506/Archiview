<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="appRoot" value="${pageContext.servletContext.contextPath}" />

</head>
<body>
	<div id = "contents">
	
		<div id = "title">
			<div id = "title-text">뉴스피드</div>
			<hr>
		</div>
		
		<div id = "lists">
			<c:forEach var="n" items="${newsFeedList}">
			
				<c:set var="c" value="${n.no}" ></c:set>
				
			  <c:if test="${n.nick != loginUser.nickName}">
				  <div id="list">
					  <tr>
					    <td>
					     <a href="${appRoot}/app/member/profile?no=${n.no}"><img class="list-icon" src="${appRoot}/upload/${n.photo}_35x35.jpg">
					    </td>
					    <td>
					     ${n.nick}</a> 님이
					    </td> 
					    <c:if test="${n.targetType == 1}">
					      회원님의
					      <a class="list-href" href="${appRoot}/app/review/detail?no=${n.targetNo}">
					      <td>리뷰</a>를 좋아합니다. </td>
					      <td><h class="time">${times[c]}</h></td>
					    </c:if>
					    <c:if test="${n.targetType == 2}">
					      회원님의
					      <a class="list-href" href="${appRoot}/app/comment/view?no=${n.targetNo}">
					      <td>댓글</a>을 좋아합니다. </td>
					      <td><h class="time">${times[c]}</h></td>
					    </c:if>
					    <c:if test="${n.targetType == 3}">
					      <td>회원님을 팔로우 합니다.</td>
					      <td><h class="time">${times[c]}</h></td>
					    </c:if>
					  </tr>
				  </div>
			  </c:if>
			</c:forEach>
	  </div>
  </div>
</body>
