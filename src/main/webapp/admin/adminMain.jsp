<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<title>관리자메인..</title>
</head>
<body>
	<jsp:include page="/main/admin-topbar.jsp"></jsp:include>

    <div class="todayview">
		<span>오늘 등록된 게시물 수 : ${chartSizeMap.today}</span><br>
    </div>

	<div class="container">
		<canvas id="myChart">
		</canvas>
	</div>
	<script>
		var ctx = document.getElementById('myChart');
		var myChart = new Chart(ctx,
				{
					type : 'line',
					data : {
						labels : [ 'Red', 'Blue', 'Yellow', 'Green', 'Purple',
								'Orange' ],
						datasets : [ {
							label : '# of Votes',
							data : [ 12, 19, 3, 5, 2, 3 ],
							backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(255, 206, 86, 0.2)',
									'rgba(75, 192, 192, 0.2)',
									'rgba(153, 102, 255, 0.2)',
									'rgba(255, 159, 64, 0.2)' ],
							borderColor : [ 'rgba(255, 99, 132, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(255, 206, 86, 1)',
									'rgba(75, 192, 192, 1)',
									'rgba(153, 102, 255, 1)',
									'rgba(255, 159, 64, 1)' ],
							borderWidth : 1
						} ]
					},
					options : {
						scales : {
							yAxes : [ {
								ticks : {
									beginAtZero : true
								}
							} ]
						}
					}
				});
	</script>
</body>
</html>
