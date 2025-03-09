<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MAIN</title>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<style>
	body {
		margin: 0;
		font-family: Arial, sans-serif;
		background-color: #f4f4f4;
	}
	.main_content {
		display: none;
	}
	.train_service {
		position: relative;
		background-image: url('../static/resources/t0.jpg');
		background-position: bottom;
		background-size: cover;
		width: 100%;
		height: 700px;
		background-repeat: no-repeat;
		z-index: 2;
		margin: auto;
	}
	.booking_contents {
		position: relative;
		top: 36.3rem;
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		background-color: rgba(7, 142, 185, 0.8);
		border: none;
		width: 100%;
		height: 120px;
		z-index: 3;
		margin: auto;
	}
	.active-button  {
		background-color: #1f0c59 !important;
		color: white !important;
		padding: 10px 20px !important;
		border-radius: 25px !important;
		border: 1px solid #1f0c59 !important;
		font-size: 16px !important;
		font-weight: bold !important;
		cursor: pointer !important;
	}
	.active-button:hover {
		text-decoration: underline !important;
		text-decoration-color: white !important;
	}
	.inner {
		position: absolute;
		transform: translateY(40%);
		left: 9px;
		top: 1px;
		opalocation: 0.6;
		background:#fff;
		z-index:2;
	}
	#quick_booking {
		display: flex;
		flex-direction: column;
		justify-content: space-between;
		align-items: center;
		align-self: flex-start;
		width: 500px;
		margin-right: 15px;
	}
	.qbbtitle {
		display: flex;
		width: 500px;
		justify-content: space-between;
		font-size: 16px;
		font-weight: 600;
		color: white;
	}
	.quickbook {
		display: flex;
		justify-content: space-between;
		align-items: center;
		align-self: flex-start;
		width: 500px;
		padding:0px;	
	}
	.qbbdep, .qbbarr {
		display: inline-block;
		width: 247px;
		text-align: left;
		padding: 5px;
		margin: 0 5px;
	}
	.quick_booking_button {
		display: flex;
		justify-content: space-between; /* 내부 요소를 양쪽 끝으로 정렬 */
		align-items: center; /* 세로 중앙 정렬 */
		flex: 1;
		text-align: left;
		margin: 0 5px;
		padding: 5px;
		border-bottom: 1px solid white;
		background: none;
		cursor: pointer;
		font-size: 16px;
		color: white;
		width: 100%; /* 버튼이 충분한 너비를 가지도록 설정 */
	}
	.date_wrap, .passenger-btn {
		display: flex;
		justify-content: space-between; /* 내부 요소를 양쪽 끝으로 정렬 */
		align-items: center; /* 세로 중앙 정렬 */
		flex: 1;
		text-align: left;
		padding: 5px;
		background: none;
		cursor: pointer;
		font-size: 16px;
		color: white;
		width: 100%; /* 버튼이 충분한 너비를 가지도록 설정 */
	}
	.quick_booking_button span {
		flex: 1; /* 텍스트가 왼쪽으로 정렬되도록 설정 */
		text-align: left; /* 왼쪽 정렬 */
		display:block;
	}
	.quick_booking_button i {
		position: static; /* 아이콘과 텍스트 간격 조정 */
	}
	.quick_booking_button:first-child {
		flex-grow: 2;
	}
	.quick_booking_button:last-child {
		flex-grow: 2;
	}
	#from-text {
		display: block;
		margin: 0;
	}
	#from-text, #to-text {
		font-size: 20px;
		font-weight: bold;
	}
	.popup {
		position: fixed;
		top: 150px;
		left: 20%;
		width: 760px;
		padding: 20px;
		background-color: white;
		border: 1px solid #ccc;
		box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
		border-radius: 15px;
		z-index:1000;
		list-style:none;
	}
	.station-list {
	    padding: 10px;
	    margin: 0;
	}
	
	.station-row {
	    display: flex;
	    justify-content: space-between;
	    margin-bottom: 10px;
	}
	.station-btn {
	    width: 18%;
	    padding: 10px 5px;
	    font-size: 12px;
	    background-color: white;
	    border: 1px solid #ddd;
	    border-radius: 18px;
	    cursor: pointer;
	    text-align: center;
	    margin-bottom: 5px;
	}
	.station-btn:hover {
	    background-color: #e0e0e0;
	}
	.quick_booking_aligner {	
		display: flex;
	    flex-direction: row;
	    justify-content: center;
	    align-items: center;
	    width: 100%;
	}
	.flatpickr-calendar {
		position: fixed;
		left: 40%;
		top : 500px;
		border-radius: 10px;
		box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
		font-size: 16px;
		font-weight: 500;
	}
	.datetitle, .passtitle {
		display: flex;
		width: 200px;
		justify-content: space-between;
		font-size: 16px;
		font-weight: 600;
		color: white;
	}
	.date_selection {
		margin-top: 4px;
	}
	.date_selection, #passenger_selection {
		margin-right: 15px;
		border-bottom: 1px solid white;
	}
	.date_selection input, #passenger_selection .passenger-btn {
		background-color: transparent;
		border: none;
		font-size: 20px;
		color: white;
		cursor: pointer;
		text-align: left;
		outline: none;
	}
	.date_selection .date_wrap {
		position:relative;
		width: 220px;
	}
	i {
		font-size:20px;
		color: white;
	}
	.date_selection .date_wrap input {
		width:100%;
		
	}
	#date-btn {
		display: flex;
		align-items: center;
		padding-right: 10px;
	}
	#passenger_selection .passenger-btn {
		width: 100%;
	}
	.passenger-btn span {
		flex: 1; /* 텍스트가 왼쪽으로 정렬되도록 설정 */
		text-align: left; /* 왼쪽 정렬 */
	}
	.passenger-btn i {
		position: static;
		font-size:20px;
		color: white;
	}
	.passenger-popup {
		position: absolute;
		top: -70px;
		left: 60%;
		width: 180px;
		padding: 20px;
		background-color: white;
		border: 1px solid #ccc;
		box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
		z-index: 1000;
		border-radius: 15px;
	}
	.passenger-er {
		display: flex;
		justify-content: space-around;
		align-items: center;
	}
	.passenger-type {
		display: flex;
		align-items: center;
		margin-top: 20px;
		font-size: 20px;
	}
	.decrease-btn, .increase-btn {
		width: 30px;
		height: 30px;
		border-radius: 50%;
		border: 1px solid #ccc;
		background-color: #fff;
		font-size: 20px;
		display: flex;
		align-items: center;
		justify-content: center;
		cursor: pointer;
		margin: 0 10px;
	}
	#search_button {
		width: 140px;
		background-color: white;
		color: #078eb9;
		padding: 5px 10px;
		border: none;
		border-radius: 25px;
		cursor: pointer;
		height: 50px;
		font-size: 18px;
		font-weight: 600;
		margin-left: 10px;
		margin-bottom:5px;
	}
	#search {
		display: flex;
		justify-content: flex-start;
		align-items: center;
	}
	#station-list li, #arrival-list li {
		list-style-type: none;
		padding: 10px;
		background-color: white;
		border-bottom: 1px solid #ddd;
		cursor: pointer;
		font-size: 16px;
		color: #333;
		transition: background-color 0.3s ease;
	}
	.popup-overlay {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background-color: rgba(0, 0, 0, 0.7);
		z-index: 999;
	}
	.close-btn {
		position: absolute;
		top: 10px;
		right: 10px;
		font-size: 24px;
		cursor: pointer;
		color: #333;
	}
	h3 {
		margin-bottom: 20px;
		font-size: 22px;
		font-weight: 800;
	}
	.fade-in-section {
		width: 100%;
		margin: auto;
		padding: 50px 0;
		opalocation: 0;
		transform: translateY(20px);
		transition: opalocation 0.6s ease-out, transform 0.6s ease-out;
	}
	.fade-in-section.visible {
		opalocation: 1;
		transform: translateY(0);
	}
	.promotion-section {
		background-color: #fff;
		padding: 50px 0;
		position: relative;
		z-index: 1;
	}
	.promotion-container {
		width: 1000px;
		max-width: 90%;
		margin: auto;
		display: flex;
		flex-wrap: wrap;
		gap: 20px;
	}
	.promotion-item {
		flex: 1 1 calc(33.333% - 20px);
		background-color: #eaeaea;
		border-radius: 10px;
		overflow: hidden;
		text-align: center;
	}
	.promotion-item img {
		width: auto;
		height: 205px;
	}
	.promotion-item h3 {
		margin: 15px 0;
	}
	.promotion-item p {
		padding: 0 15px 15px;
		color: #555;
	}
	.customer-review-section {
		position: relative;
		z-index: 1;
		background-color: #D0E7F6;
		padding: 50px 0;
	}
	.review-container {
		width: 1000px;
		max-width: 90%;
		margin: auto;
		display: flex;
		flex-wrap: wrap;
		gap: 20px;
	}
	.review {
		background-color: #fff;
		border-radius: 10px;
		padding: 20px;
		margin-bottom: 20px;
		width: 32%;
		display: flex;
		justify-content: space-between;
	}
	.review div{
		background-color: #fff;
		display: inline-block;
	}
	.review h4 {
		margin-bottom: 10px;
	}
	.review p {
		color: #555;
	}
	.promotion-container .promotion-item:hover {
		transform: translateY(-5px);
		transition: transform 0.3s ease;
	}
	.review-container .review:hover {
		transform: translateY(-5px);
		transition: transform 0.3s ease;
	}
	.station-code {
		font-weight: bold;
	}
	a {
		text-decoration: none;
		color: black;
	}
	
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr@4.6.9/dist/l10n/ko.js"></script>
<script>
	function openPopup(type) {
		closeAllPopups();
		if (type === 'passenger') {
			document.getElementById('passenger-selection-popup').style.display = 'block';
		}
		else if (type === 'departure') {
			document.getElementById('popup').style.display = 'block';
			loadDeparture();
		}
		else if (type === 'arrival') {
			document.getElementById('arrival-popup').style.display = 'block';
			loadArrival();
		}
	}
	function closeAllPopups() {
		document.getElementById('passenger-selection-popup').style.display = 'none';
		document.getElementById('popup').style.display = 'none';
		document.getElementById('arrival-popup').style.display = 'none';
	}
	function closePopup(type) {
		if (type === 'passenger') {
			document.getElementById('passenger-selection-popup').style.display = 'none';
		}
		else if (type === 'departure') {
			document.getElementById('popup').style.display = 'none';
		}
		else if (type === 'arrival') {
			document.getElementById('arrival-popup').style.display = 'none';
		}
	}
	document.addEventListener('click', function(event) {
		const passengerPopup = document.getElementById('passenger-selection-popup');
		const passengerBtn = document.getElementById('passenger-btn');
		if (passengerPopup.style.display === 'block' && !passengerPopup.contains(event.target) && event.target !== passengerBtn) {
			passengerPopup.style.display = 'none';
		}
	});
	document.addEventListener('DOMContentLoaded', function () {
		loadDeparture();
	});
	function loadDeparture() {
	    var xhr = new XMLHttpRequest();
	    xhr.open('GET', '/train/stations');
	    xhr.onreadystatechange = function() {
	        if (xhr.readyState === 4 && xhr.status === 200) {
	            var data = JSON.parse(xhr.responseText);
	            var stationList = document.getElementById('station-list');
	            if (stationList) {
	                stationList.innerHTML = '';  // 리스트 초기화
	                var defaultStation = data.find(station => station.stationName === '서울');
	                if (defaultStation) {
	                    document.getElementById('from-text').textContent = defaultStation.stationName;
	                } else {
	                    document.getElementById('from-text').textContent = '서울';
	                }

	                // 역 버튼을 4개씩 한 줄에 배치
	                var row;
	                data.forEach(function(station, index) {
	                    if (index % 5 === 0) {
	                        row = document.createElement('div');
	                        row.classList.add('station-row');
	                        stationList.appendChild(row);
	                    }

	                    var button = document.createElement('button');
	                    button.classList.add('station-btn');
	                    button.textContent = station.stationName;
	                    
	                    // 클릭 시 값 전달하고, 페이지 이동 방지
	                    button.onclick = function(event) {
	                        event.preventDefault();  // 페이지 이동 방지
	                        document.getElementById('from-text').textContent = station.stationName;
	                        document.getElementById('from-hidden').value = station.stationName;
	                        closePopup('departure');  // 팝업 닫기
	                    };
	                    row.appendChild(button);
	                });
	            } else {
	                console.error('The element with id "station-list" is not found.');
	            }
	        } else if (xhr.readyState === 4 && xhr.status !== 200) {
	            console.error('Failed to load stations data. Status: ' + xhr.status);
	            document.getElementById('from-text').textContent = '서울';
	        }
	    };
	    xhr.onerror = function() {
	        console.error('Request failed');
	        document.getElementById('from-text').textContent = '서울';
	    };
	    xhr.send();
	}

	function loadArrival() {
	    var xhr = new XMLHttpRequest();
	    xhr.open('GET', '/train/stations');
	    xhr.onload = function() {
	        var data;
	        try {
	            data = JSON.parse(xhr.responseText);
	        } catch (error) {
	            return;
	        }
	        if (!Array.isArray(data)) {
	            return;
	        }
	        var stationList = document.getElementById('arrival-list');
	        if (stationList) {
	            stationList.innerHTML = '';  // 리스트 초기화

	            // 역 버튼을 4개씩 한 줄에 배치
	            var row;
	            data.forEach(function(station, index) {
	                if (index % 5 === 0) {
	                    row = document.createElement('div');
	                    row.classList.add('station-row');
	                    stationList.appendChild(row);
	                }

	                var button = document.createElement('button');
	                button.classList.add('station-btn');
	                button.textContent = station.stationName;
	                
	                // 클릭 시 값 전달하고, 페이지 이동 방지
	                button.onclick = function(event) {
	                    event.preventDefault();  // 페이지 이동 방지
	                    document.getElementById('to-text').textContent = station.stationName;
	                    document.getElementById('to-hidden').value = station.stationName;
	                    closePopup('arrival');  // 팝업 닫기
	                };
	                row.appendChild(button);
	            });
	        } else {
	            console.error('The element with id "arrival-list" is not found.');
	        }
	    };
	    xhr.send();
	}

	document.addEventListener('DOMContentLoaded', function () {
	    const bookingButton = document.getElementById('booking');
	    const dateInput = document.getElementById('date-btn');
	    let tripMethod = "one-way";

	    if (bookingButton) {
	        // showContent 함수가 정의되어 있다고 가정
	        showContent('booking');
	        bookingButton.parentNode.classList.add('active');
	    }
	    
	    flatpickr("#date-btn", {
	        locale: "ko",
	        mode: "single",
	        dateFormat: "Y-m-d",
	        showMonths: 1,
	        defaultDate: "today",
	        minDate: "today",
	        onChange: function (selectedDates, dateStr, instance) {
	            if (selectedDates.length === 1) {
	                dateInput.value = "가는 날: " + selectedDates[0].toLocaleDateString();
	                document.getElementById('departureDate-hidden').value = instance.formatDate(selectedDates[0], "Y-m-d");
	            }
	        }
	    });
	    
	    if (dateInput) {
	        dateInput.placeholder = "가는 날";
	    }
	});
	function showContent(type) {
		document.querySelectorAll('.booking_contents').forEach(function(el) {
			el.style.display = 'none';
		});
		if (type === 'booking') {
			document.querySelector('.booking_contents').style.display = 'block';
		}
	}
	function updateButtonTextWithIcon(buttonId, newText) {
		var button = document.getElementById(buttonId);
		
		var span = button.querySelector('span');
		if (span) {
			span.textContent = newText;
		}
		
	}
	function updatePassengerButton() {
		var resnum = parseInt(document.getElementById('resnum').textContent, 10) || 0;
		var passengerText = resnum + '명';
		var additionalPassengers = [];
		if (additionalPassengers.length > 0) {
			if (additionalPassengers.length === 1) {
				passengerText += ', ' + additionalPassengers[0] + '···';
			}
			else {
				passengerText += ', ' + additionalPassengers[0] + '···';
			}
		}
		document.getElementById('passenger-btn').innerHTML = passengerText;
		var passengerBtn = document.getElementById('passenger-btn');
		passengerBtn.innerHTML = '';
		passengerBtn.append(' ' + passengerText);
		var passengersValue = resnum;
		document.getElementById('resnum-hidden').value = resnum;
		
	}
	document.addEventListener('DOMContentLoaded', function() {
		updatePassengerButton();
	});
	function increase(type) {
		var resnum = parseInt(document.getElementById('resnum').textContent);
		var totalPassengers = resnum;
		if (type === 'resnum' && totalPassengers < 10) {
			resnum += 1;
	        document.getElementById('resnum').textContent = resnum;
	        // 여기서 resnum-hidden의 value 값을 업데이트
	        document.getElementById('resnum-hidden').value = resnum;
		}
		updatePassengerButton();
	}
	function decrease(type) {
		var resnum = parseInt(document.getElementById('resnum').textContent);
		if (type === 'resnum' && resnum > 1) {
			resnum -= 1;
	        document.getElementById('resnum').textContent = resnum;
	        // 여기서 resnum-hidden의 value 값을 업데이트
	        document.getElementById('resnum-hidden').value = resnum;
		}
		updatePassengerButton();
	}
	function revealSections() {
		const sections = document.querySelectorAll('.fade-in-section');
		const windowHeight = window.innerHeight;
		sections.forEach(section => {
			const sectionTop = section.getBoundingClientRect().top;
			if (sectionTop < windowHeight - 100) {
				section.classList.add('visible');
			}
		});
	}
	window.addEventListener('scroll', revealSections);
	window.addEventListener('load', revealSections);
	$(function() {
		var currentURL = window.location.pathname;
		var referrerURL = document.referrer ? (new URL(document.referrer)).pathname : '';
		function isIndex(url) {
			return url === '/' || url.endsWith('/index') || url.endsWith('/index.html') || url.endsWith('/index.php');
		}
		if (isIndex(currentURL) && (!referrerURL || !isIndex(referrerURL))) {
			$('.main_content').slideDown(1000);
		}
		else if (!isIndex(currentURL) && isIndex(referrerURL)) {
			$('.main_content').slideUp(500);
		}
		else if (!isIndex(currentURL) && (!referrerURL || !isIndex(referrerURL))) {
						
		}
		else {
			$('.main_content').show();
		}
	});
	function selectDeparture(stationName, stationName) {
		document.getElementById('from-text').textContent = stationName;
		document.getElementById('from-hidden').value = stationName;
		closePopup('departure');
	}
	function selectArrival(stationName, stationName) {
		document.getElementById('to-text').textContent = stationName;
		document.getElementById('to-hidden').value = stationName;
		closePopup('arrival');
	}
	function getDayOfWeek(day) {
		const weekdays = ['일', '월', '화', '수', '목', '금', '토'];
		return weekdays[day];
	}
	function getDateOptions() {
		const select = document.getElementById('cdate');
		const today = new Date();
		for(var i = -1; i <= 2; i++) {
			var optionDate = new Date();
			optionDate.setDate(today.getDate() + i);
			var year = optionDate.getFullYear();
			var month = ('0' + (optionDate.getMonth() + 1)).slice(-2);
			var day = ('0' + optionDate.getDate()).slice(-2);
			var dayOfWeek = getDayOfWeek(optionDate.getDay());
			var dateString = year+"-"+month+"-"+day+" ("+dayOfWeek+")";
			var dateValue = year+"-"+month+"-"+day;
			var option = document.createElement('option');
			option.value = dateValue;
			option.textContent = dateString;
		}
	}
	document.addEventListener('DOMContentLoaded', function() {
		getDateOptions();
	});
	function enforceUppercase(element) {
		element.value = element.value.toUpperCase();
		element.value = element.value.replace(/[^A-Z]/g, '');
	}
	
</script>
</head>
	<body>
	<section>
		<div class="main_content">
			<div class="train_service">
				<div class="booking_contents">
					<div id="popup-overlay" class="popup-overlay" style="display: none;"></div>
					<form action="${pageContext.request.contextPath}/routes/search" method="get">
						<div class="quick_booking_aligner">
							<div id="quick_booking">
								<div class="qbbtitle">
									<div class="qbbdep">출발</div>
									<div class="qbbarr">도착</div>
								</div>
								<div class="quickbook">
									<div class="quick_booking_button" onclick="openPopup('departure')">
										<span id="from-text">From</span>
										<i class="fa-solid fa-paper-plane"></i>
									</div>
									
									<div class="quick_booking_button" onclick="openPopup('arrival')">
										<span id="to-text">부산</span>
										<i class="fa-solid fa-location-dot"></i>
									</div>
								</div>
							</div>
							<div id="popup" class="popup" style="display: none;">
								<span class="close-btn" onclick="closePopup('departure')">&times;</span>
								<h2>출발지 선택</h2>
								<div id="station-list" class="station-list"></div>
							</div>
								
							<div id="arrival-popup" class="popup" style="display: none;">
								<span class="close-btn" onclick="closePopup('arrival')">&times;</span>
								<h2>도착지 선택</h2>
								<div id="arrival-list" class="station-list"></div>
							</div>
							<input type="hidden" name="departure" id="from-hidden">
							<input type="hidden" name="arrival" id="to-hidden">
							<div class="date_selection">
								<div class="datetitle">
									<div class="qbbdep">출발일</div>
								</div>
								<div class="date_wrap">
									<input type="text" id="date-btn" placeholder="가는 날 : ">
									<i class="fa-solid fa-calendar-alt"></i>
								</div>
							</div>
							<input type="hidden" name="departureDate" id="departureDate-hidden">
							<div id="passenger_selection">
								<div class="passtitle">
									<div class="qbbdep">인원</div>
								</div>
								<div class="passenger-btn" onclick="openPopup('passenger')">
									<span id="passenger-btn">인원수</span>
									<i class="fa-solid fa-user"></i>
								</div>
							</div>
							<input type="hidden" name="resnum" id="resnum-hidden" value="1">
							<div id="passenger-selection-popup" class="passenger-popup" style="display: none;">
								<span class="close-btn" onclick="closePopup('passenger')">&times;</span>
								<h2>인원</h2>
								<div class="passenger-er">
									<div class="passenger-type">
										<button type="button" class="decrease-btn" onclick="decrease('resnum')">-</button>
										<span id="resnum">1</span>
										<button type="button"class="increase-btn" onclick="increase('resnum')">+</button>
									</div>
								</div>
							</div>
							<div id="search">
								<button type="submit" id="search_button">
									<span>열차조회</span>
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div id="sec2" class="sec2 promotion-section fade-in-section">
			<h3 style="text-align: center;">프로모션</h3>
			<div class="promotion-container">
				<c:forEach items="${plist}" var="pdto">
				<div class="promotion-item" onclick="window.location.href='../promot/promotReadnum?id=${pdto.id}'">
					<img src="../static/resources/${pdto.fname}" alt="이벤트 이미지">
					<br>
					<h3>${pdto.title}</h3>
					<p>${pdto.subtitle}</p>
				</div>
				</c:forEach>
			</div>
		</div>
		<div id="sec3" class="sec3 customer-review-section fade-in-section">
			<h3 style="text-align: center;">고객 후기</h3>
			<div class="review-container">
				<c:forEach items="${relist}" var="redto">
				<div class="review" onclick="window.location.href='../review/reviewReadnum?id=${redto.id }'">
					<div>
						<h3>${redto.name}</h3>
						<p>${redto.content}</p>
					</div>
					<c:if test="${redto.fname != null}">
					<div>
						<img src="../static/resources/${redto.fname}" style="width: 100px;" alt="리뷰 이미지">
					</div>
					</c:if>
				</div>
				</c:forEach>
			</div>
		</div>
	</section>
	</body>
</html>