<%@page import="java.util.Map"%>
<%@page import="bitcamp.acv.domain.Tag"%>
<%@page import="bitcamp.acv.domain.Member"%>
<%@page import="java.util.List"%>
<%@page import="bitcamp.acv.domain.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id='cards'>
  <%
    List<Review> list = (List<Review>) request.getAttribute("list");
  for (Review review : list) {
  %>
  <div class='card'>
    <div class='cardHeader'>
      <a
        href='<%=getServletContext().getContextPath()%>/app/member/profile?no=<%=review.getWriterNo()%>'>
        <img class='profile'
        src='<%=getServletContext().getContextPath() + "/upload/" + review.getWriterPhoto() + "_35x35.jpg"%>'>
      </a> <a class='nickname'
        href='<%=getServletContext().getContextPath()%>/app/member/profile?no=<%=review.getWriterNo()%>'>
        <%=review.getWriterNick()%></a>
      
      <div class="follow">
         <c:choose>
         
          <c:when test="${review.writerNick==loginUser.nickName}">
          </c:when>
          
          <c:when test="${review.writerNick!=loginUser.nickName}">
             <button 
               class='${review.isFollowing != 0 ? "btn btn-twitter" : "btn btn-archiview"}'
               data-no='${review.writerNo}'
               target-type='member'
               follow='${review.isFollowing != 0  ? "following" : "notFollowing"}'>
               팔로우
             </button>
          </c:when>
          
         </c:choose>
       </div>
      
      
      
      <div class=moreIconBox>
      <div class="dropdown1">
      <button class='more' data-no='<%=review.getNo()%>'>
        <img src='<%=getServletContext().getContextPath()%>/main_resource/more.png' >
      </button>
        <div class="dropdown-content1" data-no='<%=review.getNo()%>'>
        <c:if test='<%=review.getWriterNick().equals(((Member) (request.getAttribute("loginUser"))).getNickName())%>'>
          <a href="#">수정</a>
          <hr style="margin: 0px;">
          <a href="<%=getServletContext().getContextPath()%>/app/review/delete?no=<%=review.getNo()%>" style="color: #f21b9c">삭제</a>
        </c:if>
        <c:if test='<%=!review.getWriterNick().equals(((Member) (request.getAttribute("loginUser"))).getNickName())%>'>
          <a herf="#">신고</a>
        </c:if>
        </div>
      </div>
      </div>
    </div>
    
    <div class='stillcut' data-no='<%=review.getNo() %>'>
      <%if (review.getStcUrl() != null) {%>
      <img src=<%=review.getStcUrl()%> data-no='<%=review.getNo() %>'>
      <%
        } else {
          %>
          <div class='no-stillcut'>
          </div>
          <%
        }
      %>
      <div class='reviewText_box'>
          <span class='reviewText' style='top:<%=review.getTextY() %>%; left:<%=review.getTextX() %>%;'><%=review.getText()%>
          </span>
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
      <a class='movie'><%=review.getMovieTitle()%></a>
      <p class='rdt'><%=(review.getRdtFromNow())%></p>
      <div class='like'>
          <img
	          src='<%=getServletContext().getContextPath()%>/main_resource/<%=review.getIsLiking() != 0 ? "like2.png" : "like.png"%>'
	          alt='좋아요'  
	          data-no='<%=review.getNo()%>' 
	          like='<%=review.getIsLiking() != 0 ? "liking" : "notLiking" %>'>
         <span class='pop' data-no='<%=review.getNo()%>'><%=review.getLiking()%>개</span>
      </div>
    </div>
  <div class='reviewDetail'>
  <button></button>
  </div>
  </div>
  <%
  }%>

</div>
  
