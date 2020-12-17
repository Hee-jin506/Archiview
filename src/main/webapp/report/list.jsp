<%@page import="bitcamp.acv.domain.Report"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!private String getType(int reportedType) {
    switch (reportedType) {
      case 1:
        return "회원";
      case 2:
        return "게시물";
      case 3:
        return "댓글";
      default:
        return "태그";
    }
  }%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[신고 관리]</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>
	<jsp:include page="/main/admin-topbar.jsp"></jsp:include>
	
  <button class="btn btn-primary">css테스트</button>
  
<div class="container">
	<h1 class="text-left">[신고 관리]</h1>

<div class="table-responsive">
  <table class="table">
		<thead>
			<tr>
				<th scope="col" class="text-center">신고번호</th>
				<th scope="col" class="text-center">신고유형</th>
				<th scope="col" class="text-center">신고대상</th>
				<th scope="col" class="text-center">신고자</th>
				<th scope="col" class="text-center">내용</th>
				<th scope="col" class="text-center">신고일</th>
				<th scope="col" class="text-center">상태</th>
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
			List<Report> reportList = (List<Report>) request.getAttribute("list");
			for (Report report : reportList) {
			%>

			<tr>
				<td style="width: 10%" class="text-center"><%=report.getNo()%></td>
				<td style="width: 10%" class="text-center">
				<a class="text-reset" href='detail?no=<%=report.getNo()%>'><%=getType(report.getReportedType())%></a></td>
				<td style="width: 10%" class="text-center"><%=report.getReportedNo()%></td>
				<td style="width: 10%" class="text-center"><%=report.getReportingMember().getNo()%></td>
				<td style="width: 20%" class="text-center"><%=report.getProcessingContent()%></td>
				<td style="width: 10%" class="text-center"><%=report.getReportedDate()%></td>
				<td style="width: 10%" class="text-center"><%=report.getStatus()%></td>
			</tr>
			<%
			  }
			}
			%>
			
		</tbody>
	</table>
</div>

<div>
	<ul class="pagination justify-content-center">
		  <li><a href = "#" style="margin-right:5px ;" class="text-secondary"> 1 </a></li>
		  <li><a href = "#" style="margin-right:5px ;" class="text-secondary"> 2 </a></li>
		  <li><a href = "#" style="margin-right:5px ;" class="text-secondary"> 3 </a></li>
		  <li><a href = "#" style="margin-right:5px ;" class="text-secondary"> 4 </a></li>
	</ul>
</div>
	<p>
		<% String keyword = request.getParameter("keyword"); %>
	</p>
	<form action='list' method='get'>
		검색어: <input type='search' name='keyword'
			value='<%=keyword != null ? keyword : ""%>'>
		<button>검색</button>
	</form>
  </div>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  
</body>
</html>