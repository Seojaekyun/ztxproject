<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="com.example.demo.dto.StationsDto" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>항공편 추가</title>
<style>
	body {
		font-family: 'Noto Sans KR', sans-serif;
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
	// 출발지와 도착지의 시간대 정보를 저장할 변수
	var departureTimezone = "";
	var arrivalTimezone = "";
	
	// 패드 제로 함수
	function padZero(value) {
		return ("0" + value).slice(-2);
	}
	
	// 귀국편 공항 설정 함수
	function setReturnRoutesStations() {
		var departure = document.getElementById("departure").value;
		var arrival = document.getElementById("arrival").value;
		document.getElementById("returnDeparture").value = arrival || "";
		document.getElementById("returnArrival").value = departure || "";
	}
	
	// 도착 공항 목록 갱신 함수
	function updateArrival() {
		var departure = document.getElementById("departure").value;
		var arrivalSelect = document.getElementById("arrival");
		
		// 기존 옵션 제거
		arrivalSelect.innerHTML = "";
		
		// 공항 데이터를 JavaScript 배열로 전달
		var stations = [
			<c:forEach var="station" items="${stations}" varStatus="status">
			{ code: '${station.line}', name: '${station.stationName}' }<c:if test="${!status.last}">,</c:if>
			</c:forEach>
		];
		
		if(departure === "ICN" || departure === "GMP") {
			// 출발 공항이 ICN 또는 GMP인 경우
			Stations.forEach(function(Station) {
				if (Station.code !== "ICN" && Station.code !== "GMP") {
					var option = document.createElement("option");
					option.value = Station.code;
					option.text = Station.name;
					arrivalSelect.appendChild(option);
				}
			});
		}
		else {
			// 출발 공항이 ICN 또는 GMP가 아닌 경우
			var options = [
				{ code: "ICN", name: "인천 국제공항" }, { code: "GMP", name: "김포 국제공항" }
			];
			options.forEach(function(Station) {
				var option = document.createElement("option");
				option.value = Station.code;
				option.text = Station.name;
				arrivalSelect.appendChild(option);
			});
		}
		
		
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
	
	// 이벤트 리스너 등록
	window.onload = function() {
		// 출발 공항 변경 시
		document.getElementById("departure").addEventListener("change", function() {
			updateArrival();
		});
		
		// 도착 공항 변경 시
		document.getElementById("arrival").addEventListener("change", function() {
			setReturnRouteStations();
		});
		
		// 출발편 날짜 및 시간 변경 시
		var departureFields = ["departureDate", "departureHour", "departureMinute"];
		departureFields.forEach(function(field) {
			document.getElementById(field).addEventListener("change", calculateDepartureArrivalTime);
		});
		
		// 귀국편 날짜 및 시간 변경 시
		var returnFields = ["returnDepartureDate", "returnDepartureHour", "returnDepartureMinute"];
		returnFields.forEach(function(field) {
			document.getElementById(field).addEventListener("change", calculateReturnArrivalTime);
		});
		
		// 초기화
		updatearrivals();
	};
	
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment-timezone/0.5.40/moment-timezone-with-data.min.js"></script>
</head>
</head>
<body>
<section>
	<h2>항공편 추가</h2>
	<form action="/admin/addRoutes" method="post" onsubmit="combineTimes()">
		<div class="flex-container">
			<div class="flex-item">
				<h3>출발편 정보</h3>
				<label for="departure">출발역:</label>
				<select id="departure" name="departure" required>
					<option value="">선택</option>
					<c:forEach var="Station" items="${Stations}">
					<option value="${Station.Stationid}">${Station.depot}</option>
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
				<label for="routeTimeDisplay">비행 시간:</label>
				<input type="text" id="routeTimeDisplay" name="ftime" readonly>
				<!-- 비행 시간 저장을 위한 숨겨진 필드 -->
				<input type="hidden" id="routeTime" name="ftimeValue">
				<label for="arrivalTime">도착 시간:</label>
				<textarea id="arrivalTime" name="arrivalTime" readonly></textarea>
				<input type="hidden" id="departureTime" name="departureTime">
				<label for="TrainId">비행기:</label>
				<select id="TrainId" name="TrainId" required>
					<c:forEach var="train" items="${Traines}">
					<option value="${train.Trainid}">${train.Trainid}. ${train.model} / ${train.capa}석</option>
					</c:forEach>
				</select>
				<label for="unitPrice">금액:</label>
				<input type="text" id="unitPrice" name="unitPrice" readonly>
				
			</div>
			
			<div class="flex-item">
				<h3>귀국편 정보</h3>
				<label for="returnDeparture">출발 공항:</label>
				<input type="text" id="returnDeparture" name="returnDeparture" readonly>
				<label for="returnArrival">도착 공항:</label>
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
				<input type="hidden" id="returnrouteHour" name="returnrouteHour">
				<input type="hidden" id="returnrouteMinute" name="returnrouteMinute">
				<!-- Display return route time -->
				<label for="returnrouteTimeDisplay">비행 시간:</label>
				<input type="text" id="returnrouteTimeDisplay" name="returnFtime" readonly>
				<!-- 귀국편 비행 시간 저장을 위한 숨겨진 필드 -->
				<input type="hidden" id="returnrouteTime" name="returnFtimeValue">
				<label for="returnArrivalTime">도착 시간:</label>
				<textarea id="returnArrivalTime" name="returnArrivalTime" readonly></textarea>
				<input type="hidden" id="returnDepartureTime" name="returnDepartureTime">
				<label for="returnTrainid">열차:</label>
				<select id="returnTrainid" name="returnTrainid" required>
					<c:forEach var="train" items="${Traines}">
					<option value="${train.Trainid}">${train.Trainid}. ${train.model} / ${train.capa}석</option>
					</c:forEach>
				</select>
				<label for="returnUnitPrice">금액:</label>
				<input type="text" id="returnUnitPrice" name="returnUnitPrice" readonly>
			</div>
		</div>
		<button type="submit">항공편 추가</button>
	</form>
</section>
</body>
</html>