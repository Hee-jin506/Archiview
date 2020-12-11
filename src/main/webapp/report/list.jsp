<%@page import="bitcamp.acv.domain.Report"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%!
    private String getType(int reportedType) {
      switch (reportedType) {
        case 1 :
          return "회원";
        case 2:
          return "게시물";
        case 3:
          return "댓글";
        default:
          return "태그";
      }
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[신고 관리]</title>
<style>body {background-color: #000000;color: #ffffff;}</style>
</head>
<body>

<jsp:include page="/main/admin-topbar.jsp"></jsp:include>

<h1>[신고 관리]</h1>

<table border='1'>
<thead>
<tr>
  <th>신고번호</th>
  <th>신고유형</th>
  <th>신고대상</th>
  <th>신고자</th>
  <th>내용</th>
  <th>신고일</th>
  <th>상태</th>
</tr>
</thead>

<tbody>
<%
Exception ex = (Exception) request.getAttribute("exception");
if (ex != null) {%>
<tr>
<td colspan="6">작업 목록을 가져오는 중 오류 발생!</td>
</tr>
<%} else {
  List<Report> list = (List<Report>) request.getAttribute("list");
  for (Report report : list) {
  %>
<tr>
  <td><%=report.getNo()%></td>
  <td><a href='detail?no=<%=report.getNo()%>'><%=getType(report.getReportedType())%></a></td>
  <td><%=report.getReportedNo()%></td>
  <td><%=report.getReportingMember().getNo()%></td>
  <td><%=report.getProcessingContent()%></td>
  <td><%=report.getReportedDate() %></td>
  <td><%=report.getStatus()%></td>
</tr>
<%}  
}%>

</tbody>
</table>
<p>
<%
String keyword = request.getParameter("keyword");
%>

<form action='list' method='get'>
검색어: <input type='text' name='keyword' value='<%=keyword != null ? keyword : ""%>'>
<button>검색</button>
</form>
</p>
</body>
</html>