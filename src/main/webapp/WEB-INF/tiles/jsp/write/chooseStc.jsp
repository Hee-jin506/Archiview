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
		
		.image_picker_image {
  max-width: 140px;
  max-height: 100px;
  background-color: #FF0000;
}
	
	</style>
</head>
	<body>
	
		<div id='writeReview'>
	<select id="selectImage" class="image-picker">
    <option value=""></option>
    <option data-img-src='http://png.findicons.com/files/icons/2689/kitchen/128/4.png' value='4.jpg'>4.jpg</option>
    <option data-img-src='http://png.findicons.com/files/icons/2142/webset/48/google.png' value='google.jpg'>google.jpg</option>
    <option data-img-src='http://im1.book.com.tw/image/getImage?i=http://www.books.com.tw/img/001/058/06/0010580607.jpg&w=348&h=348' value='5.jpg'>5.jpg</option>
    <option data-img-src='http://im1.book.com.tw/image/getImage?i=http://www.books.com.tw/img/001/061/38/0010613865.jpg&w=348&h=348' value='6.jpg'>6.jpg</option>
    <option data-img-src='http://media-cache-ec0.pinimg.com/originals/3c/3d/47/3c3d4740527f0c341dbf336b7b763479.jpg' value='aom.jpg'>aom.jpg</option>
    <option data-img-src='http://media-cache-ak0.pinimg.com/736x/ea/84/02/ea8402384ac6dc1cd77dd89793902eb2.jpg' value='aom2.jpg'>aom2.jpg</option>
    <option data-img-src='http://media-cache-ak0.pinimg.com/736x/9e/ff/56/9eff5665d5706d2f31a599f21e4791e6.jpg' value='aom3.jpg'>aom3.jpg</option>
</select>
			<div id='choosStcForm'>
				<div id='choosStcList'>
						<h1>인상 깊은 장면을 골라주세요.</h1>
						<form action='editCard' method='post'>
							<label><input type='hidden' name='movieNo'
								value='<%=request.getParameter("movieNo")%>'></label>
							<%
							  List<String> stillcuts = (List<String>) request.getAttribute("stillcuts");
							for (String stillcut : stillcuts) {
							%>
							<label><input type='radio' name='stc' value='<%=stillcut%>'> 
					<%
					   if (stillcut.equals("default")) {
					%> 
					기본</label>
					<%
					} else {
					%> <img src='<%=stillcut%>' alt='<%=stillcuts.indexOf(stillcut)%>번 스틸컷'></label>
								<%
								  }
								}
								%>
							<button>다음</button>
						</form>
				</div>
					<a href='movieSearch'>뒤로</a>
			</div>
		</div>
	</body>
	<script type="text/javascript">
	$(document).ready(function() {
		  $("#selectImage").imagepicker({
		    hide_select: true
		  });

		  var $container = $('.image_picker_selector');
		  // initialize
		  $container.imagesLoaded(function() {
		    $container.masonry({
		      columnWidth: 30,
		      itemSelector: '.thumbnail'
		    });
		  });
		});
	</script>
</html>