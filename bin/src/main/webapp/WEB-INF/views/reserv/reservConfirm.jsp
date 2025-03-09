<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 완료</title>
<style>
	body {
		font-family: Arial, sans-serif;
		background-color: #f7f8fa;
		margin: 20px;
		color: #333;
	}
	h2 {
		color: #222;
		text-align: center;
		margin-bottom: 20px;
		font-size: 26px;
	}
	.train-box {
		background-color: #fff;
		border: 1px solid #ddd;
		border-radius: 10px;
		padding: 25px;
		margin-bottom: 25px;
		box-shadow: 0 3px 12px rgba(0, 0, 0, 0.1);
	}
	.train-info {
		display: flex;
		justify-content: space-between;
		margin-bottom: 15px;
	}
	.train-info div {
		flex: 1;
		text-align: center;
	}
	.train-header {
		font-size: 20px;
		font-weight: bold;
		color: #333;
	}
	.train-time, .train-details {
		font-size: 18px;
		color: #555;
	}
	.train-details {
		display: none;
		margin-top: 15px;
		padding-top: 10px;
		border-top: 1px solid #ddd;
	}
	.toggle-details {
		cursor: pointer;
		color: #0056b3;
		font-size: 16px;
		text-align: center;
	}
	.toggle-details:hover {
		color: #003d7a;
	}
	button {
		background-color: #28a745;
		color: white;
		padding: 15px 30px;
		border: none;
		border-radius: 10px;
		cursor: pointer;
		font-size: 18px;
		display: block;
		margin: 30px auto;
	}
	button:hover {
		background-color: #218838;
	}
	.details-item {
		margin-bottom: 12px;
		font-size: 18px;
	}
	.pnr-box {
		font-size: 18px;
		color: #333;
		margin-top: 20px;
	}
</style>
</head>
<body>
	<h2>예약이 완료되었습니다!</h2>
	<div class="train-box">
		<div class="train-header">${routeDeparture} → ${routeArrival}</div>
		<div class="train-info">
			<div>
				<p class="train-time">출발 시간: ${routeTime}</p>
				<p class="train-time">도착 시간: ${routeArrivalTime}</p>
			</div>
			<div>
				<p class="train-time">소요 시간: </p>
				<p class="train-time">선택한 좌석: ${selectedSeats}</p>
			</div>
		</div>
		<div class="pnr-box">예약 번호: ${PNR}</div>
		<div class="toggle-details" onclick="toggleDetails('going-details')">세부 사항 보기 ▼</div>
		<div id="going-details" class="train-details">
			<div class="details-item">출발지: ${routeDeparture}</div>
			<div class="details-item">도착지: ${routeArrival}</div>
			<div class="details-item">소요 시간: </div>
			<div class="details-item">탑승 인원: ${resnum}명</div>
			<div class="details-item">총 결제 금액: <fmt:formatNumber value="" type="number"/>원</div>
		</div>
	</div>
		
	<button onclick="window.location.href='../main/index';">홈으로</button>

<script>
	function toggleDetails(id) {
		var details = document.getElementById(id);
		if (details.style.display === 'none' || details.style.display === '') {
			details.style.display = 'block';
		}
		else {
			details.style.display = 'none';
		}
	}
</script>

</body>
</html>
