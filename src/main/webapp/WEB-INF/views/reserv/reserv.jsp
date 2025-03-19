<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예약</title>
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
	.form-group {
		margin-bottom: 20px;
	}
	label {
		font-weight: bold;
		color: #555;
	}
	section select, input[type="text"] {
		width: 100%;
		padding: 10px;
		margin-top: 8px;
		border: 1px solid #ccc;
		border-radius: 4px;
		box-sizing: border-box;
		font-size: 16px;
	}
	input[type="submit"] {
		background-color: #00467F;
		color: white;
		padding: 10px 20px;
		border: none;
		border-radius: 5px;
		cursor: pointer;
		font-size: 16px;
	}
	input[type="submit"]:hover {
		background-color: #003A66;
	}
	.passenger-selection-container {
		display: flex;
		justify-content: space-between;
		gap: 20px;
		margin-top: 20px;
	}
	.passenger-box {
		display: flex;
		align-items: center;
		padding: 10px;
		border: 1px solid #ccc;
		border-radius: 5px;
		background-color: #f9f9f9;
		flex: 1 1 auto;
		min-width: 150px;
	}
	.passenger-controls button {
		width: 30px;
		height: 30px;
		font-size: 16px;
		border: none;
		background-color: #00467F;
		color: white;
		cursor: pointer;
		border-radius: 50%;
		margin: 0 5px;
	}
	.passenger-controls button:hover {
		background-color: #003A66;
	}
	.passenger-count {
		font-size: 18px;
		margin: 0 10px;
	}
	/* 달력 스타일 */
	.ui-datepicker {
		font-size: 1.1em;
		width: 320px !important;
		background-color: #f4f4f4;
		border: 1px solid #ddd;
		border-radius: 10px;
		padding: 10px;
		box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
	}
	.ui-datepicker .ui-datepicker-header {
		background-color: #00467F;
		color: white;
		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
		padding: 10px;
	}
	.ui-datepicker .ui-datepicker-title {
		font-weight: bold;
	}
	.ui-datepicker td a {
		color: #00467F;
		padding: 8px;
		border-radius: 50%;
		transition: background-color 0.3s ease;
	}
	.ui-datepicker td a:hover {
		background-color: #ddd;
	}
	.ui-datepicker .ui-datepicker-prev, .ui-datepicker .ui-datepicker-next {
		color: white;
		font-size: 1.2em;
		cursor: pointer;
	}
</style>
<script>
	document.addEventListener("DOMContentLoaded", function() {
		// 날짜 선택기 설정
		$("#selectedDate").datepicker({
			dateFormat: "yy-mm-dd",
			showOtherMonths: true,
			selectOtherMonths: true,
			changeMonth: true,
			changeYear: true,
			onSelect: function(dateText) {
				$("#selectedDate").val(dateText);
				$("#departureDate-hidden").val(dateText);
				fetchStationByDate(dateText);
			}
		});
		
		// 선택된 날짜로 출발 공항 목록을 가져오는 함수
		function fetchStationByDate(selectedDate) {
			if (selectedDate) {
				const url = "http://localhost:8095/reserv/stations?date=" + selectedDate;
				console.log("Fetching departure airports for date:", selectedDate); // 디버그용
				fetch(url)
				.then(response => response.json())
				.then(data => {
					const departureSelect = document.getElementById('departure');
					departureSelect.innerHTML = '<option value="">-- 출발지를 선택하세요 --</option>';
					if (data.departure) {
						data.departure.forEach(station => {
							let option = document.createElement('option');
							option.value = station;
							option.text = station;
							departureSelect.add(option);
						});
					} else {
						console.log("No departure airports found for the date.");
					}
				})
				.catch(error => console.error('Error fetching airports:', error));
			}
		}
		
		// 출발지 선택 시 도착지 목록 업데이트
		const departureSelect = document.getElementById('departure');
		if (departureSelect) {
			departureSelect.addEventListener('change', function() {
				const departure = this.value;
				const selectedDate = document.getElementById('selectedDate').value;
				console.log("선택한 출발지:", departure);
				fetchArrivalStations(departure, selectedDate);
			});
		}
		
		// 도착 공항 목록을 가져오는 함수
		function fetchArrivalStations(departure, selectedDate) {
			console.log("Request parameters - Departure:", departure, "Date:", selectedDate); // 디버그용
			
			if (departure && selectedDate) {
				const url = "http://localhost:8095/reserv/stations/arrival?departure=" + departure + "&date=" + selectedDate;
				console.log("Fetching arrival airports with URL:", url); // URL 확인
				fetch(url)
				.then(response => {
					if (!response.ok) {
						throw new Error(`HTTP error! Status: ${response.status}`);
					}
					return response.json();
				})
				.then(data => {
					const arrivalSelect = document.getElementById('arrival');
					arrivalSelect.innerHTML = '<option value="">-- 도착지를 선택하세요 --</option>';
					if (data && data.length > 0) {
						data.forEach(station => {
							let option = document.createElement('option');
							option.value = station;
							option.text = station;
							arrivalSelect.add(option);
						});
					} else {
						console.log("No arrival airports found.");
					}
				})
	            .catch(error => console.error('Error fetching arrival airports:', error));
			} else {
				console.log("Departure and/or date are not selected.");
			}
		}
		// 탑승객 수 관리
		let passengerCounts = { adult: 1 };

		// 탑승객 수 변경 함수
		function changePassengerCount(type, change) {
			passengerCounts[type] += change;
			
			if (type === 'adult' && passengerCounts[type] < 1) {
				passengerCounts[type] = 1;
			}
			
			if (type !== 'adult' && passengerCounts[type] < 0) {
				passengerCounts[type] = 0;
			}
			
			document.getElementById(type + '-count').textContent = passengerCounts[type];
			document.getElementById(type + '-hidden').value = passengerCounts[type];
		}

		// 버튼 클릭 이벤트 연결
		document.querySelectorAll('.passenger-controls button').forEach(button => {
			button.addEventListener('click', function() {
				const type = this.closest('.passenger-box').getAttribute('data-type');
				const change = this.textContent === '+' ? 1 : -1;
				changePassengerCount(type, change);
			});
		});
	});
</script>

</head>
<body>
<main>
	<div class="nullbox"></div>
	<section>
		<header>
			<h1>열차표 예약</h1>
		</header>
		<nav>
			<div><a href="../reserv/reserv">예약</a></div>
			<div><a href="../reserv/reservInfo">예약 조회</a></div>
			<div><a href="../routes/list">운행 정보</a></div>
		</nav>
		<div class="container">
			<h2>예약 정보 입력</h2>
			<form id="reservationForm" action="${pageContext.request.contextPath}/routes/search" method="get">
			<div class="form-group">
				<label for="selectedDate">출발일 선택</label>
				<input type="text" id="selectedDate" name="selectedDate" placeholder="날짜 선택" readonly>
			</div>
			<div id="passenger_selection">
				<h3>탑승객 선택</h3>
				<div class="passenger-selection-container">
					<div class="passenger-box" data-type="adult">
						<label>성인:</label>
						<div class="passenger-controls">
							<button type="button">-</button>
							<span id="adult-count" class="passenger-count">1</span>
							<button type="button">+</button>
						</div>
						<input type="hidden" name="resnum" id="adult-hidden" value="1">
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="departure">출발지</label>
				<select name="departure" id="departure" required>
					<option value="">-- 출발지를 선택하세요 --</option>
				</select>
			</div>
			<div class="form-group">
				<label for="arrival">도착지</label>
				<select name="arrival" id="arrival" required>
					<option value="">-- 도착지를 선택하세요 --</option>
				</select>
			</div>
			<input type="hidden" name="departureDate" id="departureDate-hidden">
			<input type="submit" value="열차 조회">
			</form>
		</div>
	</section>
</main>
</body>
</html>