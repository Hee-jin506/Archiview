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
      <%
        if (!review.getWriterNick().equals(((Member) (request.getAttribute("loginUser"))).getNickName())) {
      %>
      <%
        if (review.getIsFollowing() != 0) {
      %>
      <div class='follow'>
        <form action='<%=getServletContext().getContextPath()%>/app/follow/deleteUser'>
        <input type='hidden' name='followedNo' value=<%=review.getWriterNo() %>>
          <button class="btn btn-twitter">팔로우</button>
        </form>
      </div>
      <%} else {%>
      <div class='follow'>
        <form action='<%=getServletContext().getContextPath()%>/app/follow/addUser'>
        <input type='hidden' name='followedNo' value=<%=review.getWriterNo() %>>
          <button class="btn btn-archiview">팔로우</button>
        </form>
      </div>
      <%
        }
      }
      %>
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
        </div>
      </div>
      </div>
    </div>
    
    <div class='stillcut' data-no='<%=review.getNo() %>'>
      <%if (review.getStcUrl() != null) {%>
      <img src=<%=review.getStcUrl()%> data-no='<%=review.getNo() %>'>
      <%
        }
      %>
      <div class='reviewText_box'>
          <span class='reviewText'><%=review.getText()%>
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
      <%
        if (review.getIsLiking() != 0) {
      %>
      <div class='like' id='liking'>
        <a
          href='<%=getServletContext().getContextPath()%>/app/like/dislikeReview?likedNo=<%=review.getNo()%>'>
          <img
          src='<%=getServletContext().getContextPath()%>/main_resource/like2.png'
          alt='좋아요'>
        </a> <span class='pop'><%=review.getLiking()%>개</span>
      </div>
      <%} else {
      %>
      <div class='like' id='notLiking'>
        <a
          href='<%=getServletContext().getContextPath()%>/app/like/likeReview?likedNo=<%=review.getNo()%>'>
          <img
          src='<%=getServletContext().getContextPath()%>/main_resource/like.png'
          alt='좋아요'>
        </a> <span class='pop'><%=review.getLiking()%>개</span>
      </div>
      <%
      }%>
    </div>
  <div class='reviewDetail'>
  <button></button>
  </div>
  </div>
  <%
  }%>

  <div></div>
  
  
  <script>
      "use strict" 
      var el = document.querySelectorAll("#notLiking a img")
      
      for (var e of el) {
        e.addEventListener("mouseover", function(e) {
              console.log(this);
              // 이벤트가 발생한 객체의 속성 값 알아내기
              this.setAttribute("src", "<%=getServletContext().getContextPath()%>/main_resource/like2.png");  // undefined
            });
      }
      
      for (var e of el) {
        e.addEventListener("mouseout", function(e) {
                console.log(this);
                // 이벤트가 발생한 객체의 속성 값 알아내기
                this.setAttribute("src", "<%=getServletContext().getContextPath()%>/main_resource/like.png");  // undefined
              });
        }
      
      var el = document.querySelectorAll(".card .cardHeader img.more")
      
      for (var e of el) {
        e.addEventListener("click", function(e) {
              console.log(this);
              // 이벤트가 발생한 객체의 속성 값 알아내기
              this.setAttribute("src", "<%=getServletContext().getContextPath()%>/main_resource/like2.png");  // undefined
            });
      }
      
var el = document.querySelectorAll('.more');
var menuContents = document.querySelectorAll('.dropdown-content1');

for (var element of el) {
  element.addEventListener("click", function(e) {
          var no = this.getAttribute("data-no");
        for (var menu of menuContents) {
          console.log(menu.getAttribute("data-no"));
            if (menu.getAttribute("data-no") == no) {
          console.log(menu.getAttribute("data-no"), this.getAttribute("data-no")); 
                 if(menu.style.display===""){
                   menu.style.display="block";
                   } else {
                     menu.style.display="";
                   }
              
            }
          }
});
}
</script>
</div>