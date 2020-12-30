<%@page import="bitcamp.acv.domain.Font"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 등록 : 카드 편집</title>
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
    
    #editCardFormContainer {
    padding-top : 58px;
    margin: 0 auto;
    }
    #editCardFormContainer h1 {
      font-size: 25px;
      font-weight: bold;
      text-align: center;
    }
    
    #editCardFormStillcut {
    margin: 0 auto;
    margin-top : 40px;
    }
    #editCardFormStillcut img{
   width : 720px;
    }
    
    .mb-3 {
    width : 500px;
    }
    
    #editCardFormContainer #hiddenSpace {
    width:190px;
    float:right;
    margin:20px;
    }
    
    #editCardFormContainer button {
    font-weight : bold;
    width:100px;
    float:right;
    margin:20px;
    margin-top:45px;
    }
    
</style>
</head>
<body>
<div id='writeReview'>
<div id='editCardFormContainer'>
	<h1>자기만의 감성으로 카드를 꾸며주세요!</h1>
	<%
    if (!request.getParameter("stc").equals("default")) {
    %>
    <div id='editCardFormStillcut'>
	<img src='<%=request.getParameter("stc")%>' alt='<%= request.getParameter("stc")%>'>
	<%
    }
	   %>
	  </div>
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

		</select></label> <input type='hidden' name='movieNo'
			value='${sessionScope.movieNo}'> <input
			type='hidden' name='stc' value='<%=request.getParameter("stc")%>'>
			
			<label for="fontSize" class="form-label">폰트크기</label>
			<input type="range" class="form-range" min="10" max="50" step="1" value='30' id="fontSize">
			
			<div class="mb-3" id="editCardForm">
        <textarea class="form-control" id="exampleFormControlTextarea1" rows="4" cols='70' name='text'></textarea>
      </div> 
			<label>태그<input type='text' name='tag'></label>
			<label>x좌표<input type='range' name='x' min='0' max='665' value='332'></label>
		  <label>y좌표<input type='range' name='y' min='0' max='443' value='221'></label>
		  <div id="hiddenSpace">
              </div>
		  <button class="btn btn-primary btn-sm btn-dark" >리뷰 등록</button>
	</form>
		  <button class="btn btn-primary btn-sm btn-dark" onclick="goBack()">뒤로</button>
	</div>
</div>
</body>
</html>