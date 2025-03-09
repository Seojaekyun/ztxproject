<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>열차편 검색 결과 - GGoRail</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
    }
    .container {
        max-width: 1000px;
        background-color: white;
        padding: 20px;
        margin-top: 20px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }
    .table th {
        background-color: #0059A3;
        color: white;
    }
    .btn-select {
        background-color: #00467F;
        color: white;
        padding: 5px 10px;
        border-radius: 5px;
        text-decoration: none;
    }
    .btn-select:hover {
        background-color: #003A66;
    }
</style>
</head>
<body>
<div class="container">
    <h2 class="text-center">열차 시간표</h2>
    <c:if test="${not empty routes}">
    <table class="table table-bordered text-center">
        <thead>
            <tr>
                <th>열차 번호</th>
                <th>출발역</th>
                <th>도착역</th>
                <th>출발일</th>
                <th>출발시간</th>
                <th>도착시간</th>
                <th>잔여석</th>
                <th>선택</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="route" items="${routes}">
            <tr>
                <td>${route.routeid}</td>
                <td>${route.departure}</td>
                <td>${route.arrival}</td>
                <fmt:parseDate value="${route.departureTime}" var="departureDate" pattern="yyyy-MM-dd HH:mm:ss"/>
                <fmt:parseDate value="${route.arrivalTime}" var="arrivalDate" pattern="yyyy-MM-dd HH:mm:ss"/>
                <td><fmt:formatDate value="${departureDate}" pattern="yyyy-MM-dd" /></td>
                <td><fmt:formatDate value="${departureDate}" pattern="HH:mm" /></td>
                <td><fmt:formatDate value="${arrivalDate}" pattern="HH:mm" /></td>
                <td>${route.seat}</td>
                <td>
                    <form action="${pageContext.request.contextPath}/routes/resCheck" method="post">
                        <input type="hidden" name="routeid" value="${route.routeid}">
                        <input type="hidden" name="routeDeparture" value="${route.departure}">
                        <input type="hidden" name="routeArrival" value="${route.arrival}">
                        <input type="hidden" name="routeTime" value="${route.departureTime}">
                        <input type="hidden" name="routeArrivalTime" value="${route.arrivalTime}">
                        <input type="hidden" name="resnum" value="${resnum}">
                        <button type="submit" class="btn btn-select">선택</button>
                    </form>
                </td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
    </c:if>
    <c:if test="${empty routes }">
        <p class="text-center mt-4">검색 조건에 부합하는 열차편이 없습니다.</p>
    </c:if>
</div>
</body>
</html>
