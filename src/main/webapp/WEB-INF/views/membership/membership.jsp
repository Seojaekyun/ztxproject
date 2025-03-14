<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>코레일 멤버십</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/style.css">
    <style>
        .membership-container {
            width: 80%;
            margin: auto;
            padding: 40px 20px;
            background-color: #ffffff;
            border-radius: 10px;
        }
        .section {
            padding: 25px 20px;
            border-bottom: 1px solid #ddd;
            margin-bottom: 20px;
        }
        .section-title {
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 15px;
            color: #003366;
        }
        .info-box {
            background-color: #f4f4f4;
            padding: 15px;
            border-radius: 8px;
            border-left: 5px solid #003366;
            margin-bottom: 15px;
        }
        .highlight {
            font-weight: bold;
            color: #cc0000;
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
    <div class="membership-container">
        <h2 class="section-title">가입방법</h2>
        <div class="info-box">
            <p>- 꼬레일(<a href="http://localhost:8095/main/index" class="highlight">http://localhost:8095/main/index</a>) 홈페이지에서 회원 가입 시 코레일멤버십 혜택을 받을 수 있습니다.</p>
        </div>
        
        <h2 class="section-title">꼬레일멤버십카드</h2>
        <div class="info-box">
            <p><span class="highlight">13.7.1일부터 모바일 회원카드 서비스를 제공합니다.</span></p>
            <p>- ‘13.7.1일부터 멤버십카드의 신규 및 분실 재발급을 중지합니다.</p>
            <p>- 스마트폰에서 꼬레일톡(스마트폰 앱) 설치 → 회원 로그인 → <span class="highlight">나의정보/멤버십카드 확인</span></p>
        </div>
        
        <h2 class="section-title">꼬레일멤버십 기본서비스</h2>
        <ul>
            <li><span class="highlight">철도승차권 예약</span> - 꼬레일멤버십 회원이면 누구나 인터넷(<a href="http://localhost:8095/main/index" class="highlight">http://localhost:8095/main/index</a>), 철도고객센터(☎1588-7788)에서 승차권을 예약할 수 있습니다.</li>
            <li><span class="highlight">마일리지 & 회원쿠폰 지급</span> - <a href="/membership/membershipcoupon" class="button">자세히 보기</a></li>
            <li><span class="highlight">꼬레일멤버십 제휴 가맹점 할인</span> - 꼬레일멤버십 카드(모바일 회원카드 포함)를 제시하면 제휴 가맹점에서 할인 혜택을 받을 수 있습니다. <a href="/membership/membershipsogae" class="button">멤버십 제휴 혜택 바로가기</a></li>
            <li>철도 관련 여행명소, 이벤트 등 공지사항 수신</li>
        </ul>
    </div>
</body>
</html>
