<%@page import="bitcamp.acv.service.ReportService"%>
<%@page import="bitcamp.acv.domain.Comment"%>
<%@page import="bitcamp.acv.domain.Tag"%>
<%@page import="bitcamp.acv.domain.Member"%>
<%@page import="bitcamp.acv.domain.Review"%>
<%@page import="bitcamp.acv.domain.Report"%>
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
<title>[신고 상세 정보]</title>
<style>
body {
	border: solid lightgray;
	background-color: gray;
	padding: 10px;
	width: 1000px;
  }
  
.flex-container {
    margin: 10px;
    padding: 15px;
    border-radius: 5px;
	background: #60B99A;
	display: flex;
	flex-direction: row;
	justify-content: space-around;
	}
.card-body {
	display: inline-block;
	border: solid lightgray;
	flex-basis: 350px;
  }
  
</style>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>
<jsp:include page="/main/admin-topbar.jsp"></jsp:include>

<div class="flex-container">
	<div class="card border-primary mb-3" style="max-width: 50rem;">  
		<div class="card-body"><jsp:include page="${sidemenu}"></jsp:include></div>
	</div>
	
	<% Report report = (Report) request.getAttribute("report"); %>
	<form action='update' method='post'>
		<div class="card border-primary mb-3" style="max-width: 50rem;">
			<div class="card-body">
			<p><button>변경</button><a href='delete?no=<%=report.getNo()%>'>[삭제]</a> <a href='list'>[목록]</a></p>
			<h4 class="card-title">Primary card title</h4>
			<p class="card-title">신고번호 : <input type='text' name='no' value='<%=report.getNo()%>'readonly></p>
			<p class="card-title">신고 유형 : <%=getType(report.getReportedType())%></p>
			<p class="card-title">신고자 : <%=report.getReportingMember().getNo()%></p>
			<p class="card-title">신고일 : <%=report.getReportedDate()%></p>
			<p class="card-title">신고 내용 : <%=report.getWhy()%></p>
			<p class="card-title">처리상태: <select name='status'>
				<% String[] stateLabels = {"신고대기", "반려", "처리완료"};
					for (int i = 0; i < stateLabels.length; i++) {
					%>
					<option value='<%=i+1%>'><%=stateLabels[i]%></option>
					<%} %>
				</select></p>
			<p class="card-title">처리내용 : <textarea name='processingContent'><%=report.getProcessingContent()%></textarea></p>
			<p class="card-title">처리일 : <input type='date' name='processedDate' value='<%=report.getProcessedDate()%>'></p>
		</form>
			</div>
		</div>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>

