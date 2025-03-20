<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예약 조회</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
	body {
		background-color: #f4f4f4;
		margin: 0;
		padding: 0;
	}
	main {
		top: -95px;
		position: relative;
	}
	.nullbox {
		height: 95px;
		display: flex;
		background-color: #078EB9;
	}
	section header {
		background-color: #078EB9;
		padding: 20px;
		text-align: center;
		color: white;
	}
	section header h1 {
		margin: 0;
		font-size: 24px;
	}
	section nav {
		background-color: white;
		padding: 10px;
		display: flex;
    	justify-content: center;
	}
	section nav div {
		width: 200px;
		display: flex;
    	justify-content: center;
	}
	section nav div a {
		color: black;
		margin: 0 15px;
		text-decoration: none;
		font-size: 16px;
	}
	section nav a:hover {
		color: black;
		font-weight: bold;
	}
	/* 메인 컨테이너 디자인 */
	.container {
		max-width: 800px;
		margin: 30px auto;
		background-color: white;
		padding: 30px;
		border-radius: 8px;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	}
	h2 {
		font-size: 22px;
		color: #00467F;
		margin-bottom: 20px;
		text-align: center;
	}
	#reservForm {
		margin: auto;
		display: flex;
		align-items: center;
	}
	.form-group {
		margin: auto;
		margin-bottom: 20px;
	}
	label {
		font-weight: bold;
		color: #555;
	}
	input[type="text"] {
		width: 200px;;
		padding: 10px;
		margin-top: 8px;
		border: none;
		border-bottom: 1px solid #ccc;
		font-size: 16px;
		display: inline-block;
	}
	input[type="text"]:focus {
		outline: none; /* 포커스 시 outline 제거 */
	}
	input[type="submit"] {
		background-color: #00467F;
		color: white;
		border: none;
		cursor: pointer;
		font-size: 14px;
		margin-top: 15px;
		padding: 5px 10px;
		border-radius: 5px;
		display: inline-block;
	}
	input[type="submit"]:hover {
		background-color: #003A66;
	}
</style>
</head>
<body>
<main>
	<div class="nullbox"></div>
	<section>
		<header>
			<h1>예약 조회</h1>
		</header>
		<nav>
			<div><a href="../reserv/reserv">예약</a></div>
			<div><a href="../reserv/reservInfo">예약 조회</a></div>
			<div><a href="../routes/list">운행 정보</a></div>
		</nav>
		<div class="container">
			<form id="reservForm" action="${pageContext.request.contextPath}/reserv/oneRsvDetail" method="get">
				<!-- 예약 번호 -->
				<div class="form-group">
					<label for="pnr">예약번호</label>
					<input type="text" id="pnr" name="PNR" required>
					<input type="submit" value="예약 조회">
				</div>
			</form>
		</div>
	</section>
</main>
</body>
</html>
