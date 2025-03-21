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
	}
	.container {
		max-width: 100%; /* 창 폭 제한 */
	}
	.train {
	    display: flex;
	    flex-direction: column;
	    justify-content: center;
	    background-image: url('../static/resources/trainseat.jpg');
	    background-size: 1035px 272px;
	    background-repeat: no-repeat;
	    height: 273px;
	}
	.seat-container {
	    display: flex;
	    flex-direction: column;
	    align-items: flex-start;
	    padding-left: 143px;
	    padding-top: 9px;
	}
	.seat {
	    width: 42px;  /* 좌석의 너비 */
	    height: 40.5px; /* 좌석의 높이 */
	    color: black;
	    font-size: 12px;
	    font-weight: bold;
	    text-align: center;
	    cursor: pointer;
	    border-radius: 8px;
	    margin: 0px 5px 2px;
	    transition: transform 0.3s, box-shadow 0.3s;
	    position: relative;
	    display: inline-block;
	}
	.seat-image-wrapper {
	    position: relative;
	    display: inline-block;
	}
	.seat-image-wrapper img {
	    width: 100%; /* 또는 원하는 크기 */
	    height: auto; /* 비율을 유지하면서 크기 조정 */
	}
	.seat-number {
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    width: 50px;
	    transform: translate(-50%, -50%);
	    color: black; /* 텍스트 색상 */
	    font-size: 10px; /* 텍스트 크기 */
	    font-weight: bold; /* 텍스트 굵기 */
	    text-align: left;
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
	.btn-primary {
		width: 100px;
		padding: 5px 10px;
		border-radius: 25px;
		font-size: 12px;
		background: #078EB9;
	}
	.btn-primary:hover {
		background-color: #0077cc;
	}
	.seat-container div {
		transition: transform 0.3s, background-color 0.3s;
	}
	.seat-container .row div:hover {
		transform: scale(1.1);
		
	}
	.mt-1 {
		background: white;
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding: 10px;
	}
	.pagination {
		margin: auto;
		display: flex;
		justify-content: center;
		font-weight: bold;
	}
	.pagination > a {
		text-decoration: none;
	}
	#currentPage {
		margin-top: 1.5px;
		width: 70px;
		height: 22px;
		text-align: center;
		line-height: 20px;
		border-top: 2.5px solid black;
		border-bottom: 2.5px solid black;
	}
</style>
<script>
	var maxSelectableSeats = ${resnum};  // 탑승객 수
	var selectedSeats = [];
	
	// 좌석 선택 함수
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

		// 선택된 좌석 수 실시간 업데이트
		document.getElementById('selectedSeatCount').innerText = selectedSeats.length;
	}
	
	// 선택 확인 함수
	function confirmSelection() {
		const seatCountElement = document.getElementById('selectedSeatCount');
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
		<div style="display: flex; justify-content: space-between;">
			<div style="display: inline-block;"><b>열차:&nbsp;</b> 은하-${routeid}호&nbsp;&nbsp;<b>선택한 좌석 수:&nbsp;&nbsp;<span id="selectedSeatCount">0</span>&nbsp;/&nbsp;${resnum}명</b> </div>
			<div align="right" style="font-size: 12px; display: inline-block;">
				&nbsp;선택가능<img src="/static/resources/seat.png">
				&nbsp;선택불가<img src="/static/resources/xseat.png">
				&nbsp;콘센트<img src="/static/resources/concent.png">
			</div>
		</div>
		<!-- 선택한 좌석 표시 -->
		<div class="mt-1">
			<div style="width:200px; margin-left: 100px;">선택한 좌석:&nbsp;<span id="selectedSeatsDisplay"></span></div>
			<div class="pagination">
				<c:if test="${currentPage == 0}">
				이전<img src="../static/resources/prevtrain.png" style="width: 70px; cursor: not-allowed;">
				</c:if>
				<c:if test="${currentPage > 0}">
				<a href="/routes/seats?routeid=${routeid}&resnum=${resnum}&page=${currentPage - 1}&size=${pageSize}">
					이전<img src="../static/resources/prevtrain.png" style="width: 70px;">
				</a>
				</c:if>
				<span id="currentPage">${1 + currentPage}호차</span>
				<c:if test="${(currentPage+1) < totalPages}">
				<a href="/routes/seats?routeid=${routeid}&resnum=${resnum}&page=${currentPage + 1}&size=${pageSize}">
					<img src="../static/resources/nexttrain.png" style="width: 70px;">다음
				</a>
				</c:if>
				<c:if test="${(currentPage+1) == totalPages}">
				<img src="../static/resources/nexttrain.png" style="width: 70px; cursor: not-allowed;">다음
				</c:if>
			</div>
			<!-- 선택 완료 버튼 -->
			<div style="width:200px; padding-left: 100px; margin-right: 100px;">
				<input type="button" class="btn btn-primary" onclick="confirmSelection()" value="선택 완료">
			</div>
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
									<img src="${seats[index].reserv ? '/static/resources/avai_seat.png' : '/static/resources/disable_seat.png'}">
									<span class="seat-number">&nbsp;&nbsp;${seats[index].seatnum}</span>
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