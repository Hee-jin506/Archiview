<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet"
	href="../node_modules/bootstrap/dist/css/bootstrap.min.css">
<style>
.container {
	width: 600px;
}

button {
	display: inline-block;
	padding: 12px 24px;
	background: rgb(220, 220, 220);
	font-weight: bold;
	color: rgb(120, 120, 120);
	border: none;
	outline: none;
	border-radius: 3px;
	cursor: pointer;
	transition: ease .3s;
}

button:hover {
	background: #8BC34A;
	color: #ffffff;
}

</style>
</head>
<body>

	<div class="container">

		<div class="header">
			<img src="../logo.svg" alt="로고">
		</div>

		<h2 style="text-align: center;">당신의 감성을 담은</h2>
		<h2 style="text-align: center;">영화 후기를 만들어 보세요.</h2>

		<!-- 로그인 폼 -->
			<form method="post">
				<div class="row mb-3">
					<label for="inputName" class="col-sm-2 col-form-label">이메일
						주소</label>
					<div class="col-sm-8">
						<input type="email" class="form-control" id="아이디" name="email"
							autofocus required>
					</div>
				</div>

				<div class="row mb-3">
					<label for="inputPassword" class="col-sm-2 col-form-label">비밀번호</label>
					<div class="col-sm-8">
						<input type="password" class="form-control" id="inputPassword"
							name="password" autofocus required>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<div class="checkbox">
							<label> <input type="checkbox" name="saveEmail">
								이메일 저장
							</label>
						</div>
					</div>
				</div>
				<button>로그인</button>
			</form>
		</div>
	<h4 style="text-align: center;">
		계정이 없으신가요? <a href="../member/form.html">지금 가입하세요.</a>
	</h4>

	<script src="../node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>