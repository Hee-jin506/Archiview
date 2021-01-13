<%@page import="bitcamp.acv.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  
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
	        <input type='text' id='search-data' name='keyword' placeholder='검색' value='<%=keyword != null ? keyword : ""%>'>
	        <button id='search-btn'><img src='<%=getServletContext().getContextPath()%>/main_resource/search-outline.png' width="12"></button>
	      </form>
	    </div>
	    <% Member member = (Member) session.getAttribute("loginUser"); %>
	    <div id='profile' >
		    <div class="dropdown" id="myDropdown">
		    
	        <img class='profile dropdown-toggle' src='<%=getServletContext().getContextPath()+"/upload/" + member.getPhoto() + "_35x35.jpg"%>' href="#" role="button"  data-bs-toggle="dropdown" aria-expanded="false">
	        
				  <ul class="dropdown-menu dropdown-menu-dark dropdown-menu-lg-end" aria-labelledby="dropdownMenuLink">
				    <li>
				      <a class="dropdown-item" 
				      href="<%=getServletContext().getContextPath()%>/app/member/profile?no=<%=member.getNo()%>"">
				       <img class='btn-icon' src='<%=getServletContext().getContextPath()+"/option_resource/profile.png"%>' alt='프로필'>프로필
				      </a>
				    </li>
				    <li>
				      <a class="dropdown-item" href="<%=getServletContext().getContextPath()%>/app/option/profile">
				      <img class='btn-icon' src='<%=getServletContext().getContextPath()+"/option_resource/option.png"%>' alt='설정'>설정
				      </a>
				    </li>
				    <li>
				      <hr class="dropdown-divider">
				    </li>
				    <li>
				      <a class="dropdown-item" href="<%=getServletContext().getContextPath()%>/app/auth/logout">로그아웃
				      </a>
				    </li>
				    
				  </ul>
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
  var myDropdown = document.getElementById('myDropdown')
  var profile = document.getElementById('profile')
	myDropdown.addEventListener('show.bs.dropdown', function () {
	  console.log("show");
	  profile.setAttribute("style", "border: 1px solid white; margin-top: 6px; margin-right: 1px;");
	})
	myDropdown.addEventListener('hide.bs.dropdown', function () {
	  console.log("hide");
	  profile.setAttribute("style", "");
	})
</script>
