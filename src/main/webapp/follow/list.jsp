<%@page import="bitcamp.acv.domain.Follow"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>팔로우 리스트</title>
<style>
</style>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>
<div class="container">
<h1>팔로우 리스트</h1>
<p> 로그인한 유저의 팔로우 상태가 1이면 팔로우중</p>

  <table class="table">
    <thead>
      <tr>
        <th scope="col" class="text-center">팔로우번호</th>
        <th scope="col" class="text-center">팔로우 회원</th>
        <th scope="col" class="text-center">팔로우한 타입 번호</th>
        <th scope="col" class="text-center">팔로우한 일자</th>
        <th scope="col" class="text-center">팔로우 상태</th>
      </tr>
    </thead>
    
     <tbody>
      <!-- 리스트 출력 -->

  <%
Exception ex = (Exception) request.getAttribute("exception");
if (ex != null) {%>
      <tr>
        <td colspan="6">작업 목록을 가져오는 중 오류 발생!</td>
      </tr>
      <%
        } else {
      List<Follow> followList = (List<Follow>) request.getAttribute("list");
      for (Follow follow : followList) {
      %>
      <tr>
        <td style="width: 10%" class="text-center"><%=follow.getNo()%></td>
        <td style="width: 10%" class="text-center"><%=follow.getFollowingMember().getNickName() %></td>
        <td style="width: 10%" class="text-center">
        <a class="text-reset" href='detail?no=<%=follow.getNo()%>'><%=getType(follow.getFollowedType())%></a></td>
        <td style="width: 10%" class="text-center"><%=follow.getFollowedDate()%></td>
        <td style="width: 10%" class="text-center"><%=follow.getStatus()%></td>
      </tr>
      <%
        }
      }
      %>
    </tbody>
  </table>
  </div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</body>
</html>