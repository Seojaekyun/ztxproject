<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.demo.dto.StationsDto" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>열차편 추가</title>
<style>
	body {
		background-color: #f9f9f9;
		margin: 0;
		padding: 0;
	}
	section form {
		max-width: 1200px;
		margin: 50px auto;
		background-color: white;
		padding: 20px;
		box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
		border-radius: 10px;
	}
	section h2 {
		font-size: 24px;
		font-weight: bold;
		text-align: center;
		color: #333;
		margin-bottom: 20px;
	}
	section .flex-container {
		display: flex;
		justify-content: space-between;
		gap: 20px;
	}
	section .flex-item {
		width: 48%;
	}
	section label {
		font-size: 14px;
		color: #333;
		display: block;
		margin-bottom: 10px;
		font-weight: bold;
	}
	section input[type="text"], input[type="date"], select, textarea {
		width: calc(100% - 20px);
		padding: 10px;
		margin-bottom: 20px;
		border: 1px solid #ddd;
		border-radius: 5px;
		box-sizing: border-box;
		font-size: 14px;
	}
	section textarea {
		height: 50px;
	}
	section button {
		width: 100%;
		background-color: #000A8E;
		color: white;
		border: none;
		padding: 15px;
		font-size: 16px;
		border-radius: 8px;
		cursor: pointer;
		transition: background-color 0.3s ease;
	}
	section button:hover {
		background-color: #333;
	}
</style>
<script type="text/javascript">
	// 패드 제로 함수
	function padZero(value) {
		return ("0" + value).slice(-2);
	}
	
	// 귀향편 역 설정 함수
	function setreturnRoutesStations() {
		var departure = document.getElementById("departure").value;
		var arrival = document.getElementById("arrival").value;
		document.getElementById("returnDeparture").value = arrival || "";
		document.getElementById("returnArrival").value = departure || "";
	}
	
	// 도착역 목록 갱신 함수
	function updateArrival() {
		var departure = document.getElementById("departure").value;
		var arrivalSelect = document.getElementById("arrival");
		
		// 기존 옵션 제거
		arrivalSelect.innerHTML = "";
		
		// 역 데이터 JavaScript 배열로 전달
		var stations = [
			<c:forEach var="station" items="${stations}" varStatus="status">
			{ code: '${station.line}', name: '${station.stationName}', id: '${station.id}' }
			<c:if test="${!status.last}">,</c:if>
			</c:forEach>
		];
		
		// 출발역과 같은 id를 가진 역을 제외하고 도착지 목록에 추가
		stations.forEach(function(station) {
			if(station.name !== departure) {  // 출발역과 도착역이 다를 경우
				var option = document.createElement("option");
				option.value = station.name;  // 도착역의 id 값으로 설정
				option.text = station.name; // 도착역의 이름으로 설정
				arrivalSelect.appendChild(option);
			}
		});
	}
	
	// 열차 목록 필터링 함수
	function filterTrains() {
		var departureSelect = document.getElementById("departure");
		var selectedDeparture = departureSelect.options[departureSelect.selectedIndex].text;  // 선택된 출발역의 이름
		var trainSelect = document.getElementById("trainid");
		var trainOptions = trainSelect.getElementsByTagName("option");
		
		// 모든 열차 옵션을 순회하면서, train.depot과 선택된 출발역이 일치하는 경우만 표시
		for (var i = 0; i < trainOptions.length; i++) {
			var trainDepot = trainOptions[i].getAttribute("data-depot");
			// 출발역이 train.depot과 일치하면 옵션을 보여주고, 아니면 숨깁니다.
			if (trainDepot === selectedDeparture) {
				trainOptions[i].style.display = "block";  // 해당 열차 보이기
			}
			else {
				trainOptions[i].style.display = "none";   // 해당 열차 숨기기
			}
		}
	}
	
	// 이벤트 리스너 등록
	window.onload = function() {
		// 출발역 선택 시, 도착역 목록을 갱신하고, 열차 목록 필터링
		document.getElementById("departure").addEventListener("change", function() {
			updateArrival();  // 도착역 목록 갱신
			filterTrains();   // 열차 목록 필터링
		});
		
		// 도착역 선택 시, 귀향편 역 설정
		document.getElementById("arrival").addEventListener("change", function() {
			setreturnRoutesStations();  // 귀향편 역 설정
			fetchRouteTime();
		});
		
		updateArrival();
		filterTrains();
		
		// 초기화 시 도착역 목록 갱신 및 열차 목록 필터링
		const departureDate = document.getElementById("departureDate");
		const departureHour = document.getElementById("departureHour");
		const departureMinute = document.getElementById("departureMinute");
		
		// 귀환 날짜 요소 찾기
		const returnDate = document.getElementById("returnDate");
		const returnHour = document.getElementById("returnHour");
		const returnMinute = document.getElementById("returnMinute");
		
		// 요소가 존재할 경우에만 이벤트 리스너 추가
		if (departureDate) departureDate.addEventListener("change", calculateDepartureArrivalTime);
		if (departureHour) departureHour.addEventListener("change", calculateDepartureArrivalTime);
		if (departureMinute) departureMinute.addEventListener("change", calculateDepartureArrivalTime);
		
		if (returnDepartureDate) returnDepartureDate.addEventListener("change", calculateReturnArrivalTime);
		if (returnDepartureHour) returnDepartureHour.addEventListener("change", calculateReturnArrivalTime);
		if (returnDepartureMinute) returnDepartureMinute.addEventListener("change", calculateReturnArrivalTime);
	};
	
	// fetchRouteTime 함수 내에 도착 시간 계산 호출을 추가합니다.
	function fetchRouteTime() {
		console.log("fetchRouteTime 함수 실행됨"); // 실행 여부 확인
		
		var departure = document.getElementById("departure").value;
		var arrival = document.getElementById("arrival").value;
		
		console.log("출발역:", departure, "도착역:", arrival); // 값 확인
		
		if(!departure || !arrival) {
			console.log("출발역 또는 도착역이 설정되지 않음");
			return;
		}
		
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "/admin/getRouteTime?departure=" + departure + "&arrival=" + arrival, true);
		xhr.onreadystatechange = function () {
			if(xhr.readyState === 4) {
				console.log("AJAX 응답 상태:", xhr.status);
				if(xhr.status === 200) {
					console.log("서버 응답:", xhr.responseText);
					var response = JSON.parse(xhr.responseText);
					console.log("파싱된 응답 데이터:", response);
					
					var routeHour = response.hour;
					var routeMinute = response.minute;
					var unitPrice = response.unitPrice;
					
					document.getElementById("routeHour").value = routeHour;
					document.getElementById("routeMinute").value = routeMinute;
					document.getElementById("routeTimeDisplay").value = padZero(routeHour) + "시간 " + padZero(routeMinute) + "분";
					document.getElementById("routeTime").value = padZero(routeHour) + ":" + padZero(routeMinute) + ":00";
					document.getElementById("unitPrice").value = unitPrice;
					
					document.getElementById("returnRouteHour").value = routeHour;
					document.getElementById("returnRouteMinute").value = routeMinute;
					document.getElementById("returnRouteTimeDisplay").value = padZero(routeHour) + "시간 " + padZero(routeMinute) + "분";
					document.getElementById("returnRouteTime").value = padZero(routeHour) + ":" + padZero(routeMinute) + ":00";
					document.getElementById("returnUnitPrice").value = unitPrice;
				}
				else {
					console.log("AJAX 요청 실패: ", xhr.status);
				}
			}
		};
		xhr.send();
	}
	
	function calculateArrivalTime(departureDateId, departureHourId, departureMinuteId, routeHourId, routeMinuteId, arrivalTimeId) {
		var departureDate = document.getElementById(departureDateId).value;
		var departureHour = parseInt(document.getElementById(departureHourId).value);
		var departureMinute = parseInt(document.getElementById(departureMinuteId).value);
		var routeHour = parseInt(document.getElementById(routeHourId).value);
		var routeMinute = parseInt(document.getElementById(routeMinuteId).value);
		
		console.log("출발 날짜:", departureDate, "출발 시:", departureHour, "출발 분:", departureMinute);
		console.log("경로 시:", routeHour, "경로 분:", routeMinute);
		
		if(!departureDate || isNaN(departureHour) || isNaN(departureMinute) || isNaN(routeHour) || isNaN(routeMinute)) {
			console.log("시간 계산에 필요한 값이 부족합니다.");
			return;
		}
		
		var departureDateTime = departureDate + " " + padZero(departureHour) + ":" + padZero(departureMinute);
		var departureMoment = moment(departureDateTime, "YYYY-MM-DD HH:mm");
		
		departureMoment.add(routeHour, 'hours').add(routeMinute, 'minutes');
		
		var arrivalMoment = departureMoment.clone();
		var arrivalTimeStr = arrivalMoment.format('YYYY-MM-DD HH:mm');
		
		console.log("계산된 도착 시간:", arrivalTimeStr);
		document.getElementById(arrivalTimeId).value = arrivalTimeStr;
	}
	
	// 출발편 도착 시간 계산 함수
	function calculateDepartureArrivalTime() {
		calculateArrivalTime("departureDate", "departureHour", "departureMinute", "routeHour", "routeMinute", "arrivalTime");
	}
	
	// 귀국편 도착 시간 계산 함수
	function calculateReturnArrivalTime() {
		console.log("🚀 귀환 도착 시간 계산 함수 실행됨!");
		calculateArrivalTime("returnDepartureDate", "returnDepartureHour", "returnDepartureMinute", "returnRouteHour", "returnRouteMinute", "returnArrivalTime");
	}
	
	// 폼 제출 전에 시간 결합
	function combineTimes() {
		var departureDate = document.getElementById("departureDate").value;
		var departureHour = padZero(document.getElementById("departureHour").value);
		var departureMinute = padZero(document.getElementById("departureMinute").value);
		document.getElementById("departureTime").value = departureDate + " " + departureHour + ":" + departureMinute + ":00";
		
		var returnDepartureDate = document.getElementById("returnDepartureDate").value;
		var returnDepartureHour = padZero(document.getElementById("returnDepartureHour").value);
		var returnDepartureMinute = padZero(document.getElementById("returnDepartureMinute").value);
		document.getElementById("returnDepartureTime").value = returnDepartureDate + " " + returnDepartureHour + ":" + returnDepartureMinute + ":00";
	}
	
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment-timezone/0.5.40/moment-timezone-with-data.min.js"></script>
</head>
<body>
<section>
	<h2>열차편 추가</h2>
	<form action="/admin/addRoutes" method="post" onsubmit="combineTimes()">
		<div class="flex-container">
			<div class="flex-item">
				<h3>행선 정보</h3>
				<label for="departure">출발역:</label>
				<select id="departure" name="departure" required>
					<option value="">선택</option>
					<c:forEach var="Station" items="${stations}">
					<option value="${Station.stationName}">${Station.stationName}</option>
					</c:forEach>
				</select>
				<label for="arrival">도착역:</label>
				<select id="arrival" name="arrival" required>
				<!-- Arrival Stations will be populated dynamically -->
				</select>
				<label for="departureDate">출발 날짜:</label>
				<input type="date" id="departureDate" name="departureDate" required>
				<label for="departureHour">출발 시간 (시):</label>
				<select id="departureHour" name="departureHour" required>
					<c:forEach var="hour" begin="0" end="23">
					<option value="${hour}">${hour}</option>
					</c:forEach>
				</select>
				<label for="departureMinute">출발 시간 (분):</label>
				<select id="departureMinute" name="departureMinute" required>
					<option value="00">00</option>
					<option value="10">10</option>
					<option value="20">20</option>
					<option value="30">30</option>
					<option value="40">40</option>
					<option value="50">50</option>
				</select>
				<!-- Hidden route time inputs -->
				<input type="hidden" id="routeHour" name="routeHour">
				<input type="hidden" id="routeMinute" name="routeMinute">
				<!-- Display route time -->
				<label for="routeTimeDisplay">여객 시간:</label>
				<input type="text" id="routeTimeDisplay" name="ftime" readonly>
				<!-- 비행 시간 저장을 위한 숨겨진 필드 -->
				<input type="hidden" id="routeTime" name="ftimeValue">
				<label for="arrivalTime">도착 시간:</label>
				<textarea id="arrivalTime" name="arrivalTime" readonly></textarea>
				<input type="hidden" id="departureTime" name="departureTime">
				<label for="trainid">열차:</label>
				<select id="trainid" name="trainid" required>
					<c:forEach var="train" items="${traines}">
					<option value="${train.trainid}" data-depot="${train.depot}">${train.model} / ${train.capa}석</option>
					</c:forEach>
				</select>
				<label for="unitPrice">금액:</label>
				<input type="text" id="unitPrice" name="unitPrice" readonly>
			</div>
			<div class="flex-item">
				<h3>귀편 정보</h3>
				<label for="returnDeparture">출발역:</label>
				<input type="text" id="returnDeparture" name="returnDeparture" readonly>
				<label for="returnArrival">도착역:</label>
				<input type="text" id="returnArrival" name="returnArrival" readonly>
				<label for="returnDepartureDate">출발 날짜:</label>
				<input type="date" id="returnDepartureDate" name="returnDepartureDate" required>
				<label for="returnDepartureHour">출발 시간 (시):</label>
				<select id="returnDepartureHour" name="returnDepartureHour" required>
					<c:forEach var="hour" begin="0" end="23">
					<option value="${hour}">${hour}</option>
					</c:forEach>
				</select>
				<label for="returnDepartureMinute">출발 시간 (분):</label>
				<select id="returnDepartureMinute" name="returnDepartureMinute" required>
					<option value="00">00</option>
					<option value="10">10</option>
					<option value="20">20</option>
					<option value="30">30</option>
					<option value="40">40</option>
					<option value="50">50</option>
				</select>
				<!-- Hidden return route time inputs -->
				<input type="hidden" id="returnRouteHour" name="returnRouteHour">
				<input type="hidden" id="returnRouteMinute" name="returnRouteMinute">
				<!-- Display return route time -->
				<label for="returnRouteTimeDisplay">여객시간:</label>
				<input type="text" id="returnRouteTimeDisplay" name="returnFtime" readonly>
				<!-- 귀국편 비행 시간 저장을 위한 숨겨진 필드 -->
				<input type="hidden" id="returnRouteTime" name="returnFtimeValue">
				<label for="returnArrivalTime">도착 시간:</label>
				<textarea id="returnArrivalTime" name="returnArrivalTime" readonly></textarea>
				<input type="hidden" id="returnDepartureTime" name="returnDepartureTime">
				<label for="returnTrainid">열차:</label>
				<select id="returnTrainid" name="returnTrainid" required>
					<c:forEach var="train" items="${traines}">
					<option value="${train.trainid}" data-depot="${train.depot}">${train.trainid}. ${train.model} / ${train.capa}석</option>
					</c:forEach>
				</select>
				<label for="returnUnitPrice">금액:</label>
				<input type="text" id="returnUnitPrice" name="returnUnitPrice" readonly>
			</div>
		</div>
		<button type="submit">열차편 추가</button>
	</form>
</section>
</body>
</html>