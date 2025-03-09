<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>선택 확인 - 은하철도</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
<style>
	body {
		font-family: Arial, sans-serif;
		background-color: #f4f4f4;
		margin: 0;
		padding: 0;
	}
	.container {
		max-width: 1200px;
		margin: 30px auto;
		background-color: white;
		padding: 30px;
		box-shadow: 0 4px 16px rgba(0, 0, 0, 0.2);
		border-radius: 8px;
	}
	h2, h4 {
		color: #00467F;
	}
	table {
		width: 100%;
		margin-bottom: 30px;
	}
	th, td {
		text-align: center;
	}
	.btn-seat-select, .btn-reservation {
		padding: 5px 10px;
		background-color: #00467F; /* 블루 색상 */
		color: white;
		border-radius: 5px;
		border: none;
		cursor: pointer;
		transition: background-color 0.3s ease;
		font-size: 12px;
	}
	.btn-reservation {
		font-size: 15px;
	}
	.btn-seat-select:hover, .btn-reservation:hover {
		background-color: #003A66;
	}
	.action-buttons {
		margin-top: 20px;
		margin-bottom: 50px;
	}
	.seat-selection-btn {
		margin-right: 10px;
	}
	#seatSelectionModal {
		width: 1500px;
	}
	.modal-content {
		width: 1100px;
	}

</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
<script>
	function confirmRsv() {
		var selectedSeats = document.getElementById('selectedSeats').value;
		if (selectedSeats === '') {
			alert('좌석을 선택해 주세요.');
			return false;
		}
	}
	
	function openSeatSelection() {
		var routeid = '${routeid}';
		var resnum = '${resnum}';
		var url = '${pageContext.request.contextPath}/routes/seats?routeid=' + routeid + '&resnum=' + resnum;
		
		document.getElementById('seatSelectionFrame').src = url;
		$('#seatSelectionModal').modal('show');
	}
	
	function updateSelectedSeats(seatNumbers) {
		document.getElementById('selectedSeats').value = seatNumbers.join(',');
		document.getElementById('goingSeatsDisplay').innerText = seatNumbers.join(', ');
		var seatButtonContainer = document.getElementById('goingSeatButtonContainer');
		seatButtonContainer.innerHTML = '<button class="btn-seat-select" onclick="openSeatSelection()">좌석 변경</button>';
	}
	
	window.addEventListener('message', function(event) {
		if (event.data.type === 'goingSeatsSelected') {
			var seatNumbers = event.data.seats;
			updateSelectedSeats(seatNumbers);
			$('#seatSelectionModal').modal('hide'); // 모달 닫기
		}
	});
</script>
</head>
<body>
	<div class="container">
		<h2 class="mt-4">선택한 열차편 확인</h2>
		<table class="table table-bordered">
			<thead class="thead-dark">
				<tr>
					<th>열차</th>
					<th>출발역</th>
					<th>도착역</th>
					<th>출발시간</th>
					<th>도착시간</th>
					<th>좌석</th>
				</tr>
			</thead>
			<tbody>
			<tr>
				<td>은하-${routeid}</td>
				<td>${routeDeparture}</td>
				<td>${routeArrival}</td>
				<td>${routeTime}</td>
				<td>${routeArrivalTime}</td>
				<td>
					<span id="goingSeatsDisplay"></span>
					<div id="goingSeatButtonContainer">
						<button class="btn-seat-select" onclick="openSeatSelection()">좌석 선택</button>
					</div>
				</td>
			</tr>
			</tbody>
		</table>
	
		<!-- 선택한 항공편 정보 -->
		<h4>선택한 열차편 정보</h4>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>인원</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${resnum}명</td>
				</tr>
			</tbody>
		</table>
	
		<!-- 예약하기 버튼 -->
		<form action="${pageContext.request.contextPath}/reserv/reservCheck" method="post" onsubmit="return confirmRsv()">
			<input type="hidden" name="routeid" value="${routeid}">
			<input type="hidden" name="routeDeparture" value="${routeDeparture}">
			<input type="hidden" name="routeArrival" value="${routeArrival}">
			<input type="hidden" name="routeTime" value="${routeTime}">
			<input type="hidden" name="routeArrivalTime" value="${routeArrivalTime}">
			<input type="hidden" name="resnum" value="${resnum}">
			<input type="hidden" name="selectedSeats" id="selectedSeats">
			<button type="submit" class="btn btn-success btn-reservation">예약하기</button>
		</form>
	</div>
	
	<!-- Bootstrap 모달 -->
	<div class="modal fade" id="seatSelectionModal" tabindex="-1" aria-labelledby="seatSelectionModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="seatSelectionModalLabel">좌석 선택</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<iframe id="seatSelectionFrame" style="width:100%; height:600px; border:none;"></iframe>
				</div>
			</div>
		</div>
	</div>

</body>
</html>