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
    background-color:  #000000 !important;
  }
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>
    <div id="container">
      <div id="header">
        <jsp:include page="/main/admin-topbar.jsp"></jsp:include>
      </div>

<div id="content">
<jsp:include page="${sidemenu}"></jsp:include>
  </div>
	
	<div id="sidebar">
	<% Report report = (Report) request.getAttribute("report"); %>
	<form action='update' method='post'>
			<p><button>변경</button><a href='delete?no=<%=report.getNo()%>'>[삭제]</a> <a href='list'>[목록]</a></p>
			<p>신고번호 : <input type='text' name='no' value='<%=report.getNo()%>'readonly></p>
			<p>신고 유형 : <%=getType(report.getReportedType())%></p>
			<p>신고자 : <%=report.getReportingMember().getNo()%></p>
			<p>신고일 : <%=report.getReportedDate()%></p>
			<p>신고 내용 : <%=report.getWhy()%></p>
			<p>처리상태: <select name='status'>
				<% String[] stateLabels = {"신고대기", "반려", "처리완료"};
					for (int i = 0; i < stateLabels.length; i++) {
					%>
					<option value='<%=i+1%>'><%=stateLabels[i]%></option>
					<%} %>
				</select></p>
			<p>처리내용 : <textarea name='processingContent'><%=report.getProcessingContent()%></textarea></p>
			<p>처리일 : <input type='date' name='processedDate' value='<%=report.getProcessedDate()%>'></p>
		</form>
		</div>

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

