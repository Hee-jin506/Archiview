<%@page import="java.util.List"%>
<%@page import="bitcamp.acv.domain.Movie"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>후기 등록 : 영화 검색 결과</title>
</head>
<body>
	<h1>리뷰를 작성할 영화를 찾아볼까요?</h1>
	<%
	  String keyword = request.getParameter("keyword");
	%>
	<form>
		<input type='search' name='keyword'
			value='<%=keyword == null ? "제목, 감독, 배우로 검색" : keyword%>'><br>
		<button>검색</button>
		<a href='../main.html'>나중에 할래요</a>
	</form>
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
</body>
</html>