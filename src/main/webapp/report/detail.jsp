<%@page import="bitcamp.acv.domain.Report"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!private String getType(int reportedType) {
    switch (reportedType) {
      case 1 :
        return "회원";
        break;
      case 2:
        return "게시물";
        break;
      case 3:
        return "댓글";
        break;
      default:
        return "태그";
    }
  }%>
<!DOCTYPE html>
<html>
<head>
<title>[신고 상세 정보]</title>
</head>
<body>

	<h1>[신고 상세 정보](JSP)</h1>
<%
Report report = (Report) request.getAttribute("report");
%>

	<form action='update' method='post'>
		신고번호: <input type='text' name='no' value='<%=report.getNo()%>'
			readonly>
		신고 유형: <%=getType(report.getReportedType())%>
		신고자: <%=report.getReportingMember().getNo()%>
		신고일: <%=report.getReportedDate()%>
		신고 내용: <%=report.getWhy()%>
		처리일: <input type='date' name='processedDate' value='<%=report.getProcessedDate()%>'><br>
		처리내용: <textarea name='processingContent'><%=report.getProcessingContent()%></textarea><br>
		처리상태: <select name='status'>
			<%
			 String[] stateLabels = {"신고대기", "반려", "처리완료"};
			   for (int i = 0; i < stateLabels.length; i++) {
      %>
			<option value='<%=i+1%>'><%=stateLabels[i]%></option>
		</select><br>
		<p>
			<button>변경</button>
			<a href='delete?no= <%=report.getNo()%>'>[삭제]</a>
			<a href='list'>[목록]</a>
		</p>
	</form>
</body>
</html>

