<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좌석 선택</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
<style>
	body {
		background-color: #f7f7f7;
		font-family: Arial, sans-serif;
	}
	.container {
		margin-top: 20px;
		max-width: 100%; /* 창 폭 제한 */
	}
	.train {
	    display: flex;
	    flex-direction: column;
	    justify-content: center;
	    background-image: url('../static/resources/trainseat2.jpg');
	    background-size: 1035px 270px;
	    background-repeat: no-repeat;
	}
	.seat-container {
	    display: flex;
	    flex-direction: column;
	    align-items: flex-start;
	    padding-left: 143px;
	    padding-top: 15px;
	}
	.seatf {
		width: 42px; /* 크기 줄임 */
		height: 40px; /* 크기 줄임 */
		background-color: #00aaff; /* 하늘색 */
		color: white;
		font-size: 12px; /* 글씨 크기 줄임 */
		font-weight: bold;
		text-align: center;
		line-height: 60px;
		cursor: pointer;
		border-radius: 8px;
		margin: 2px 5px;
		transition: transform 0.3s, box-shadow 0.3s;
	}
	.seatb {
		width: 42px; /* 크기 줄임 */
		height: 40px; /* 크기 줄임 */
		background-color: #00aaff;
		color: white;
		font-size: 12px; /* 글씨 크기 줄임 */
		font-weight: bold;
		text-align: center;
		line-height: 55px;
		cursor: pointer;
		border-radius: 8px;
		margin: 2px 5px;
		transition: transform 0.3s, box-shadow 0.3s;
	}
	.seat {
	    width: 42px;  /* 좌석의 너비 */
	    height: 40px; /* 좌석의 높이 */
	    background-color: #00aaff;
	    color: white;
	    font-size: 12px;
	    font-weight: bold;
	    text-align: center;
	    line-height: 50px;
	    cursor: pointer;
	    border-radius: 8px;
	    margin: 2px 5px;
	    transition: transform 0.3s, box-shadow 0.3s;
	}
	.seat-number {
	    font-size: 10px;
	    font-weight: normal;
	}
	.available {
	    opacity: 1;
	}
	.unavailable {
	    opacity: 0.5;
	    cursor: not-allowed;
	}
	.selected {
	    box-shadow: 0px 0px 15px 5px #90EE90;
	    transform: scale(1.1);
	}
	.aisle {
	    width: 30px;
	    height: 100%;
	    background-color: transparent;
	}
	.row {
	    display: flex;
	    flex-wrap: wrap; /* 한 줄에 4개씩 배치하도록 설정 */
	    gap: 8px;
	    justify-content: center;
	    margin-bottom: 12px;
	}
	input [type="button"] {
		width: 100px;
		padding: 12px;
		font-size: 16px;
		font-weight: bold;
		background-color: #00aaff;
		border: none;
		border-radius: 8px;
		transition: background-color 0.3s;
		dsiplay: inline-block;
		align: right;
	}
	.btn-primary:hover {
		background-color: #0077cc;
	}
	.seat-container div {
		transition: transform 0.3s, background-color 0.3s;
	}
	.seat-container .row div:hover {
		transform: scale(1.1);
		background-color: #0099cc; /* 좌석 호버 시 색상 */
	}
	.mt-5 {
	display: flex;
		justify-content: space-between;
	}
</style>
<script>
	var maxSelectableSeats = ${resnum};  // 탑승객 수
	var selectedSeats = [];
	
	function selectSeat(element) {
		var isAvailable = element.getAttribute('data-available') === 'false';
		if (!isAvailable) {
			return; // 선택 불가능한 좌석
		}
		
		var seatNumber = element.getAttribute('data-seat-number');
		var index = selectedSeats.indexOf(seatNumber);
		
		if (index === -1) {
		    // 좌석 선택 시 제한 확인
			if (selectedSeats.length >= maxSelectableSeats) {
				alert('최대 ' + maxSelectableSeats + '개의 좌석만 선택할 수 있습니다.');
				return;
			}
			// 좌석 선택
			selectedSeats.push(seatNumber);
			element.classList.add('selected'); // 선택된 좌석에 'selected' 클래스 추가
		}
		else {
			// 좌석 선택 해제
			selectedSeats.splice(index, 1);
			element.classList.remove('selected'); // 선택 해제된 좌석에서 'selected' 클래스 제거
		}
		
		// 선택한 좌석 표시 업데이트
		document.getElementById('selectedSeatsDisplay').innerText = selectedSeats.join(', ');
	}
	
	function confirmSelection() {
	    if (selectedSeats.length === 0) {
	        alert('최소 한 개의 좌석을 선택해야 합니다.');
	        return;
	    }
	    
	    if (selectedSeats.length !== maxSelectableSeats) {
	        alert('탑승객 수에 맞게 좌석을 선택해 주세요.');
	        return;
	    }
	    
	    // 부모 페이지로 데이터 전송
	    window.parent.postMessage({ type: 'goingSeatsSelected', seats: selectedSeats }, '*');
	}

</script>
</head>
<body>
	<div class="container">
		<h2 class="mt-4">좌석 선택 - ${resnum}</h2>
		<p><b>열차:&nbsp;</b> 은하-${routeid}&nbsp;&nbsp;<b>탑승객 수:&nbsp;</b> ${resnum}명</p>
		<div class="pagination">
			<c:if test="${currentPage > 0}">
			<a href="/routes/seats?routeid=${routeid}&resnum=${resnum}&page=${currentPage - 1}&size=${pageSize}">이전호&nbsp;</a>
			</c:if>
			<span>${1 + currentPage}호차</span>
			<c:if test="${(currentPage+1) < totalPages}">
			<a href="/routes/seats?routeid=${routeid}&resnum=${resnum}&page=${currentPage + 1}&size=${pageSize}">&nbsp;다음호</a>
			</c:if>
			
		</div>
		<!-- 선택한 좌석 표시 -->
		<div class="mt-5">
			<span>선택한 좌석:&nbsp;<span id="selectedSeatsDisplay"></span></span>
			<!-- 선택 완료 버튼 -->
			<input type="button" class="btn btn-primary mt-4" onclick="confirmSelection()" value="선택 완료">
		</div>
		<div id="seatsContainer" class="train">
		    <div class="seat-container">
		        <!-- 4개씩 세로로 배치 -->
		        <c:forEach var="col" begin="0" end="3">
			        <c:if test="${col == 2}">
				        <div class="aisle" style="height:30px;"></div>
				    </c:if>
		            <div class="row">
		                <c:forEach var="row" begin="0" end="${fn:length(seats) / 4}">
		                    <c:set var="index" value="${row * 4 + (3 - col)}" />
		                    <c:if test="${index < fn:length(seats)}">
		                        <div class="seat ${seats[index].reserv ? 'available' : 'unavailable'}" 
								     data-seat-number="${seats[index].seatnum}" 
								     data-available="${seats[index].reserv ? 'false' : 'true'}" 
								     onclick="selectSeat(this)">
								    ${seats[index].seatnum}
								</div>
		                    </c:if>
		                </c:forEach>
		            </div>
		        </c:forEach>
		    </div>
		</div>
	</div>
</body>
</html>