<%@page import="java.util.List"%>
<%@page import="bitcamp.acv.domain.Movie"%>
<%@page import="bitcamp.acv.domain.Member"%>
<%@page import="bitcamp.acv.domain.Review"%>
<%@page import="bitcamp.acv.domain.Follow"%>
<%@page import="bitcamp.acv.domain.Tag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

  #movie-contents {
   box-sizing: border-box;
   border-radius: 10px;
   background-color: #141517;
   width: 650px; /* 너비 */
   padding-left: 20px;  /* 패딩 */
   padding-right: 20px;  /* 패딩 */
   padding-bottom: 20px;  /* 패딩 */
   float: left;  /* 왼쪽으로 플로팅 */
   min-height: 200px;
   overflow: hidden;
   overflow-y: scroll;
   -ms-overflow-style: none;
   scrollbar-width: none;
   margin-top: 10px;
 }
 
    #movie p {
   font: inherit;
   font-size: x-large;
   padding-top: 20px;
   }
   
   #movie hr {
   font-size: 100%;
   font: inherit;
   color: white;
   border: 0;
   height: 1px;
   background-color: #626473;
   margin-left: -10px;
   margin-right: -10px;
   }
 
   #member-contents {
   box-sizing: border-box;
   border-radius: 10px;
   background-color: #141517;
   width: 650px; /* 너비 */
   padding-left: 20px;  /* 패딩 */
   padding-right: 20px;  /* 패딩 */
   padding-bottom: 20px;  /* 패딩 */
   float: left;  /* 왼쪽으로 플로팅 */
   min-height: 100px;
   overflow: hidden;
   overflow-y: scroll;
   -ms-overflow-style: none;
   scrollbar-width: none;
   margin-top: 10px;
 }
   #member p {
   font: inherit;
   font-size: x-large;
   padding-top: 20px;
   }
   
   #member-list img {
   float: left;
   margin-left: 20px;
   }
   
   #nickName {
   padding-left: 70px;
   }
   
   #intro {
   padding-left: 70px;
   }
   
   #member hr {
   font-size: 100%;
   font: inherit;
   color: white;
   border: 0;
   height: 1px;
   background-color: #626473;
   margin-left: -10px;
   margin-right: -10px;
   }
   
   
 
   #tag-contents {
   box-sizing: border-box;
   border-radius: 10px;
   background-color: #141517;
   width: 650px; /* 너비 */
   padding-left: 20px;  /* 패딩 */
   padding-right: 20px;  /* 패딩 */
   padding-bottom: 20px;  /* 패딩 */
   float: left;  /* 왼쪽으로 플로팅 */
   height: 100px;
   overflow: hidden;
   overflow-y: scroll;
   -ms-overflow-style: none;
   scrollbar-width: none;
   margin-top: 10px;
 }
 
   #review-contents {
   box-sizing: border-box;
   border-radius: 10px;
   background-color: #141517;
   width: 650px; /* 너비 */
   padding-left: 20px;  /* 패딩 */
   padding-right: 20px;  /* 패딩 */
   padding-bottom: 20px;  /* 패딩 */
   float: left;  /* 왼쪽으로 플로팅 */
   height: 100px;
   overflow: hidden;
   overflow-y: scroll;
   -ms-overflow-style: none;
   scrollbar-width: none;
   margin-top: 10px;
 }
 

 
   #tag-contents img {
   padding-left: 50px;
   margin-top: 40px;
   border-radius: 100px;
 }
  
   #tag-contents p {
   padding-left: 150px;
    margin-top: -40px;
   }
   
   
 
   #movie-contents::-webkit-scrollbar {
  display: none;
 }

  #member-contents::-webkit-scrollbar {
  display: none;
 }
 
  #tag-profile::-webkit-scrollbar {
  display: none;
  }
  
  #review-detail::-webkit-scrollbar {
  display: none;
  }
 
 
 
 
 .p {
  font-size: x-large;
 }
 
 .hr {
  margin-left: -100px;
 }
 

</style>
</head>
<body>
<%
Member loginUser = (Member) session.getAttribute("loginUser");
List<Movie> movies = (List<Movie>) request.getAttribute("movies");
List<Member> members = (List<Member>) request.getAttribute("members");
List<Review> reviews = (List<Review>) request.getAttribute("reviews");
List<Follow> follows = (List<Follow>) request.getAttribute("follows");
%>


<%
if (reviews.size() == 0) {
  if (members.size() != 0 && movies.size() != 0) {
    %>
    <div id ="member-contents">
      <div id = "member">
        <p>리뷰어 있음</p>
        <hr>
      </div>
      <%
      for (Member member : members) {
      %>
          <br>
        <div id = "member-list">
          <input type='hidden' name='no' value='{member.no}'>
          <img class="profile" src='../../upload/<%=member.getPhoto()%>_35x35.jpg'>
        </div>
        <div id = "member-list2">  
          <div id="nickName"><%=member.getNickName()%></div>
          <div id="intro"><%=member.getIntro()%></div>
        </div>
        <br>
      <%
      }
      %>
    </div>
    
    <div id = "movie-contents">
      <div id = "movie">
        <p>영화 있음</p>
        <hr>
      </div>
      <%
      for (Movie movie : movies) {
      %>
      <div id = "movie-list">
      <tr>
        <td><%=movie.getTitle()%></td>
      </tr>
      </div>
      <%
      }
      %>
    </div> 
      <%
} else if (members.size() != 0 && movies.size() == 0) {
%>
<div id ="member-contents">
  <div id = "member">
    <p>리뷰어 있음</p>
    <hr>
  </div>
  <%   for (Member member : members) {
  %>
      <br>
    <div id = "member-list">
      <input type='hidden' name='no' value='{member.no}'>
      <a href="<%=getServletContext().getContextPath()%>/app/member/profile?no=<%=member.getNo()%>">
      <img class="profile" src='../../upload/<%=member.getPhoto()%>_35x35.jpg'> 
      </a>
      <div id="nickName"><%=member.getNickName()%></div>
      <div id="intro"><%=member.getIntro()%></div>

    </div>
    <br>
  <%
  }
  %>
</div>
  
  
<div id = "movie-contents">
  <div id = "movie">
    <p>영화 없음</p>
    <hr>
    <p>영화가 없습니다.</p>
  </div>
</div> 
  
<%
} else if (members.size() == 0 && movies.size() != 0) {
%>
<div id ="member-contents">
  <div id = "member">
    <p>리뷰어 없음</p>
    <hr>
    <p>리뷰어가 없습니다.</p>
  </div>
</div>
    
    
<div id = "movie-contents">
  <div id = "movie">
    <p>영화 있음</p>
    <hr>
  </div>
  <%
  for (Movie movie : movies) {
  %>
  <div id = "movie-list">
  <tr>
    <td><%=movie.getTitle()%></td>
  </tr>
  </div>
  <%
  }
  %>
</div> 
<%
} else {
  %>
  <div id ="member-contents">
    <div id = "member">
      <p>리뷰어 없음</p>
      <hr>
      <p>리뷰어가 없습니다.</p>
    </div>
  </div>
    
    
  <div id = "movie-contents">
    <div id = "movie">
      <p>영화 없음</p>
      <hr>
      <p>영화가 없습니다.</p>
    </div>
  </div>
  <%
  } 
}else {
  for (Review review : reviews) {
    %>
    태그검색
    <td><%=review.getMovieTitle()%></div>
    <%
    List<Tag> tags = review.getTags();
    for (Tag tag : tags) {
      %>
      태그검색
      <td><%=review.getTags()%></div>
      <%
    }
  }
}
%>


</body>
</html>