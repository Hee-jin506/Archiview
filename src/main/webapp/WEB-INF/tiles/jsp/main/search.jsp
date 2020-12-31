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
   height: 460px;
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
   
   #movie-list {
   margin-bottom: 40px;
   }
   
   #movie-list img {
   float: left;
   margin-left: 5px;
   margin-top: 20px;
   }
   
   #movie-title {
    padding-left: 360px;
    font-size: x-large;
    padding-top: 20px;
   }
   
   #movie-etitle {
    padding-left: 365px;
    padding-top: 20px;
    font-size: x-small;
    padding-bottom: 20px;
   }
   
   #movie-opendate {
    padding-left: 360px;
   }
   
   #movie-runtime {
    padding-left: 450px;
    margin-top: -26px;
    padding-bottom: 10px;
   }
   
   #movie-directors {
    padding-left: 450px;
    margin-top: -26px;
    padding-bottom: 10px;
    padding-right: 5px;
   }
   
   #movie-actors {
    padding-left: 450px;
    margin-top: -26px;
    padding-bottom: 20px;
    padding-right: 5px;
   }
   
   #movie-synop {
   padding-left: 360px;
   padding-bottom: 30px;
   padding-right: 5px;
   }
   
   #movie-link {
    padding-left: 360px;
   }
   
   #movie-text {
    padding-left: 360px;
    padding-top: 20px;
    color: #626473;
    padding-bottom: 10px;
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
   height: 200px;
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
   padding-top: 10px;
   font-size: small;
   color: #626473;
   }

   #follow-button {
   padding-left: 500px;
   margin-top: -40px;
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

   #movie-contents::-webkit-scrollbar {
  display: none;
 }

  #member-contents::-webkit-scrollbar {
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
List<Tag> tags = (List<Tag>) request.getAttribute("tags");
%>


<%
if (reviews.size() == 0) {
  if (members.size() != 0 && movies.size() != 0) {
    %>
    <div id ="member-contents">
      <div id = "member">
        <p>리뷰어</p>
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
        <%
        if (member.getNo() != loginUser.getNo()) {
          for (Follow follow : follows) {
            if (follow.getFollowedType() == 1 && follow.getFollowingMember().getNo() == loginUser.getNo()) {
          %>
          <div>
            <div id = "follow-button"><button type="submit" formaction='../follow/deleteUser?followedNo=<%=member.getNo()%>' class="btn btn-twitter">팔로우</button> </div>
          </div>
          <%
            } else if (follow.getFollowedType() == 1 && follow.getFollowingMember().getNo() != loginUser.getNo()) {
              %>
              <div>
                <div id = "follow-button"><button type="submit" formaction='../follow/addUser?followedNo=<%=member.getNo()%>' class="btn btn-archiview">팔로우</button> </div>
              </div>
              <%
            }
          }
        } else {

        }
        %>
        <br>
      <%
      }
      %>
    </div>
    
    <div id = "movie-contents">
      <div id = "movie">
        <p>영화</p>
        <hr>
      </div>
        <%
  for (Movie movie : movies) {
  %>
  <br>
  <div id = "movie-list">
  <% 
    if (movie.getPosters().size() != 0) {
      %>
    <div id = "movie-poster"><img src=<%=movie.getPosters().get(0).toString()%>></div>
    <%
    } else {
      %>
    <div id = "movie-poster"><img src="<%=getServletContext().getContextPath()%>/upload/movie_image.jpg"></div>
    <%
    }
    %>
    <div id = "movie-title"><%=movie.getTitle()%></div>
    <div id = "movie-etitle"><%=movie.getEnglishTitle()%></div>
    <div id  = "movie-text">상영 시간</div>
    <div id = "movie-runtime"><%=movie.getRuntime()%> 분</div>
    <div id  = "movie-text">감독</div>
    <div id = "movie-directors"><%=movie.getDirectors()%></div>
    <div id  = "movie-text">출연</div>
    <div id = "movie-actors"><%=movie.getActors()%></div>
    <div id = "movie-synop"><%=movie.getSynopsis()%></div>
  </div>
    <div id = "movie-link">더보기</div>

  <%
  }
  %>
</div> 
<%
} else if (members.size() != 0 && movies.size() == 0) {
%>
<div id ="member-contents">
  <div id = "member">
    <p>리뷰어</p>
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
    <%
        if (member.getNo() != loginUser.getNo()) {
          for (Follow follow : follows) {
            if (follow.getFollowedType() == 1 && follow.getFollowingMember().getNo() == loginUser.getNo()) {
          %>
          <div>
            <div id = "follow-button"><button type="submit" formaction='../follow/deleteUser?followedNo=<%=member.getNo()%>' class="btn btn-twitter">팔로우</button> </div>
          </div>
          <%
            } else if (follow.getFollowedType() == 1 && follow.getFollowingMember().getNo() != loginUser.getNo()) {
              %>
              <div>
                <div id = "follow-button"><button type="submit" formaction='../follow/addUser?followedNo=<%=member.getNo()%>' class="btn btn-archiview">팔로우</button> </div>
              </div>
              <%
            }
          }
        } else {

        }
        %>
        <br>
      <%
      }
      %>
    </div>
  
  
<div id = "movie-contents">
  <div id = "movie">
    <p>영화</p>
    <hr>
    <p>영화가 없습니다.</p>
  </div>
</div> 
  
<%
} else if (members.size() == 0 && movies.size() != 0) {
%>
<div id ="member-contents">
  <div id = "member">
    <p>리뷰어</p>
    <hr>
    <p>리뷰어가 없습니다.</p>
  </div>
</div>
    
    
<div id = "movie-contents">
  <div id = "movie">
    <p>영화</p>
    <hr>
  </div>
  <%
  for (Movie movie : movies) {
    %>
    <br>
    <div id = "movie-list">
   <% 
    if (movie.getPosters().size() != 0) {
      %>
    <div id = "movie-poster"><img src=<%=movie.getPosters().get(0).toString()%>></div>
    <%
    } else {
      %>
    <div id = "movie-poster"><img src="<%=getServletContext().getContextPath()%>/upload/movie_image.jpg"></div>
    <%
    }
    %>
      <div id = "movie-title"><%=movie.getTitle()%></div>
      <div id = "movie-etitle"><%=movie.getEnglishTitle()%></div>
      <div id  = "movie-text">상영 시간</div>
      <div id = "movie-runtime"><%=movie.getRuntime()%> 분</div>
      <div id  = "movie-text">감독</div>
      <div id = "movie-directors"><%=movie.getDirectors()%></div>
      <div id  = "movie-text">출연</div>
      <div id = "movie-actors"><%=movie.getActors()%></div>
      <div id = "movie-synop"><%=movie.getSynopsis()%></div>
      <div id = "movie-link">더보기</div>
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
      <p>리뷰어</p>
      <hr>
      <p>리뷰어가 없습니다.</p>
    </div>
  </div>
    
    
  <div id = "movie-contents">
    <div id = "movie">
      <p>영화</p>
      <hr>
      <p>영화가 없습니다.</p>
    </div>
  </div>
  <%
  } 
} else {

    for (Tag tag : tags) {
      %>
      태그검색
      <td><%=tag.getTitle()%></td>
      <%
  }
}
%>


</body>
</html>