<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 확인</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
<style>
	main {
		top: -95px;
		position: relative;
	}
    .nullbox {
		height: 95px;
		display: flex;
		background-color: #078EB9;
	}
	.reservation-info {
		margin-top: 30px;
	}
	.train-info, .passenger-info, .price {
		margin-bottom: 30px;
		border: 1px solid #ddd;
		padding: 20px;
		border-radius: 5px;
	}
	.buttons {
		margin-top: 20px;
	}
    a {
	    text-decoration: none;
	  	color: black;
    }
    a:hover {
		text-decoration: none;
		color:#004EA2;
	}
    form {
    	display: flex;
    	justify-content: space-between;
    }
</style>

</head>
<body>
<main>
	<div class="nullbox"></div>
	<div class="container">
		<h2 class="mt-4">예약 정보 확인</h2>
		<!-- 가는편 비행기 정보 -->
		<div class="train-info">
			<h4>열차 정보</h4>
			<table class="table table-bordered">
				<tr>
					<th>열차</th>
					<td>은하-${routeid}</td>
				</tr>
				<tr>
					<th>출발역</th>
					<td>${routeDeparture}</td>
				</tr>
				<tr>
					<th>도착역</th>
					<td>${routeArrival}</td>
				</tr>
				<tr>
					<th>출발시간</th>
					<td>${routeTime}</td>
				</tr>
				<tr>
					<th>도착시간</th>
					<td>${routeArrivalTime}</td>
				</tr>
				<tr>
					<th>예약인원</th>
					<td>${resnum}</td>
				</tr>
				<tr>
					<th>선택한 좌석</th>
					<td>${selectedSeats}</td>
				</tr>
				<tr>
					<th>금액</th>
					<td><fmt:formatNumber value="${charge}" type="number"/>원</td>
				</tr>
			</table>
		</div>
		<!-- 예약자 정보 -->
		<div class="passenger-info">
			<h4>예약자 정보</h4>
			<table class="table table-bordered">
				<tr>
					<th>예약자ID</th>
					<td>${userid}</td>
				</tr>
				<tr>
					<th>예약자성함</th>
					<td>${name}</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${userPhone}</td>
				</tr>
			</table>
		</div>
		<!-- 버튼 -->
		<div class="buttons">
			<form action="${pageContext.request.contextPath}/reserv/reservConfirm" method="post" style="display:inline;">
				<input type="hidden" name="userid" value="${userid}">
				<input type="hidden" name="routeid" value="${routeid}">
				<input type="hidden" name="selectedSeats" value="${selectedSeats}">
				<input type="hidden" name="resnum" value="${resnum}">
				<input type="hidden" name="routeDeparture" value="${routeDeparture}">
				<input type="hidden" name="routeArrival" value="${routeArrival}">
				<input type="hidden" name="routeTime" value="${routeTime}">
				<input type="hidden" name="routeArrivalTime" value="${routeArrivalTime}">
				<input type="hidden" name="charge" value="${charge}">
				<input type="button" class="btn btn-secondary" value="이전으로" onclick="history.back()">
				<button type="submit" class="btn btn-success">예약하기</button>
			</form>
			
		</div>
	</div>
</main>
<script>
	function checkFormSubmission() {
		const goingSeats = document.querySelector('input[name="goingSelectedSeats"]').value;
		
		console.log("Form 제출 확인 - 가는편 좌석: " + goingSeats);
	}
	
	document.querySelector('form').addEventListener('submit', checkFormSubmission);
</script>
</body>
</html>