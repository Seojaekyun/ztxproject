<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZTX 마일리지 & 회원쿠폰</title>
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
        font-size: 22px;
        font-weight: bold;
        margin-bottom: 15px;
        color: #003366;
        border-bottom: 2px solid #003366;
        padding-bottom: 5px;
    }
    .exclusion-box {
        background-color: #f9f9f9;
        padding: 20px;
        border-left: 5px solid #cc0000;
        margin-top: 20px;
        border-radius: 8px;
    }
    .info-box {
        background-color: #f9f9f9;
        padding: 15px;
        border-left: 5px solid #003366;
        margin-bottom: 20px;
    }
    .highlight {
        font-weight: bold;
        color: #cc0000;
    }
    .benefit-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    .benefit-table th, .benefit-table td {
        border: 1px solid #ddd;
        padding: 12px;
        text-align: center;
    }
    .benefit-table th {
        background-color: #003366;
        color: white;
    }
    .button {
        display: inline-block;
        padding: 10px 15px;
        background-color: #0073e6;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        margin-top: 10px;
    }
</style>
</head>
<body>
<main>
	<div class="nullbox"></div>
    <div class="membership-container">
        <h2 class="section-title">ZTX 마일리지 이용안내</h2>
        <div class="info-box">
            <li>2016년 11월 1일부터 ZTX 마일리지 적립제도가 시행되었습니다.</li>
            <li>ZTX 마일리지는 열차를 이용한 다음날에 적립됩니다.</li>
            <li>적립된 ZTX 마일리지의 유효기간은 5년(적립월 기준)입니다.</li>
            <li>ZTX 마일리지는 실제 지불한 승차권 결제금액을 기준으로 적립됩니다.</li>
            <li>ZTX 마일리지(또는 철도포인트), 위비꿀머니(모아), OK캐쉬백 등 모든 가상화폐로 지불한 금액은 적립대상에서 제외됩니다.</li>
        </div>
        <div class="exclusion-box">
            <p><span class="highlight">※ ZTX 마일리지 적립 제외 대상</span></p>
            <ul>
            	<br>
                <li>정기승차권, 단체·전세승차권, ZTX 가족석 승차권, 내일로 등 자유여행패스, GGORAIL-PASS, 입장권 및 철도공사에서 여행상품으로 판매하는 승차권</li>
                <li>ZTX 할인 승차권 단 자유석, 입석, 환승, 노인, 장애인, 어린이, 국가유공자는 할인과 마일리지 적립 가능</li>
                <li>특실 업그레이드 서비스를 적용한 승차권</li>
                <li>쿠폰 적용 승차권</li>
                <li>명절(설, 추석) 특별수송기간 승차권</li>
                <li>철도공사와 정부기관, 지방자치단체 또는 기업체와 계약을 체결하여 운임을 할인한 승차권</li>
                <li>철도공사와 별도의 운송계약을 체결하고 운임을 할인하거나 운임(또는 요금)을 후급으로 지급하는 승차권</li>
                <li>승차권과 연계하여 판매하는 모든 여행상품 등</li>
            </ul>
        </div>
        <br>
        <h2 class="section-title">ZTX 마일리지 적립</h2>
        <table class="benefit-table">
            <thead>
                <tr>
                    <th>기본 마일리지</th>
                    <th>추가 적립</th>
                    <th>보너스 적립</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>ZTX 이용할때 마다 <span class="highlight">5%</span> 적립</td>
                    <td>더블적립 열차는 <span class="highlight">5%</span> 적립</td>
                    <td>Rail+로 결제하면 <span class="highlight">+1%</span> 추가 적립</td>
                </tr>
            </tbody>
        </table>
        <br>
        <div class="info-box">
        	<li>ZTX 이용시 결제금액의 5%를 기본 마일리지로 적립.</li>
        	<li>‘더블적립 (×2 ) 열차’로 지정한 열차는 추가로 5% 적립(결제금액의 총 10%)</li>
        	<li>‘더블적립 열차’는 홈페이지 및 꼬레일톡 앱에서만 구매 가능</li>
        	<li>선불형 교통카드 Rail+(레일플러스)로 승차권을 결제하는 경우 ‘1% 보너스 적립’도 제공되어 최대 11% 적립 가능</li>
        	<li>마일리지를 적립받고자 하는 회원은 승차권을 발급받기 전에 꼬레일멤버십카드 제시 또는 회원번호 및 비밀번호 등을 입력해야 합니다.</li>
        	<li>모든 마일리지 적립은 1일 최대 4건까지 가능합니다.</li>
        	<p>(예시 : 본인결제 4매, 전달하기 2매(총 6매) ⇒ 마일리지 금액이 큰 순서대로 4매만 적립)</p>
        	<li>환승 및 병합승차권 이용시 각 열차(좌석)을 1매로 산정</li>
        	<p>(예시 : 16열차에서 507열차 환승 시 2매 적립으로 인식)</p>
        	<li style="color:red;">해당열차 출발 후에는 마일리지를 적립받을 수 없습니다.</li>
        	
        </div>
        <br>
        <br>
        <h2 class="section-title">ZTX 동반자 마일리지</h2>
        <div class="info-box">
            <li>꼬레일 멤버십 회원이 한 번의 결제로 2매 이상의 승차권을 구매하였을 경우 1매는 결제자에게 적립되며, 나머지에 대해서는 동행한 회원이 마일리지를 적립할 수 있는 서비스입니다.</li>
            <li>동반유아, 어린이, 중증장애 승차권을 함께 구매하신 경우 결제자에게 자동 적립됩니다.</li>
        </div>
        <br>
        <br>
        <h2 class="section-title">ZTX 동반자 마일리지 적립 안내</h2>
        <ul>
            <li>적립대상) 열차를 직접 이용한 동행자</li>
			<p>동행자가 회원인 경우만 가능하며, 비회원은 회원가입 후 적립 신청 가능</p>
			<li>마일리지 적립 제외 대상 승차권은 동행자 적립 불가 (참고 : ZTX 마일리지 적립 제외 대상)</li>
            <li>(신청대상) 적립을 받으려는 동행자 회원이 직접 신청</li>
            <li>(신청방법) 꼬레일톡, 홈페이지, 역창구에서 동행자 마일리지 신청</li>
            <li>필수정보 : 예약자(결제자) 이름 및 회원번호/휴대폰번호/이메일(택1), 승차권번호</li>
            <li>(신청기간) 운행일 다음날부터 1년6개월 이내</li>
        </ul>
        <br>
        <br>
        <h2 class="section-title">ZTX 마일리지 사용처</h2>
        <ul>
            <li>꼬레일 승차권 구매</li>
            <li>꼬레일 유휴여정 사용 (전국 100여개 매장)</li>
            <p><a href="../static/resources/files/store_list.xlsx" class="button" download>사용가능 매장 자세히 보기</a></p>
        </ul>
        <br>
        <br>
        <h2 class="section-title">회원등급 구분</h2>
        <table class="benefit-table">
            <thead>
                <tr>
                    <th>등급</th>
                    <th>기준</th>
                    <th>혜택</th>
                </tr>
            </thead>
            <tbody>
            	<tr>
            		<td>VVIP</td>
            		<td>반기별 승차권 구입시 적립하는 마일리지가 8만점 이상인 고객 또는 기준일부터 1년간 16만점 이상 고객 중 매반기 익월 선정</td>
            		<td>비즈니스회원 혜택 기본 제공 ZTX특실 무료 업그레이드 쿠폰 6매 승차권 나중에 결제하기 서비스(열차출발 3시간 전까지)</td>
            	</tr>
                <tr>
                    <td>VIP</td>
                    <td>반기별 승차권 구입시 적립하는 마일리지가 4만점 이상인 고객 또는 기준일부터 1년간 8만점 이상 고객 중 매반기 익월 선정</td>
                    <td>비즈니스회원 혜택 기본 제공 ZTX특실 무료 업그레이드 쿠폰 2매</td>
                </tr>
                <tr>
                    <td>비즈니스(BUSINESS)</td>
                    <td>철도회원으로 가입한 고객 중 최근 1년간 온라인 로그인 기록이 있거나, 회원으로 구매실적이 있는 고객</td>
                    <td>마일리지 적립 및 사용 가능 회원 전용 프로모션 참가 가능 열차 할인상품 이용 등 기본서비스와 멤버십 제휴서비스 등 부가 서비스 이용</td>
                </tr>
                <tr>
                    <td>패밀리(FAMILY)</td>
                    <td>철도회원으로 가입한 고객 중 최근 1년간 온라인 로그인 기록이 없거나, 회원으로 구매실적이 없는 고객</td>
                    <td>멤버십 제휴서비스 및 꼬레일 멤버십 라운지 이용 등의 부가서비스 이용 제한  * 휴면회원으로 계정 분류 별도 관리하며, 본인 인증 절차를 거쳐 비즈니스회원으로 전환</td>
                </tr>
            </tbody>
        </table>
        <br>
        <br>
        <h2 class="section-title">일반열차 회원쿠폰 이용안내</h2>
        <li>새마을호(ITX-새마을 포함), 무궁화호, 누리로, ITX-청춘 등 일반열차를 이용시, 승차권 결제금액에 따라 회원쿠폰을 지급합니다.</li>
        <li>일반열차 이용실적에 따른 회원쿠폰 제공</li>
        <br>
        <div class="info-box">
            <li>일반열차 승차권의 누적 결제금액이 10만원을 초과할 때마다 10%할인쿠폰 제공</li>
            <li>매 반기별(1~6월, 7~12월) 누적 결제금액이 30만원 이상일 경우 30%할인쿠폰 추가 제공</li>
            <li style="color:red;">할인쿠폰 지급일: 1~6월 실적 7월 일괄 지급, 7~12월 실적 1월 일괄 지급</li>
            <li>기본할인(입석, 환승할인) 및 공공할인(노인, 장애인, 국가유공자, 어린이할인) 승차권을 제외한 모든 할인승차권 및 관광상품, 기타 후급 승차권은 적립에서 제외</li>
            <li style="color:red;">단, O/V/S/A/G/DMZ-train 및 경북 관광순환테마열차(일반실 2량) 승차권은 적립 가능</li>
            <li>환승승차권(ZTX+일반열차)의 경우, 일반열차의 원운임을 기준으로 이용실적 적립</li>
            <li style="color:red;">환승할인액(일반열차 운임의 30%)이 적용된 ZTX 운임을 기준으로 ZTX 마일리지 적립</li>
            <li>이용실적을 누적 받고자 하는 회원은 승차권을 발급받기 전에 꼬레일멤버십카드 제시 또는 회원번호 및 비밀번호 등을 입력해야 합니다.</li>
            <li style="color:red;">해당열차 출발 후에는 이용실적을 누적 받을 수 없습니다.</li>
        </div>
        <br>
        <br>
        <h2 class="section-title">ZTX 마일리지로 승차권 구입 방법</h2>
        <p>1. 꼬레일 홈페이지 또는 모바일 앱에 로그인</p>
        <p>2. 승차권 예매 시 마일리지 사용 선택</p>
        <p>3. 결제 진행 후 마일리지 차감</p>
    </div>
</main>
</body>
</html>