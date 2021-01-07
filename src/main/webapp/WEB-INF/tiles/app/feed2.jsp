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
          <c:when test="${review.writerNick==sessionScope.loginUser.nickName}">
          </c:when>
          <c:when test="${review.writerNick!=sessionScope.loginUser.nickName}">
             <button 
               class='${review.isFollowing != 0 ? "btn btn-twitter" : "btn btn-archiview"}'
               target-no='${review.writerNo}'
               target-type='Member'
               follow='${review.isFollowing != 0  ? "following" : "notFollowing"}'>
               팔로우
             </button>
          </c:when>
         </c:choose>
       </div>
        <div class="modal fade" id="unfollowModalMember${review.writerNo}" tabindex="-1" 
                     aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">팔로우 취소</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  ${review.writerNick}님의 팔로우를 취소하시겠어요?
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아뇨</button>
                  <button type="button" 
                  class="btn btn-primary unfollow" 
                  data-bs-dismiss="modal" 
                  target-no='${review.writerNo}'
                  target-type='Member'}>네</button>
                </div>
              </div>
            </div>
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
  
