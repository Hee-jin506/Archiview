<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="bitcamp.acv.domain.Movie"%>
<!DOCTYPE html>
<html>
<head><title>영화 검색</title>
<style>
#writeReview {
  width : 720px;
  min-height: 700px;
  margin: 0 auto;
  margin-top: 75px;
  background: #1B1B1B;
  xpadding:70px;
  overflow: hidden;
  overflow-y: scroll;
  padding-bottom: 70px;
}

#writeReview::-webkit-scrollbar {
    display: none;
}

#movieSearchForm {
padding-top : 180px;
margin: 0 auto;
}
#movieSearchForm h1 {
  font-size: 25px;
  font-weight: bold;
  text-align: center;
}

#movieSearchForm input{
margin: 0 auto;
margin-top: 32px;
}
#movieSearchForm #notNow button{
display : block;
margin: 0 auto;
margin-top: 34px;
font-size: 14px;
}

/* 영화 검색결과 포스터 목록*/
#movieSearchResult {
margin: 0 auto;
margin-top: 50px;
margin-left: 60px;
margin-right: 60px;
xmargin-bottom: 60px;
font-size : 21px;
font-weight:bold;
}
#movieSearchResult #movieSearchResult_keyword{
color:white;
}
#movieSearchResult #movieSearchResult_affix{
color: #B9B9BA;
}
#movieSearchResultPosters #null{
color: #B9B9BA;
}
#movieSearchResultPosters {
xmargin: 0 auto;
margin-top: 34px;
}
#movieSearchResultPosters img{
float:left;
width:185px;
height:264.36px;
xmargin-left:20px;
margin-right:15px;
}

</style>
</head>
<body>
	<div id='writeReview'>
		<%
		  String keyword = request.getParameter("keyword");
		%>
		  <div id='movieSearchForm'>
				<h1>리뷰를 작성할 영화를 찾아볼까요?</h1>
				<form>
					<input class="archiview-movieSearch-form-control" type="text" name='keyword' 
					placeholder="<%=keyword == null ? "제목, 감독, 배우로 검색" : keyword%>"  >
				</form>
			  <div id='notNow'>
				<form action = "../../app/main">
			    <button class="btn btn-primary btn-sm btn-dark" formaction='../../app/main'>나중에 할래요</button>
				</form>
				</div>
			</div>
		<%
		  if (keyword != null) {
		%>
		<div id='movieSearchResult'>
			<span id='movieSearchResult_keyword'>
				'<%=keyword%>'
			</span>
			<span id='movieSearchResult_affix'>
				검색 결과
			</span>
			<div id='movieSearchResultPosters'>
			<%
			  List<Movie> movies = (List<Movie>) request.getAttribute("movies");
			if(movies==null) {
			  %>
			  <span id='null'>검색결과가 없습니다!</span>
			<%
			}
			for (Movie movie : movies) {
			%>
				<a href='chooseStc?movieNo=<%=movie.getNo()%>'>
				 <img src='<%=movie.getPosters().get(0)%>' alt='<%=movie.getTitle()%>'>
				</a>
		
		<%
		  }
		}
		%>
		 </div>
	  </div>
	</div>
</body>
</html>