<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코레일 멤버십 제휴 혜택</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
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
    .membership-container {
        width: 1100px;
        margin: auto;
        padding: 20px;
    }
    .section-title {
        font-size: 20px;
        font-weight: bold;
        margin-bottom: 15px;
        color: #003366; 
    }
    .benefit-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    .benefit-table th, .benefit-table td {
        border: 1px solid #ddd;
        padding: 12px;
        text-align: left;
        vertical-align: middle;
    }
    .benefit-table th {
        background-color: #003366;
        color: white;
    }
    .partner-logo {
        width: 100px; 
        height: auto;
        display: block;
        margin: auto;
    }
    .benefit-text {
        display: flex;
        align-items: center;
    }
    .highlight {
        font-weight: bold;
        color: #cc0000;
    }
</style>
</head>
<body>
<main>
	<div class="nullbox"></div>
    <div class="membership-container">
        <h2 class="section-title" align="center">꼬레일멤버십 회원 제휴 혜택 서비스 소개</h2>
        <table class="benefit-table">
            <thead>
                <tr>
                    <th>제휴사</th>
                    <th>혜택내용</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><img src="../static/resources/bank-logo.png" alt="우리은행" class="partner-logo"></td>
                    <td class="benefit-text">
                        <div>
                            <p><span class="highlight">할인</span></p>
                            <p>미화/유로화/엔화 환전 시 <span class="highlight">60%</span> 우대이율 적용</p>
                            <p>기타 통화(12종) 환전 시 <span class="highlight">30%</span> 우대이율 적용</p>
                            <p>* 미화 300달러 이상 적용, 타 환율 우대 서비스와 중복 불가</p>
                            <p>* 우대이율은 은행사정에 따라 변동될 수 있음</p>
                            <p>문의: 1588-5000</p>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><img src="../static/resources/coex-logo.png" alt="코엑스" class="partner-logo"></td>
                    <td class="benefit-text">
                        <div>
                            <p><span class="highlight">할인</span></p>
                            <p>할인 전시회별 최소 <span class="highlight">20%</span> ~ 최대 <span class="highlight">100%</span></p>
                            <p>* 단, 지정 전시회만 할인 가능</p>
                            <p>문의: 02-6000-0114</p>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><img src="../static/resources/busan-logo.png" alt="SEA LIFE 부산" class="partner-logo"></td>
                    <td class="benefit-text">
                        <div>
                            <p><span class="highlight">할인</span></p>
                            <p>입장료 <span class="highlight">20%</span> (동반 1인 포함)</p>
                            <p>문의: 051-740-1700</p>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</main>
</body>
</html>
