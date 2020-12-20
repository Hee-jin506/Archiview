<%@page import="java.util.List"%>
<%@page import="bitcamp.acv.domain.Member"%>
<%@page import="bitcamp.acv.domain.Comment"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="javax.servlet.ServletContext"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head><title>코멘트 화면</title>
<style>body {background-color: #000000;color: #ffffff;}</style>
</head>
<body>

<jsp:include page="/main/admin-topbar.jsp"></jsp:include>

<h1>[코멘트] </h1>
<br>

<%
List<Comment> comments = (List<Comment>) request.getAttribute("view");
HttpSession s = request.getSession();
Member loginUser = (Member) s.getAttribute("loginUser");
%>

<table border="1">
<thead>
<tr>
<th>댓글 번호</th>
<th>사진</th>
<th>작성자 닉네임</th>
<th>내용</th>
<th>그룹 번호</th>
<th>레벨</th>
<th>등록일</th>
</tr></thead>



<tbody>
<c:forEach items="${view}" var="c"> 
<tr>
<c:choose>
  <c:when test='${c.status == 1}'>
<td>${c.no}</td>
<td><img src='../../upload/${c.member.photo}_150x150.jpg'></td>

<c:set var='level' value='${c.level}'/>
<c:choose>
  <c:when test='${c.level == 1}'>
<td>${c.member.nickName}</td>
<td>${c.content}<br>

<form method='post'>
<input type='hidden' name='targetNo' value='${c.no}'>
<input type='hidden' name='groupNo' value='${c.groupNo}'>
<input type='hidden' name='level' value='${c.level}'>
  <button>대댓글 등록</button>
</form>

<form action='../../app/comment/delete' method='post'>
<input type='hidden' name='no' value='${c.no}'>
<input type='hidden' name='reviewNo' value='${c.reviewNo}'>
<button>삭제</button>
</form>

 </td>
    </c:when>
  <c:otherwise>
<td>${c.member.nickName}</td>
<td>${c.content}<br>

<form action='../../app/comment/delete' method='post'>
<input type='hidden' name='no' value='${c.no}'>
<input type='hidden' name='reviewNo' value='${c.reviewNo}'>
<button>삭제</button>
</td>
  </c:otherwise>
</c:choose>

<td>${c.groupNo}</td>
<td>${c.level}</td>
<td>${c.registeredDate}</td>
    </c:when>
  <c:otherwise>
<td> 삭제된 코멘트입니다. </td>
  </c:otherwise>
</c:choose>
</tr>
</c:forEach>
</tbody>
</table>



<br>


<%
String targetWriter = null;
String targetNo = request.getParameter("targetNo");

if (targetNo != null) {
    for (Comment comment : comments) {
      if (comment.getNo()==Integer.parseInt(targetNo)) {
        targetWriter = comment.getMember().getNickName();
    }
  }

%>
<form action="../comment/add" method="post">
<input type='hidden' name='targetNo' value=<%=request.getParameter("targetNo") %>>
<input type='hidden' name='reviewNo' value=<%=request.getParameter("reviewNo")%>>
<input type='hidden' name='groupNo' value=<%=request.getParameter("groupNo")%>>
<input type='hidden' name='level' value=<%=request.getParameter("level")%>>
코멘트 :
<input type='text' name='content' value='<%= targetWriter != null ? "@" + targetWriter : ""%>'>
<button>등록</button>
</form>
<%
} else {
  int rno = comments.get(0).getReviewNo();
  int gno = comments.size() + 1;
%>
<form action="../comment/add" method="post">
  코멘트 :  
<input type='text' name='content' value=''>
<input type='hidden' name='reviewNo' value=<%=rno%>>
<input type='hidden' name='groupNo' value=<%=gno%>>
<input type='hidden' name='level' value=<%=0%>>
<button>등록</button>
</form>
<%
}
%>

<br>

</body>
</html>
