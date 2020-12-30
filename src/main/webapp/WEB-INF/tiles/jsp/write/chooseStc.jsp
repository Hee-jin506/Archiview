<%@page import="bitcamp.acv.domain.Movie"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>후기 등록 : 스틸컷 선택</title>
	<style>
		#writeReview {
		  width : 900px;
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
		
		#choosStcForm {
		padding-top : 130px;
		margin: 0 auto;
		}
		#choosStcForm h1 {
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
		
		#choosStcList #hiddenSpace {
		width:270px;
		float:right;
		margin:20px;
		}
		#choosStcList button {
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
			<div id='choosStcForm'>
				<div id='choosStcList'>
						<h1>인상 깊은 장면을 골라주세요.</h1>
						<form action='editCard' method='post'>
					    <input type='hidden' name='movieNo' value='${movieNo}'>
							<select class="image-picker show-html" name="stc">
								<c:forEach items="${stillcuts}" var="s" varStatus="status"> 
					        <option data-img-src="${s}" value="${s}">page ${numOfStillcuts[status.index]}</option>
					      </c:forEach>
					    </select>
					    <div id="hiddenSpace">
					    </div>
					    <button class="btn btn-primary btn-sm btn-dark" >다음</button>
						</form>
            <button class="btn btn-primary btn-sm btn-dark" onclick="goBack()">뒤로</button>
				</div>
			</div>
		</div>
		  

<script>
function goBack() {
  window.history.back();
}
</script>
	</body>
</html>