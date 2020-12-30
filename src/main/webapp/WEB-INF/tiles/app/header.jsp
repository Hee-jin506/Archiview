<%@page import="bitcamp.acv.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-1.7.js" type="text/javascript"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
 
 <script type="text/javascript" charset="UTF-8">
 
$(document).ready(function() {
 $("#search-data").autocomplete({
 source : function(request, response) {
 
 $.ajax({
 
 url : "/Archiview/app/main/autocomplete",
 type : "post",
 dataType : "json",
 data: request,
 
 success : function(data) {
 
 var result = data;
 response(result);
 },
 
 error : function(data) {
 alert("에러가 발생하였습니다.")
 }
 });
 }
 });
});
</script>
 
  <div id='menubar'>
	  <div id='inner'>
	    <div id='logo'>
	      <a href="<%=getServletContext().getContextPath()%>/app/main/"> 
	        <img src="<%=getServletContext().getContextPath()%>/main_resource/logo.png" alt="로고">
	      </a>
	    </div>
	<%
	String keyword = request.getParameter("keyword");
	%>
	    <div id='search'>
	      <form action='<%=getServletContext().getContextPath()%>/app/main/search'>
	        <label><img
	          src='<%=getServletContext().getContextPath()%>/main_resource/search-outline.png' width="12"></label>
	        <input type='text' id='search-data' name='keyword' placeholder='검색' value='<%=keyword != null ? keyword : ""%>'>
	      </form>
	    </div>
	    <% Member member = (Member) session.getAttribute("loginUser"); %>
	    <div id='profile'>
	    <div class='dropdown'>
	       <button class='dropbtn'>
	      <img class='profile' src='<%=getServletContext().getContextPath()+"/upload/" + member.getPhoto() + "_35x35.jpg"%>' alt='프로필'>
	      </button>
	       <div class='dropdown-content'>
	           <a href="<%=getServletContext().getContextPath()%>/app/member/profile?no=<%=member.getNo()%>"><img id='btn-icon' src='<%=getServletContext().getContextPath()+"/option_resource/profile.png"%>' alt='프로필'>프로필</a>
		         <a href="<%=getServletContext().getContextPath()%>/app/option/profile"><img id='btn-icon' src='<%=getServletContext().getContextPath()+"/option_resource/option.png"%>' alt='설정'>설정</a>
	           <hr>
	           <a href="<%=getServletContext().getContextPath()%>/app/auth/logout">로그아웃</a>
	       </div>
	    </div>
	    </div> 

	    <div id='icon'>
	      <a href='<%=getServletContext().getContextPath()%>'>
	      <img src='<%=getServletContext().getContextPath()%>/main_resource/home-outline.png' width="20" alt='메인화면'></a> <a
	        href='<%=getServletContext().getContextPath()%>/app/write/movieSearch'>
	        <img src='<%=getServletContext().getContextPath()%>/main_resource/plus-outline.png' width="20"  alt='글쓰기'></a> <a
	        href='<%=getServletContext().getContextPath()%>/app/main/followingFeed'>
	        <img src='<%=getServletContext().getContextPath()%>/main_resource/heart-outline.png' width="20"  alt='팔로우한 회원의 피드'></a> <a
	        href='<%=getServletContext().getContextPath()%>/app/main/newsfeed'>
	        <img src='<%=getServletContext().getContextPath()%>/main_resource/bell-outline.png' width="20"  alt='알람'></a>
	    </div>
	    </div>
   </div> 
<script>

  $(document).ready(fuction(){
	  
	   $('#search_data').autocomplete({
		   source: "fetch.php",
		   minLenght: 1,
		   select: funcion(event, ui)
		   {
			   $('#search_data').val(ui.item.value);
		   }
	   }).data('ui-autocomplete')._renerItem = function(ul. item)
	   {
		   return $)
	   };
	   
  });

</script>