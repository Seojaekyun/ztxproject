<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title> 항공편 현황 </title>
<style>
	body {
		font-family: 'Noto Sans KR', sans-serif;
		background-color: #f9f9f9;
		margin: 0;
		padding: 0;
	}
	section {
		display: flex;
		justify-content: space-between; /* 아이템들을 좌우로 배치 */
		max-width: 1200px;
		margin: auto;
	}
	#sec2 {
		display: flex;
		/* flex-direction: column; */ /* 테이블을 수직으로 배치 */
		/* gap: 20px; */ /* 테이블 사이에 간격 추가 */
	}
	.table-container {
		background-color: white;
		box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
		border-radius: 10px;
		overflow: hidden;
		margin-bottom: 20px;
	}
	.date-container {
		background-color: white;
		box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
		border-radius: 10px;
		overflow: hidden;
		width: 30%;
		height: 340px;
	}
	.table-container {
		width: 68%; /* 테이블 컨테이너 너비 */
		height: 340px;
	}
	#sec2 .table-container {
		width: 49.5%; /* 테이블 컨테이너 너비 */
		height: 340px;
	}
	#sec3 .table-container {
		width: 100%; /* 테이블 컨테이너 너비 */
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
	#clsd {
		background: #000A8E;
		color: white;
		border-radius: 10px;
		padding: 10px 15px;
		border: none;
		cursor: pointer;
		margin-bottom: 10px;
		width: 120px;
	}
	#datepicker {
		width:100%;
		display: inline-block;
		margin: 0 auto;
	}
	.ui-datepicker {
		margin: auto;
		width: 95% !important;
		height: 95%;
	}
	#selectedDate {
		font-size: 16px;
		font-weight: bold;
		color: #333;
		margin-top: 10px;
	}

	/* 항공편 추가 버튼과 좌석 추가 버튼 디자인 */
	.button {
		background-color: #000A8E;
		color: white;
		border: none;
		padding: 10px 15px;
		font-size: 16px;
		border-radius: 10px;
		box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
		cursor: pointer;
		transition: background-color 0.3s ease, transform 0.3s ease;
		margin: 5px 10px 0 0;
	}
	.button:hover {
		background-color: #333;
		transform: translateY(-3px);
	}
	.button:active {
		transform: translateY(1px);
	}
</style>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>

<div style="text-align: right; margin-bottom: 20px;">
	<!-- 항공편 추가 버튼 -->
	<button class="button" onclick="location.href='/admin/addFlight'">항공편 추가</button>
	
	<!-- 좌석 추가 버튼 -->
	<form action="/admin/addSeats" method="post" style="display:inline;">
		<input type="hidden" name="flightId" value="${flightId}">
		<button type="submit" class="button">좌석 추가</button>
	</form>
</div>

<!-- 항공편 리스트 -->
<div style="width: 100%; text-align: center"><h2>항공편 리스트</h2></div>
<section id="sec1">
	<div class="date-container">
		<button id="clsd" onclick="clearDate()">날짜 선택 해제</button><br>    
		<div id="datepicker"></div>
		<div id="selectedDate">
			<c:if test="${not empty selectedDate}">
				선택한 날짜: ${selectedDate}
			</c:if>
		</div>
	</div>
	<div class="table-container">
		<table id="otherTable">
			<caption>해외 항공편</caption>
			<tr>
				<th>항공편명</th>
				<th>출발 공항</th>
				<th>도착 공항</th>
				<th>출발 시간</th>
				<th>도착 시간</th>
				<th>잔여석</th>
			</tr>
			<c:forEach var="flight" items="${pagedOtherFlights}">
				<tr>
					<td>${flight.flightName}</td>
					<td>${flight.departureAirport}</td>
					<td>${flight.arrivalAirport}</td>
					<td>${flight.departureTime}</td>
					<td>${flight.arrivalTime}</td>
					<td>${flight.totalSeats}</td>
				</tr>
			</c:forEach>
			<c:if test="${empty pagedOtherFlights}">
				<tr>
					<td colspan="6">기타 항공편 데이터가 없습니다.</td>
				</tr>
			</c:if>
		</table>
		<!-- 기타 페이지네이션 -->
		<div id="otherPagination" class="pagination">
			<c:if test="${totalOtherPages > 1}">
				<!-- 이전 페이지 버튼 -->
				<c:if test="${currentOtherPage > 10}">
					<a href="javascript:void(0);" onclick="loadPage(${currentOtherPage - 10}, 'other');">이전10</a>
				</c:if>
				<!-- 페이지 번호 표시 -->
				<c:set var="startPage" value="${currentOtherPage - 5}" />
				<c:set var="endPage" value="${currentOtherPage + 4}" />
				<c:if test="${startPage < 1}">
					<c:set var="startPage" value="1" />
					<c:set var="endPage" value="10" />
				</c:if>
				<c:if test="${endPage > totalOtherPages}">
					<c:set var="endPage" value="${totalOtherPages}" />
					<c:set var="startPage" value="${totalOtherPages - 9}" />
					<c:if test="${startPage < 1}">
						<c:set var="startPage" value="1" />
					</c:if>
				</c:if>
				<c:forEach begin="${startPage}" end="${endPage}" var="i">
					<c:choose>
						<c:when test="${i == currentOtherPage}">
							<span class="active">${i}</span>
						</c:when>
						<c:otherwise>
							<a href="javascript:void(0);" onclick="loadPage(${i}, 'other');">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<!-- 다음 페이지 버튼 -->
				<c:if test="${currentOtherPage +10 < totalOtherPages}">
					<a href="javascript:void(0);" onclick="loadPage(${currentOtherPage + 10}, 'other');">다음10</a>
				</c:if>
			</c:if>
		</div>
	</div>
</section>
<section id="sec2">
	<div class="table-container">
		<table id="gmpTable">
			<caption>GMP 출발 항공편</caption>
			<tr>
				<th>항공편명</th>
				<th>도착 공항</th>
				<th>출발 시간</th>
				<th>도착 시간</th>
				<th>잔여석</th>
			</tr>
			<c:forEach var="flight" items="${pagedGmpFlights}">
				<tr>
					<td>${flight.flightName}</td>
					<td>${flight.arrivalAirport}</td>
					<td>${flight.departureTime}</td>
					<td>${flight.arrivalTime}</td>
					<td>${flight.totalSeats}</td>
				</tr>
			</c:forEach>
			<c:if test="${empty pagedGmpFlights}">
				<tr>
					<td colspan="6">GMP 항공편 데이터가 없습니다.</td>
				</tr>
			</c:if>
		</table>
		<!-- GMP 페이지네이션 -->
		<div id="gmpPagination" class="pagination">
			<c:if test="${totalGmpPages > 1}">
				<!-- 이전 페이지 버튼 -->
				<c:if test="${currentGmpPage > 10}">
					<a href="javascript:void(0);" onclick="loadPage(${currentGmpPage - 10}, 'gmp');">이전10</a>
				</c:if>
				<!-- 페이지 번호 표시 -->
				<c:set var="startPage" value="${currentGmpPage - 5}" />
				<c:set var="endPage" value="${currentGmpPage + 4}" />
				<c:if test="${startPage < 1}">
					<c:set var="startPage" value="1" />
					<c:set var="endPage" value="10" />
				</c:if>
				<c:if test="${endPage > totalGmpPages}">
					<c:set var="endPage" value="${totalGmpPages}" />
					<c:set var="startPage" value="${totalGmpPages - 9}" />
					<c:if test="${startPage < 1}">
						<c:set var="startPage" value="1" />
					</c:if>
				</c:if>
				<c:forEach begin="${startPage}" end="${endPage}" var="i">
					<c:choose>
						<c:when test="${i == currentGmpPage}">
							<span class="active">${i}</span>
						</c:when>
						<c:otherwise>
							<a href="javascript:void(0);" onclick="loadPage(${i}, 'gmp');">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<!-- 다음 페이지 버튼 -->
				<c:if test="${currentGmpPage + 10 < totalGmpPages}">
					<a href="javascript:void(0);" onclick="loadPage(${currentGmpPage + 10}, 'gmp');">다음10</a>
				</c:if>
			</c:if>
		</div>
	</div>
	<div class="table-container">
		<table id="icnTable">
			<caption>ICN 출발 항공편</caption>
			<tr>
				<th>항공편명</th>
				<th>도착 공항</th>
				<th>출발 시간</th>
				<th>도착 시간</th>
				<th>잔여석</th>
			</tr>
			<c:forEach var="flight" items="${pagedIcnFlights}">
					<tr>
					<td>${flight.flightName}</td>
					<td>${flight.arrivalAirport}</td>
					<td>${flight.departureTime}</td>
					<td>${flight.arrivalTime}</td>
					<td>${flight.totalSeats}</td>
				</tr>
			</c:forEach>
			<c:if test="${empty pagedIcnFlights}">
				<tr>
					<td colspan="6">ICN 항공편 데이터가 없습니다.</td>
				</tr>
			</c:if>
		</table>
		<!-- ICN 페이지네이션 -->
		<div id="icnPagination" class="pagination">
			<c:if test="${totalIcnPages > 1}">
				<!-- 이전 페이지 버튼 -->
				<c:if test="${currentIcnPage > 10}">
					<a href="javascript:void(0);" onclick="loadPage(${currentIcnPage - 10}, 'icn');">이전10</a>
				</c:if>
				<!-- 페이지 번호 표시 -->
				<c:set var="startPage" value="${currentIcnPage - 5}" />
				<c:set var="endPage" value="${currentIcnPage + 4}" />
				<c:if test="${startPage < 1}">
					<c:set var="startPage" value="1" />
					<c:set var="endPage" value="10" />
				</c:if>
				<c:if test="${endPage > totalIcnPages}">
					<c:set var="endPage" value="${totalIcnPages}" />
					<c:set var="startPage" value="${totalIcnPages - 9}" />
					<c:if test="${startPage < 1}">
						<c:set var="startPage" value="1" />
					</c:if>
				</c:if>
				<c:forEach begin="${startPage}" end="${endPage}" var="i">
					<c:choose>
						<c:when test="${i == currentIcnPage}">
							<span class="active">${i}</span>
						</c:when>
						<c:otherwise>
							<a href="javascript:void(0);" onclick="loadPage(${i}, 'icn');">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<!-- 다음 페이지 버튼 -->
				<c:if test="${currentIcnPage +10 < totalIcnPages}">
					<a href="javascript:void(0);" onclick="loadPage(${currentIcnPage + 10}, 'icn');">다음10</a>
				</c:if>
			</c:if>
		</div>
	</div>
</section>
<section id="sec3">
	<div class="table-container">
		<table id="flightTable">
			<caption>항공편 전체</caption>
			<tr>
				<th>항공편명</th>
				<th>출발 공항</th>
				<th>도착 공항</th>
				<th>출발 시간</th>
				<th>도착 시간</th>
				<th>잔여석</th>
			</tr>
			<c:forEach var="flight" items="${flightList}">
				<tr>
					<td>${flight.flightName}</td>
					<td>${flight.departureAirport}</td>
					<td>${flight.arrivalAirport}</td>
					<td>${flight.departureTime}</td>
					<td>${flight.arrivalTime}</td>
					<td>${flight.totalSeats}</td>
				</tr>
			</c:forEach>
			<c:if test="${empty flightList}">
				<tr>
					<td colspan="6">항공편 데이터가 없습니다.</td>
				</tr>
			</c:if>
		</table>
		<div id="mainPagination" class="pagination">
			<c:if test="${totalPages > 1}">
				<!-- 이전 페이지 버튼 -->
				<c:if test="${currentPage > 10}">
					<a href="javascript:void(0);" onclick="loadPage(${currentPage - 10}, 'all');">이전10</a>
				</c:if>
				<!-- 페이지 번호 표시 -->
				<c:set var="startPage" value="${currentPage - 5}" />
				<c:set var="endPage" value="${currentPage + 4}" />
				<c:if test="${startPage < 1}">
					<c:set var="startPage" value="1" />
					<c:set var="endPage" value="10" />
				</c:if>
				<c:if test="${endPage > totalPages}">
					<c:set var="endPage" value="${totalPages}" />
					<c:set var="startPage" value="${totalPages - 9}" />
					<c:if test="${startPage < 1}">
						<c:set var="startPage" value="1" />
					</c:if>
				</c:if>
				<c:forEach begin="${startPage}" end="${endPage}" var="i">
					<c:choose>
						<c:when test="${i == currentPage}">
							<span class="active">${i}</span>
						</c:when>
						<c:otherwise>
							<a href="javascript:void(0);" onclick="loadPage(${i}, 'all');">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<!-- 다음 페이지 버튼 -->
				<c:if test="${currentPage + 10 < totalPages}">
					<a href="javascript:void(0);" onclick="loadPage(${currentPage + 10}, 'all');">다음10</a>
				</c:if>
			</c:if>
		</div>
	</div>
</section>

<!-- jQuery 및 jQuery UI 스크립트 추가 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	// 날짜 선택
	$(function() {
		$("#datepicker").datepicker({
			inline: true,
			dateFormat: 'yy-mm-dd',
			defaultDate: null,
			onSelect: function(dateText) {
				$("#selectedDate").text('선택한 날짜: ' + dateText);
				sessionStorage.setItem("selectedDate", dateText);
				
				// 모든 테이블 업데이트
				loadPage(1, 'all');
				loadPage(1, 'gmp');
				loadPage(1, 'icn');
				loadPage(1, 'other');
			}
		});
		
		var savedDate = sessionStorage.getItem("selectedDate");
		if (savedDate) {
			$("#selectedDate").text('선택한 날짜: ' + savedDate);
			$("#datepicker").datepicker('setDate', savedDate);
			
			// 모든 테이블 업데이트
			loadPage(1, 'all');
			loadPage(1, 'gmp');
			loadPage(1, 'icn');
			loadPage(1, 'other');
		}
		else {
			$("#selectedDate").text('');
			$("#datepicker").datepicker('setDate', null);
			
			// 모든 테이블 업데이트
			loadPage(1, 'all');
			loadPage(1, 'gmp');
			loadPage(1, 'icn');
			loadPage(1, 'other');
		}
	});
	
	function clearDate() {
		sessionStorage.removeItem("selectedDate");
		$("#selectedDate").text('');
		$("#datepicker").datepicker('setDate', null);
		
		// 모든 테이블 업데이트
		loadPage(1, 'all');
		loadPage(1, 'gmp');
		loadPage(1, 'icn');
		loadPage(1, 'other');
	}
	
	function loadPage(page, flightType) {
		var selectedDate = sessionStorage.getItem("selectedDate");
		
		$.ajax({
			url: "/admin/flightsList",
			type: "GET",
			data: {
				page: page,
				selectedDate: selectedDate,
				flightType: flightType  // 'gmp', 'icn', 'other', 'all'
			},
			success: function(data) {
				if (flightType === 'gmp') {
					$("#gmpTable").html($(data).find("#gmpTable").html());
					$("#gmpPagination").html($(data).find("#gmpPagination").html());
				} else if (flightType === 'icn') {
					$("#icnTable").html($(data).find("#icnTable").html());
					$("#icnPagination").html($(data).find("#icnPagination").html());
				} else if (flightType === 'other') {
					$("#otherTable").html($(data).find("#otherTable").html());
					$("#otherPagination").html($(data).find("#otherPagination").html());
				} else {
					$("#flightTable").html($(data).find("#flightTable").html());
					$("#mainPagination").html($(data).find("#mainPagination").html());
				}
			},
			error: function(error) {
				console.log("데이터 가져오기 실패:", error);
			}
		});
	}
</script>

</body>
</html>