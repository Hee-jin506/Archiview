<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="bitcamp.acv.domain.Movie"%>
<!DOCTYPE html>
<html>
<head><title>영화 검색</title>
<style>
.writeReview {
  width : 720px;
  height: 720px;
  margin: 0 auto;
  margin-top: 75px;
  background: #1B1B1B;
}

.movieSearchForm {
padding-top : 180px;
margin: 0 auto;
}
.movieSearchForm h1 {
  font-size: 25px;
  font-weight: bold;
  text-align: center;
}

.movieSearchForm input{
margin: 0 auto;
margin-top: 32px;
}
.movieSearchForm .notNow button{
display : block;
margin: 0 auto;
margin-top: 34px;
font-size: 14px;
}

</style>
</head>
<body>
<div class='writeReview'>
	<%
	  String keyword = request.getParameter("keyword");
	%>
	  <div class='movieSearchForm'>
			<h1>리뷰를 작성할 영화를 찾아볼까요?</h1>
			<form>
				<input  class="archiview-movieSearch-form-control" type="text" name='keyword' 
				placeholder="<%=keyword == null ? "제목, 감독, 배우로 검색" : keyword%>"  >
			</form>
		  <div class='notNow'>
			<form action = "../../app/main">
		    <button class="btn btn-primary btn-sm btn-dark" formaction='../../app/main'>나중에 할래요</button>
			</form>
			</div>
		</div>
	<%
	  if (keyword != null) {
	%>
	<h1>
		'<%=keyword%>'검색 결과
	</h1>
	<%
	  List<Movie> movies = (List<Movie>) request.getAttribute("movies");
	for (Movie movie : movies) {
	%>
	<a href='chooseStc?movieNo=<%=movie.getNo()%>'><img
		src='<%=movie.getPosters().get(0)%>' alt='<%=movie.getTitle()%>'></a>
	<%
	  }
	}
	%>
</div>
</body>
</html>