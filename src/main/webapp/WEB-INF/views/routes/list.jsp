<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>열차편 확인</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
	body {
		font-family: 'Noto Sans KR', sans-serif;
		background-color: #f4f4f4;
		margin: 0;
		padding: 0;
	}
	/* 헤더 디자인 */
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
		margin: auto;
		max-width: 800px;
		margin-top: 20px;
		padding: 20px;
		background-color: white;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		border-radius: 10px;
	}
    h2 {
        font-size: 24px;
        color: #00467F;
        margin-bottom: 20px;
        text-align: center;
    }
    table {
        width: 100%;
        margin-bottom: 20px;
        font-size: 13px;
    }
    th, td {
        padding: 10px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #00467F;
        color: white;
    }
    tr:hover {
        background-color: #f1f1f1;
    }
    .pagination {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }
    .pagination a {
        color: #00467F;
        padding: 8px 16px;
        text-decoration: none;
        border: 1px solid #ddd;
        margin: 0 2px;
        border-radius: 5px;
    }
    .pagination a:hover {
        background-color: #00467F;
        color: white;
    }
    .pagination .active {
        background-color: #00467F;
        color: white;
        border: 1px solid #00467F;
    }
    .filter-section {
        margin-bottom: 20px;
    }
    .filter-section label {
        font-weight: bold;
    }
    select, input[type="text"] {
        margin-left: 10px;
        padding: 5px;
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
$(function() {
    $("#selectedDate").datepicker({
        dateFormat: "yy-mm-dd",
        onSelect: function() {
            document.getElementById("filterForm").submit();
        }
    });
});
</script>
</head>
<body>
<section>
	<header>
		<h1>운행 정보</h1>
	</header>
	<nav>
		<div><a href="../reserv/reserv">예약</a></div>
		<div><a href="../reserv/reservInfo">예약 조회</a></div>
		<div><a href="../routes/list">운행 정보</a></div>
	</nav>
	<div class="container">
	    <table class="table table-hover">
	        <thead>
	            <tr>
	                <th>NO.</th>
	                <th>출발지</th>
	                <th>도착지</th>
	                <th>출발시간</th>
	                <th>도착시간</th>
	                <th>열차명</th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:forEach var="route" items="${routeList}">
	                <tr>
	                    <td>${route.routeid}</td>
	                    <td>${route.departure}</td>
	                    <td>${route.arrival}</td>
	                    <td>${route.departureTime}</td>
	                    <td>${route.arrivalTime}</td>
	                    <td>은하-${route.trainid}호</td>
	                </tr>
	            </c:forEach>
	        </tbody>
	    </table>
    	<!-- 페이지 네이션 -->
	    <div class="pagination">
		    <c:if test="${currentPage > 1}">
		        <a href="?page=${currentPage - 1}&selectedDate=${selectedDate}&departureAirport=${departureAirport}&arrivalAirport=${arrivalAirport}">이전</a>
		    </c:if>
		    <c:set var="startPage" value="${currentPage - (currentPage - 1) % 10}"/>
		    <c:forEach begin="${startPage}" end="${startPage + 9}" var="i">
		        <c:if test="${i <= totalPages}">
		            <a href="?page=${i}&selectedDate=${selectedDate}&departureAirport=${departureAirport}&arrivalAirport=${arrivalAirport}" 
		               class="${i == currentPage ? 'active' : ''}">${i}</a>
		        </c:if>
		    </c:forEach>
		    <c:if test="${currentPage < totalPages}">
		        <a href="?page=${currentPage + 1}&selectedDate=${selectedDate}&departureAirport=${departureAirport}&arrivalAirport=${arrivalAirport}">다음</a>
		    </c:if>
		</div>
	</div>
</section>
</body>
</html>