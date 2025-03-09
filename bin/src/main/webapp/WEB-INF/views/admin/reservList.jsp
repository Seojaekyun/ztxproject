<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>예약 관리</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
		display: flex;
		justify-content: space-between;
		width: 60%;
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
		height: 340px;
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
		padding: 4px;
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
		display: inline-block;
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
	#clsd {
		background: #000A8E;
		color: white;
		border-radius: 10px;
		padding: 10px 15px;
		border: none;
		cursor: pointer;
		margin-bottom: 10px;
		width: 120px;
		display: inline-block;
	}
</style>
</head>
<body>
<div style="width: 100%; text-align: center"><h2>예약관리</h2></div>
<!-- Section 1: 날짜 필터링된 예약 내역 (달력 포함) -->
<section id="sec1">
	<div id="cal">
		<button id="clsd" onclick="clearDate()">날짜 선택 해제</button>
		<div id="selectedDate">
			<c:if test="${not empty selectedDate}">
				선택한 날짜: ${selectedDate}
			</c:if>
		</div>
		<div id="datepicker"></div>
	</div>
	<div id="tables">
		<!-- 전체 항공편 테이블 -->
		<div class="table-container" id="allroutes">
			<table>
				<caption>전체 예약</caption>
				<tr>
					<th>열차</th>
					<th>출발시간</th>
					<th>잔여석</th>
				</tr>
				<c:forEach var="rsv" items="${rsvList}">
					<tr>
						<td><a href="rsvdList?trainid=${rsv.trainid}&routeTime=${rsv.routeTime}&reservid=${rsv.reservid}">은하-${rsv.trainid}호</a></td>
						<td>${rsv.routeTime}</td>
						<td>${rsv.seat}</td>
					</tr>
				</c:forEach>
				<c:if test="${empty rsvList}">
					<tr>
						<td colspan="3">예약 데이터가 없습니다.</td>
					</tr>
				</c:if>
			</table>
			<div class="pagination">
				<c:if test="${totalPages > 1}">
					<c:forEach begin="1" end="${totalPages}" var="i">
						<c:choose>
							<c:when test="${i == currentPage}">
								<span class="active">${i}</span>
							</c:when>
							<c:otherwise>
								<a href="javascript:void(0);" onclick="loadAllPage(${i}, '${selectedDate}');">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
</section>
<!-- Section 2: 전체 예약 내역 -->
<section id="sec2">
	<div id="tables">
		<!-- seoul 항공편 테이블 -->
		<div class="table-container" id="seoulroutes">
			<table>
				<caption>서울역 출발</caption>
				<tr>
					<th>열차</th>
					<th>출발시간</th>
					<th>잔여석</th>
				</tr>
				<c:forEach var="rsv" items="${seoulRsv}">
					<tr>
						<td><a href="rsvdList?trainid=${rsv.trainid}&routeTime=${rsv.routeTime}&reservid=${rsv.reservid}">은하-${rsv.trainid}호</a></td>
						<td>${rsv.routeTime}</td>
						<td>${rsv.seat}</td>
					</tr>
				</c:forEach>
				<c:if test="${empty seoulRsv}">
					<tr>
						<td colspan="3">seoul 출발 예약 데이터가 없습니다.</td>
					</tr>
				</c:if>
			</table>
			<div class="pagination">
				<c:if test="${seoulTotalPages > 1}">
					<c:forEach begin="1" end="${seoulTotalPages}" var="i">
						<c:choose>
							<c:when test="${i == seoulCurrentPage}">
								<span class="active">${i}</span>
							</c:when>
							<c:otherwise>
								<a href="javascript:void(0);" onclick="loadPage(${i}, 'seoul');">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:if>
			</div>
		</div>
		<!-- pusan 항공편 테이블 -->
		<div class="table-container" id="pusanroutes">
			<table>
				<caption>부산역 출발</caption>
				<tr>
					<th>열차</th>
					<th>출발시간</th>
					<th>잔여석</th>
				</tr>
				<c:forEach var="rsv" items="${pusanRsv}">
					<tr>
						<td><a href="rsvdList?trainid=${rsv.trainid}&routeTime=${rsv.routeTime}&reservid=${rsv.reservid}">은하-${rsv.trainid}호</a></td>
						<td>${rsv.routeTime}</td>
						<td>${rsv.seat}</td>
					</tr>
				</c:forEach>
				<c:if test="${empty pusanRsv}">
					<tr>
						<td colspan="3">pusan 출발 예약 데이터가 없습니다.</td>
					</tr>
				</c:if>
			</table>
			<div class="pagination">
				<c:if test="${pusanTotalPages > 1}">
					<c:forEach begin="1" end="${pusanTotalPages}" var="i">
						<c:choose>
							<c:when test="${i == pusanCurrentPage}">
								<span class="active">${i}</span>
							</c:when>
							<c:otherwise>
								<a href="javascript:void(0);" onclick="loadPage(${i}, 'pusan');">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:if>
			</div>
		</div>
		<!-- 기타 항공편 테이블 -->
		<div class="table-container" id="otherroutes">
			<table>
				<caption>기타 출발</caption>
				<tr>
					<th>항공편명</th>
					<th>출항시간</th>
					<th>잔여석</th>
				</tr>
				<c:forEach var="rsv" items="${otherRsv}">
					<tr>
						<td><a href="rsvdList?trainid=${rsv.trainid}&routeTime=${rsv.routeTime}&reservid=${rsv.reservid}">은하-${rsv.trainid}호</a></td>
						<td>${rsv.routeTime}</td>
						<td>${rsv.seat}</td>
					</tr>
				</c:forEach>
				<c:if test="${empty otherRsv}">
					<tr>
						<td colspan="3">기타 출발 예약 데이터가 없습니다.</td>
					</tr>
				</c:if>
			</table>
			<div class="pagination">
				<c:if test="${otherTotalPages > 1}">
					<c:forEach begin="1" end="${otherTotalPages}" var="i">
						<c:choose>
							<c:when test="${i == otherCurrentPage}">
								<span class="active">${i}</span>
							</c:when>
							<c:otherwise>
								<a href="javascript:void(0);" onclick="loadPage(${i}, 'other');">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
</section>
<script>
	$(function() {
		$("#datepicker").datepicker({
			inline: true,
			dateFormat: 'yy-mm-dd',
			defaultDate: null,
			onSelect: function(dateText) {
				$("#selectedDate").text('선택한 날짜: ' + dateText);
				sessionStorage.setItem("selectedDate", dateText);
				loadAllPage(1, dateText);
			}
		});
		var savedDate = sessionStorage.getItem("selectedDate");
		if (savedDate) {
			$("#selectedDate").text('선택한 날짜: ' + savedDate);
			$("#datepicker").datepicker('setDate', savedDate);
			loadAllPage(1, savedDate);
		}
	});
	function loadAllPage(page, selectedDate) {
	    let url = "/admin/reservList";
	    let params = {
	        page: page
	    };
	    if (selectedDate && selectedDate !== "") {
	        params.selectedDate = selectedDate;
	    }
	    // 전체 예약 업데이트
	    $.get(url, params, function (data) {
	        $("#allroutes").html($(data).find("#allroutes").html());
	        $("#seoulroutes").html($(data).find("#seoulroutes").html());
	        $("#pusanroutes").html($(data).find("#pusanroutes").html());
	        $("#otherroutes").html($(data).find("#otherroutes").html());
	    }).fail(function () {
	        alert("데이터를 불러오는 데 실패했습니다. 관리자에게 문의하세요.");
	    });
	}

	function loadPage(page, type) {
	    let url = "/admin/reservList";
	    let params = {
	        page: page
	    };
	    // 선택된 날짜가 있으면 포함
	    let selectedDate = sessionStorage.getItem("selectedDate");
	    if (selectedDate && selectedDate !== "") {
	        params.selectedDate = selectedDate;
	    }
	    if (type === 'seoul') {
	        params.seoulPage = page;
	    } else if (type === 'pusan') {
	        params.pusanPage = page;
	    } else if (type === 'other') {
	        params.otherPage = page;
	    }
	    $.get(url, params, function (data) {
	        $("#" + type + "routes").html($(data).find("#" + type + "routes").html());
	    }).fail(function () {
	        alert("데이터를 불러오는 데 실패했습니다. 관리자에게 문의하세요.");
	    });
	}

	function clearDate() {
		sessionStorage.removeItem("selectedDate");
		$("#selectedDate").text('');
		$("#datepicker").datepicker('setDate', null);
		loadAllPage(1);
	}
</script>
</body>
</html>