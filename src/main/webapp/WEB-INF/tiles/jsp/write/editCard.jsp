<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="appRoot" value="${pageContext.servletContext.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 등록 : 카드 편집</title>
<style>
#writeReview {
	width: 720px;
	min-height: 700px;
	margin: 0 auto;
	margin-top: 75px;
	background: #1B1B1B;
	xpadding: 70px;
	overflow: hidden;
	overflow-y: scroll;
	padding-bottom: 70px;
}

#writeReview::-webkit-scrollbar {
	display: none;
}

#editCardFormContainer {
	padding-top: 58px;
	margin: 0 auto;
}

#editCardFormContainer h1 {
	font-size: 25px;
	font-weight: bold;
	text-align: center;
}

#editCardFormStillcut {
	margin: 0 auto;
	margin-top: 40px;
	position: relative;
	padding: 0px;
	overflow: hidden;
}

#editCardFormStillcut img {
	width: 720px;
}

#editCardFormStillcut #text {
	position: absolute;
	left: 50%; top : 50%;
	transform: translate(-50%, -50%);
	top: 50%;
}

#editCardFormStillcut #text p {
	text-align: center;
	background-color: rgba(0, 0, 0, 0.5);
	margin: 3px;
}

.mb-3 {
	margin-top: 0px;
	width: 500px;
	margin-right: 120px;
}

#editCardFormContainer #hiddenSpace {
	width: 180px;
	float: right;
	margin: 20px;
}

#editCardFormContainer button {
	font-weight: bold;
	width: 100px;
	float: right;
	margin: 20px;
	margin-top: 45px;
}

#editCardFormTextArea .mb-3 {
	float: right;
}

#editCardFormTextArea .mb-3 textarea {
	background-color: black;
	color: white;
	border: 0px;
}

#editCardFormTextArea_tag input {
	width: 509px;
	margin-right: 95px;
	float: right;
	background-color: black;
	color: white;
	border: 0px;
}
</style>
</head>
<body>
	<div id='writeReview'>
		<div id='editCardFormContainer'>
			<h1>자기만의 감성으로 카드를 꾸며주세요!</h1>
			 <div id='editCardFormStillcut'>
				<c:if test="${param.stc != 'default'}">
					<img src='${param.stc}' alt='${param.stc}'>
				</c:if>
	        
				<div id='text'>
				</div>
			</div>
			<form action='add' method='post'>
				<select name='font'>
          <c:forEach var="f" items="${fonts}">
            <option value='${f.no}'>
              ${f.name}
            </option>
          </c:forEach>
				</select>
				<div id="editCardFormTextArea">
					<div class="mb-3">
						<textarea class="form-control" id="exampleFormControlTextarea1"
							rows="3" name='text' placeholder=""></textarea>
					</div>
					<div id="editCardFormTextArea_tag">
						<input class="form-control form-control-sm" type="text" name='tag'
							placeholder="#">
					</div>
				</div>
				<input type='hidden' name='movieNo' value='${sessionScope.movieNo}'>
				<input type='hidden' name='stc'	value='${param.stc}'>
					 <input type="hidden" name="fontSize" value='11'> 
					<input type='hidden' name='x' value='50'> 
					<input type='hidden'name='y' value='50'>
					<input type='hidden'name='size' value='13'>
				<div id="hiddenSpace"></div>
				<button class="btn btn-primary btn-sm btn-dark">리뷰 등록</button>
			</form>
			<button class="btn btn-primary btn-sm btn-dark" onclick="goBack()">뒤로</button>
		</div>
	</div>
	
	<script>
"use strict"

// 태그 객체를 만들지 않고 텍스트를 사용하여 자식 태그를 추가할 수 있다.

var textInput = document.querySelector("#editCardFormTextArea .form-control");
var text = document.querySelector("#editCardFormStillcut #text")
var originContent = text.innerHTML;
var textX = document.querySelector("input[name='x']");
var textY = document.querySelector("input[name='y']");
console.log(textInput);
console.log(text);
textInput.addEventListener("input", function(e) {
    var str = this.value;
    text.innerHTML = "<p>" + str.replace(/\n/g, "</p><p>") + "</p>";
    
  });
  
     var elmnt = document.querySelector("#editCardFormStillcut #text");
       var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0; 
       elmnt.onmousedown = dragMouseDown;
     
     function dragMouseDown(e) {
       console.log("dragMouseDown 실행");
       e = e || window.event; e.preventDefault();
       pos3 = e.clientX; pos4 = e.clientY;
       document.onmouseup = closeDragElement;
       document.onmousemove = elementDrag;
       } 
     function elementDrag(e) {
       console.log("elementDrag 실행");
       e = e || window.event; e.preventDefault();
       pos1 = pos3 - e.clientX;
       pos2 = pos4 - e.clientY;
       pos3 = e.clientX; 
       pos4 = e.clientY;
       elmnt.style.top = (elmnt.offsetTop - pos2) + "px"; 
       elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
       }
     function closeDragElement() {
       console.log("closeDragElement 실행");
       document.onmouseup = null;
       document.onmousemove = null;
       var preview = document.querySelector('#editCardFormStillcut img'); 
       preview.style.display = "block";
       console.log(preview);
       var imgWidth = preview.clientWidth;
       var imgHeight = preview.clientHeight;
       textY.setAttribute("value", Math.round((elmnt.offsetTop - pos2) / imgHeight * 100));
       textX.setAttribute("value", Math.round((elmnt.offsetLeft - pos1) / imgWidth * 100));
       
       console.log(textX);
       console.log(textY);
       } 
     
 </script>
</body>
</html>