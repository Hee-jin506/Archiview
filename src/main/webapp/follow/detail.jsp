<%@page import="bitcamp.acv.domain.Member"%>
<%@page import="bitcamp.acv.domain.Follow"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%!private String getType(int followedType) {
    switch (followedType) {
      case 1:
        return "회원";
      case 2:
        return "태그";
      default:
        return "기타";
    }
  }%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 팔로잉하는 리스트</title>
<style>
  #container {
    width: 1024px;
    margin: 0px auto;
    padding: 20px;
    border: 1px solid #bcbcbc;
  }
  
  #header {
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #bcbcbc;
    }
    
  #content {
    width: 460px;
    height: 400px;
    padding: 20px;
    margin-bottom: 20px;
    float: left;
    border: 1px solid #bcbcbc;
    }

    #sidebar {
    width: 460px;
    height: 400px;
    padding: 20px;
    margin-bottom: 20px;
    float: right;
    border: 1px solid #bcbcbc;
    }
      
    #list {
    clear: both;
    padding: 20px;
    margin-bottom: 20px;
    border: 1px solid #bcbcbc;
    }  
   
   #footer {
    clear: both;
    padding: 20px;
    border: 1px solid #bcbcbc;
    } 
</style>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>

  <div id="container">
  
      <div id="header">
        <jsp:include page="/main/admin-topbar.jsp"></jsp:include>
      </div>

<div id="content">
<jsp:include page="${follower}"></jsp:include>
  </div>

   <div id="sidebar">
    <% Follow follow = (Follow) request.getAttribute("follow"); %>
    <form action='update' method='post'>
    <p><button>변경</button><a href='deleteUser?no=<%=follow.getNo()%>'>[삭제]</a> <a href='list'>[목록]</a></p>
    <p>로그인 사용자 : <%=follow.getFollowingMember().getNickName()%></p>
    <p>팔로우 번호 : <input type='text' name='no' value='<%=follow.getNo()%>'readonly></p> 
    <p>팔로우 유형 : <%=getType(follow.getFollowedType())%></p>
    <p>팔로우한 날짜 : <%=follow.getFollowedDate() %>
    <p>
    </form>
    
    </div>
    <br>
   <div id="list">
    <p>여기 리스트</p>
    <p>여기 리스트</p>
    <p>여기 리스트</p>
    <p>여기 리스트</p>
    <p>여기 리스트</p>
    <p>여기 리스트</p>
  </div>
    
    <div id="footer">
        <p>비트캠프 팀 아카이뷰 최희진 이건목 류승희 김찬구 정지은</p> 
    </div>
    
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</body>
</html>