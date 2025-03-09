<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>
    body {
        font-family: 'Noto Sans KR', sans-serif;
        background-color: #f9f9f9;
        margin: 0;
        padding: 0;
    }
    section {
        display: flex;
        max-width: 1200px;
        margin: auto;
        justify-content: space-between;
    }
    #sec1 #tables {
    	margin: auto;
        display: flex;
        justify-content: space-between;
        width: 80%;
    }
    #sec2 #tables {
        display: flex;
        justify-content: space-between;
        width: 100%;
    }
    #sec1 .table-container {
        width: 100%;
        background-color: white;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        overflow: hidden;
        margin-bottom: 20px;
    }
    #sec2 .table-container {
        width: 33%;
        background-color: white;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        overflow: hidden;
        margin-bottom: 20px;
        height: 340px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 0;
        font-size: 12px;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: center;
        width: 120px;
    }
    th {
        background-color: #000A8E;
        color: white;
        text-transform: uppercase;
    }
    td {
        background-color: #f9f9f9;
    }
    caption {
        font-size: 16px;
        font-weight: bold;
        padding: 10px;
        background-color: #000A8E;
        color: white;
        text-align: left;
    }
    #sec1 #cal {
        width: 39%;
        height: 340px;
        background-color: white;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
    }
    .ui-datepicker {
    	margin: auto;
        width: 95% !important;
        height: 95%;
    }
    .ui-datepicker td {
        text-align: center;
        padding: 8px;
        border-radius: 4px;
        transition: background-color 0.3s ease;
    }
    .ui-datepicker td:hover {
        background-color: #4CAF50;
        color: white;
    }
    .ui-datepicker th {
        background-color: #000A8E;
        color: white;
    }
    .ui-datepicker-header {
        background-color: #4CAF50;
        color: white;
        border: none;
    }
    #selectedDate {
        font-size: 16px;
        font-weight: bold;
        color: #333;
    }
    .pagination {
        text-align: center;
        margin-top: 20px;
    }
    .pagination a {
        display: inline-block;
        padding: 5px 10px;
        margin: 0 3px;
        background-color: #4CAF50;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        font-size: 12px;
    }
    .pagination a.active, .pagination span.active {
        background-color: #333;
        color: white;
        cursor: default;
        text-decoration: none;
    }
    .pagination span {
        display: inline-block;
        padding: 5px 10px;
        margin: 0 3px;
        background-color: #4CAF50;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        font-size: 12px;
        cursor: default;
    }

</style>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<body>
<div style="width: 100%; text-align: center"><h2>예약상세관리</h2></div>
<!-- Section 1: 날짜 필터링된 예약 내역 (달력 포함) -->
<section id="sec1">
	<div id="tables">
		<!-- 전체 항공편 테이블 -->
		<div class="table-container" id="allFlights">
			<table>
				<caption>예약 상세</caption>
				<tr>
					<c:forEach var="rfn" items="${rsvfn}">
					<th colspan="2">항공편명</th>
					<td colspan="2">${rfn.flightName}</td>
					<th colspan="2">출항일시</th> 
					<td colspan="2">${rfn.departureTime}</td>
					</c:forEach>
				</tr>
				<tr>
					<th>PNR</th>
					<th>고객ID</th>
					<th>좌석등급</th>
					<th>예약인원</th>
					<th>요금</th>
					<th>결제여부</th>
					<th>요청</th>
					<th>처리</th>
				</tr>
				<c:forEach var="rsv" items="${rsvList}">
				<tr>
					<td>${rsv.pnr}</td>
					<td>${rsv.userid}</td>
					<td>${rsv.seatClass}</td>
					<td>${seatCounts[rsv.reservationId]}</td>
					<td>${rsv.charge} 원</td>
					<td>
						<c:if test="${rsv.state == 0}">
						<span id="badge1">결제완료</span> <!-- '필독' 배지 -->
						</c:if>
						<c:if test="${rsv.state == 1}">
						<span id="badge1">환불완료</span> <!-- '필독' 배지 -->
						</c:if>
						<c:if test="${rsv.state!=0 && rsv.state!=1}">
						<span id="badge1">미결제</span> <!-- '필독' 배지 -->
						</c:if>
					</td>
					<td>
						<c:if test="${rsv.chargePay == 0}">
						<span id="badge1"> - </span>
						</c:if>
						<c:if test="${rsv.chargePay == 1}">
						<span id="badge1"> - </span>
						</c:if>
						<c:if test="${rsv.chargePay == 2}">
						<span id="badge1"> 취소요청 </span> <!-- '필독' 배지 -->
						</c:if>
						<c:if test="${rsv.chargePay == 3}">
						<span id="badge1"> 취소완료 </span>
						</c:if>
						<c:if test="${rsv.chargePay == 4}">
						<span id="badge1"> 취소불가 </span>
						</c:if>
					</td>
					<td>
						<c:if test="${rsv.chargePay==0||rsv.chargePay==1||(rsv.chargePay==3&&rsv.state!=0)||rsv.chargePay==4 }">
						-
						</c:if>
						<c:if test="${rsv.chargePay==2 && (rsv.departureTime >= rsv.offerDay)}">
						<a href="cancelConfirm?flightName=${rsv.flightName}&departureTime=${rsv.departureTime}&reservationId=${rsv.reservationId}&flightId=${rsv.flightId}">
							<input type="button" value="취소처리">
						</a>
						</c:if>
						<c:if test="${rsv.chargePay==2 && (rsv.departureTime <= rsv.offerDay)}">
						<a href="cancelRejection?flightName=${rsv.flightName}&departureTime=${rsv.departureTime}&reservationId=${rsv.reservationId}&flightId=${rsv.flightId}">
							<input type="button" value="취소불가">
						</a>
						</c:if>
						<c:if test="${rsv.chargePay==3 && rsv.state==0 }">
						<a href="payReturn?flightName=${rsv.flightName}&departureTime=${rsv.departureTime}&reservationId=${rsv.reservationId}&flightId=${rsv.flightId}">
							<input type="button" value="환불처리">
						</a>
						</c:if>
					</td>
				</tr>
				</c:forEach>
				<c:if test="${empty rsvList}">
				<tr>
					<td colspan="3">예약 데이터가 없습니다.</td>
				</tr>
				</c:if>
			</table>
			<!-- 페이지네이션 -->
			<div class="pagination">
			    <c:if test="${totalPages > 1}">
			        <!-- 페이지네이션 범위 설정 -->
			        <c:set var="startPage" value="${currentPage - 1}" />
			        <c:set var="endPage" value="${currentPage + 1}" />
			
			        <!-- 시작 페이지가 1보다 작으면 1로 설정 -->
			        <c:if test="${startPage < 1}">
			            <c:set var="startPage" value="1" />
			            <c:set var="endPage" value="3" />
			        </c:if>
			
			        <!-- endPage가 totalPages보다 크면 totalPages로 설정 -->
			        <c:if test="${endPage > totalPages}">
			            <c:set var="endPage" value="${totalPages}" />
			        </c:if>
			
			        <!-- 총 페이지가 3페이지 이하인 경우, endPage와 startPage 조정 -->
			        <c:if test="${totalPages <= 3}">
			            <c:set var="endPage" value="${totalPages}" />
			            <c:set var="startPage" value="1" />
			        </c:if>
			
			        <!-- 이전 3페이지로 이동 버튼 -->
			        <c:if test="${currentPage > 3}">
			            <a href="javascript:void(0);" onclick="loadAllPage(${currentPage - 3});">이전 3</a>
			        </c:if>
			
			        <!-- 페이지 번호 표시 -->
			        <c:forEach begin="${startPage}" end="${endPage}" var="i">
			            <c:choose>
			                <c:when test="${i == currentPage}">
			                    <span class="active">${i}</span>
			                </c:when>
			                <c:otherwise>
			                    <a href="javascript:void(0);" onclick="loadAllPage(${i});">${i}</a>
			                </c:otherwise>
			            </c:choose>
			        </c:forEach>
			
			        <!-- 다음 3페이지로 이동 버튼 -->
			        <c:if test="${currentPage + 3 <= totalPages}">
			            <a href="javascript:void(0);" onclick="loadAllPage(${currentPage + 3});">다음 3</a>
			        </c:if>
			    </c:if>
			</div>
		</div>
	</div>
</section>

<script>
function loadAllPage(page) {
    // 현재 URL에 페이지 파라미터 추가
    const url = new URL(window.location.href);
    url.searchParams.set('page', page);  // 페이지 번호 설정
    
    // 새 페이지로 이동
    window.location.href = url.toString();
}

</script>
</body>
</html>