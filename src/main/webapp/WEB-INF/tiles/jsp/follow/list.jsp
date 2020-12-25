<%@page import="bitcamp.acv.domain.Member"%>
<%@page import="bitcamp.acv.domain.Follow"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<h1>팔로우 리스트</h1>

<table class="table">
	<thead>
		<tr>
			<th scope="col" class="text-center">팔로우한 타입 번호</th>
			<th scope="col" class="text-center">팔로우한 타겟 번호</th>
		</tr>
	</thead>

	<tbody>
<%
Exception ex = (Exception) request.getAttribute("exception");
if (ex != null) {%>
      <tr>
        <td colspan="6">작업 목록을 가져오는 중 오류 발생!</td>
      </tr>
      <%
        } else {
      List<Follow> followList = (List<Follow>) request.getAttribute("list");
      Member loginUser = (Member) session.getAttribute("loginUser");
      for (Follow follow : followList) {
        if (follow.getFollowingMember().getNo() == loginUser.getNo()) {
      %>
      <tr>
        <td style="width: 10%" class="text-center">
        <a class="text-reset" href='detail?no=<%=follow.getNo()%>'><%=getType(follow.getFollowedType())%></a></td>
        <td style="width: 10%" class="text-center"><%=follow.getFollowedNo()%></td>
      </tr>
      <%
         }
        }
      }
      %>
    </tbody>
  </table>