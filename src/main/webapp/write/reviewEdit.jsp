<%@page import="bitcamp.acv.domain.Font"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 등록 : 카드 편집</title>
</head>
<body>
	<h1>자기만의 감성으로 카드를 꾸며주세요!</h1>
	<img src='<%=request.getAttribute("url")%>'>
	<form action='add' method='post'>
		<label>폰트<select name='font'>
				<%
				  List<Font> fonts = (List<Font>) request.getAttribute("fonts");
				for (Font font : fonts) {
				%>
				<option value='<%=font.getNo()%>'><%=font.getName()%></option>
				<%
}
%>
		</select></label> 
		<input type='hidden' name='stc' value='<%=request.getParameter("stc")%>'>
		<label>폰트크기<input type='range' name='size' min='10' max='50' value='30' ></label><br> 
		<label>내용<textarea rows='10' cols='70' name='text'></textarea></label><br> 
		<label>태그<input type='text' name='tag'></label><br> 
		<label>x좌표<input type='range' name='x' min='0' max='665' value='332'></label><br>
		<label>y좌표<input type='range' name='y' min='0' max='443' value='221'></label><br> 
		<a href='chooseStc'>뒤로</a>
		<button>리뷰 등록</button>
	</form>
</body>
</html>