<%@page import="bitcamp.acv.domain.Comment"%>
<%@page import="bitcamp.acv.domain.Member"%>
<%@page import="bitcamp.acv.domain.Tag"%>
<%@page import="java.util.List"%>
<%@page import="bitcamp.acv.domain.Review"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%Review review = (Review)request.getAttribute("review"); 
System.out.println(review.getText());%>
  <div id='cardDetail'>
  <div id='cardPart'>
    <div class='cardHeader'>
      <p class='movie'><%=review.getMovieTitle()%>.archiview</p>
      <img class='more' src='<%=getServletContext().getContextPath()%>/main_resource/more.png'>
    </div>
    
    <div class='stillcut'>
      <%if (review.getStcUrl() != null) {%>
      <img src=<%=review.getStcUrl()%>>
      <%
        }
      %>
      <div class='reviewText'>
        <p><%=review.getText()%>
        </p>
      </div>

      <div class='tags'>
        <%
          List<Tag> tags = review.getTags();
        for (Tag tag : tags) {
          if (tag.getTitle() != null) {
        %>
        <a class='tag'
          href='<%=getServletContext().getContextPath() + "/app/main/search?keyword=%23" + tag.getTitle()%>'>
          #<%=tag.getTitle()%></a>
        <%}
}%>
      </div>
    </div>

    <div class='cardFooter'>
    <a
        href='<%=getServletContext().getContextPath()%>/app/member/profile?no=${tm.no}'>
        <img class='profile'
        src='<%=getServletContext().getContextPath() + "/upload/" + review.getWriterPhoto() + "_35x35.jpg"%>'>
      </a> <a class='nickname'
        href='<%=getServletContext().getContextPath()%>/app/member/profile?no=${tm.no}'>
        <%=review.getWriterNick()%></a>
      <%
        if (!review.getWriterNick().equals(((Member) (request.getAttribute("loginUser"))).getNickName())) {
      %>
      <%
        if (review.getIsFollowing() != 0) {
      %>
      <div class='follow'>
        <form>
          <button class="btn btn-twitter">팔로우</button>
        </form>
      </div>
      <%} else {%>
      <div class='follow'>
        <form>
          <button class="btn btn-archiview">팔로우</button>
        </form>
      </div>
      <%
        }
      }
      %>

      <p class='rdt'><%=(review.getRdtFromNow())%></p>
      <%
        if (review.getIsLiking() != 0) {
      %>
      <div class='like'>
        <a
          href='<%=getServletContext().getContextPath()%>/app/like/dislikeReview?likedNo=<%=review.getNo()%>'>
          <img
          src='<%=getServletContext().getContextPath()%>/main_resource/like2.png'
          alt='좋아요'>
        </a> <span class='pop'><%=review.getLiking()%>개</span>
      </div>
      <%} else {
      %>
      <div class='like'>
         <a
          href='<%=getServletContext().getContextPath()%>/app/like/likeReview?likedNo=<%=review.getNo()%>'>
          <img
          src='<%=getServletContext().getContextPath()%>/main_resource/comment.png'
          alt='댓글 보기'>
        </a>

        <a
          href='<%=getServletContext().getContextPath()%>/app/like/likeReview?likedNo=<%=review.getNo()%>'>
          <img
          src='<%=getServletContext().getContextPath()%>/main_resource/like.png'
          alt='좋아요'>
        </a> <span class='pop'><%=review.getLiking()%>개</span>
        
        <a
          href='<%=getServletContext().getContextPath()%>/app/like/likeReview?likedNo=<%=review.getNo()%>'>
          <img
          src='<%=getServletContext().getContextPath()%>/main_resource/save.png'
          alt='저장'>
        </a>
        
        <a
          href='<%=getServletContext().getContextPath()%>/app/like/likeReview?likedNo=<%=review.getNo()%>'>
          <img
          src='<%=getServletContext().getContextPath()%>/main_resource/info-circle.png'
          alt='영화 상세'>
        </a>

      </div>
      <%
      }%>
    </div>
    </div>


<div class='comments'>
<h1>[코멘트] </h1>
<br>

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


<%
List<Comment> comments = (List<Comment>) request.getAttribute("view");
for (Comment comment : comments) {
  System.out.print("댓글" + comment.getContent());
  System.out.println("  => 댓글 상태" + comment.getStatus());
}
HttpSession s = request.getSession();
Member loginUser = (Member) s.getAttribute("loginUser");
%>

<%

System.out.println(comments.size());
int count = 0;
%>
<script>
var comments = new Array();
var count= 0;
</script>

<tbody>
  <c:forEach items="${view}" var="c"> 
  <tr>
    <c:choose>
      <c:when test='${c.status == 1}'>
        <td>${c.no}</td>
        <td><img src='<%=getServletContext().getContextPath()%>/upload/${c.member.photo}_150x150.jpg'></td>

            <c:choose>
  <c:when test='${c.level == 1}'>
  <!-- 대댓글 -->
    <td>${c.member.nickName}</td>
    <td>${c.content}
    <br>
        <input type='hidden' name='targetNo' value='${c.no}'>
        <input type='hidden' name='groupNo' value='${c.groupNo}'>
        <input type='hidden' name='level' value='${c.level}'>
        <button class='level-2' data-no='<%=count%>'>대댓글 등록</button>
        <%count++; %>

        <script>
        comments[count] = {
        		targetNo: ${c.no},
        		writer: "${c.member.nickName}"
        };
        count++;
        </script>
    <br>
      <form action="../../comment/delete" method="post">
        <input type='hidden' name='no' value='${c.no}'>
        <input type='hidden' name='reviewNo' value=<%=request.getParameter("reviewNo")%>>
        <button>삭제</button>
      </form>
 </td>
    </c:when>
  <c:otherwise>
  <!-- 댓글 -->
    <td>${c.member.nickName}</td>
    <td>${c.content}<br>
      <br>
      <form action="../../delete" method="post">
        <input type='hidden' name='no' value='${c.no}'>
        <input type='hidden' name='reviewNo' value=<%=request.getParameter("reviewNo")%>>
        <button>삭제</button>
      </form>
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
<form action="../../comment/add" method="post" class="register">
<input type='hidden' name='reviewNo' value='<%=request.getParameter("reviewNo")%>'>
<input type='hidden' name='level' value='1'>
코멘트 :
<input type='text' name='content'>
<button>등록</button>
</form>
</div>

<script>
var level2btn = document.querySelectorAll(".level-2");
var register = document.querySelector(".register");
var targetNo, groupNo, level;

for (var e of level2btn) {
  e.onclick = function(e) {
      dataNo = e.target.getAttribute("data-no");
      var comment = comments[dataNo];
      var originContent = register.innerHTML;
      register.innerHTML = originContent + 
         "<input type='hidden' name='targetNo' value='"+ comment.targetNo +"'>";
      document.querySelector(".register input[name='level']").setAttribute("value", 2);
      document.querySelector(".register input[name='reviewNo']").setAttribute("value", ${param.reviewNo});
      document.querySelector(".register input[name='content']").setAttribute("value", "@" + comment.writer +" ");
      console.log(register.innerHTML)
    };
  }

</script>
  </div>
  
