<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>유실물신고안내</title>
    <link rel="stylesheet" href="/resources/css/style.css">
    <style>
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
            padding: 30px;
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="membership-container">
        <h2 class="section-title">유실물 신고·문의</h2>
        <div class="info-box">
            <ul>
                <li>철도고객센터 1588-7788</li>
            </ul>
            <p>주요역 유실물 센터</p>
        </div>
        <div>
            <ul>
                <li>분실한 물건이 있다면 고객센터나 주요 역 유실물센터로 문의하시기 바랍니다.</li>
                <li>역사내 분실 또는 열차 하차 직후 분실사실을 알게 된 경우 : 즉시 역무실로 신고(열차번호, 이용구간, 승차 호차 및 좌석번호를 알고 계시면 빨리 찾으실 수 있습니다.)</li>
                <li>열차 승차 중 분실 사실을 알게된 경우 : 승무원에게 신고</li>
                <li>분실 사실을 늦게 알게된 경우 : 경찰청 LOST112에서 습득물 확인 후 철도 고객센터(1588-7788) 또는 주요역 유실물 센터로 문의</li>
            </ul>
            <p><a href="https://www.lost112.go.kr/">www.lost112.go.kr</a></p>
        </div>

        <h2 class="section-title">보관 습득물 조회 및 확인</h2>
        <div>
            <ul>
                <li>경찰청 유실물 종합관리시스템 LOST112에서 확인하실 수 있습니다.</li>
            </ul>
            <p><a href="https://www.lost112.go.kr/">(www.lost112.go.kr)</a></p>
        </div>

        <h2 class="section-title">유실물 수령</h2>
        <div>
            <ul>
                <li>유실물 수령을 위해 역을 방문할 때는 본인의 신분증을 반드시 지참하셔야 합니다.</li>
                <li>부득이 타인이 대리수령 하는 경우 위임장과 본인 신분증 사본(사진 가능), 대리인의 신분증이 필요합니다.</li>
            </ul>
            <p><a href="../static/resources/files/lost_form.hwp" class="button" download>대리수령 위임장 서식</a></p>
        </div>

        <h2 class="section-title">유실물 처리절차</h2>
        <div>
            <p><img src="../static/resources/pickup.png" alt="유실물 처리절차"></p>
        </div>

        <h2 class="section-title">코레일 주요 유실물 센터 연락처</h2>
        <div id="lost-center">
            <input type="text" id="searchStation" placeholder="역명을 입력하세요" style="width: 300px; padding: 8px; margin-bottom: 15px; border: 1px solid #ccc;">
            <ul id="stationList" style="list-style: none; padding: 0;">
                <li data-station="서울역" style="padding: 5px 0; cursor: pointer;">- 서울역</li>
                <li data-station="용산역" style="padding: 5px 0; cursor: pointer;">- 용산역</li>
                <li data-station="수원역" style="padding: 5px 0; cursor: pointer;">- 수원역</li>
                <li data-station="부산역" style="padding: 5px 0; cursor: pointer;">- 부산역</li>
                <li data-station="대전역" style="padding: 5px 0; cursor: pointer;">- 대전역</li>
                <li data-station="광주송정역" style="padding: 5px 0; cursor: pointer;">- 광주송정역</li>
            </ul>
            <div id="stationDetail" style="display: none; margin-top: 20px; padding: 15px; border: 1px solid #ccc; background: #f9f9f9;">
                <h4 id="stationName" style="color: #003366; font-weight: bold;"></h4>
                <p id="stationContact" style="margin: 5px 0 0 0;"></p>
            </div>
        </div>
    </div>

    <script>
        const stationInfo = {
            "서울역": "서울역 유실물 센터 연락처: 02-1234-5678",
            "용산역": "용산역 유실물 센터 연락처: 02-2345-6789",
            "수원역": "수원역 유실물 센터 연락처: 031-345-6789",
            "부산역": "부산역 유실물 센터 연락처: 051-456-7890",
            "대전역": "대전역 유실물 센터 연락처: 042-567-8901",
            "광주송정역": "광주송정역 유실물 센터 연락처: 062-678-9012"
        };

        $('#stationList li').on('click', function() {
            const station = $(this).data('station');
            $('#stationName').text(station);
            $('#stationContact').text(stationInfo[station]);
            $('#stationDetail').stop(true, true).slideDown();
            $('html, body').animate({
                scrollTop: $('#stationDetail').offset().top - 50
            }, 500);
        });

        $('#searchStation').on('keyup', function() {
            const search = $(this).val().toLowerCase();
            $('#stationList li').each(function() {
                const station = $(this).data('station').toLowerCase();
                $(this).toggle(station.includes(search));
            });
        });
    </script>
</body>
</html>