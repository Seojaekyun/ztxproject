<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>예약 통계 차트</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        section {
            max-width: 1200px;
            margin: auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        h1 {
            text-align: center;
            font-size: 24px;
            color: #000A8E;
            margin-bottom:10px;
        }
        h2 {
            font-size: 18px;
            color: #333;
            margin-bottom: 20px;
        }
        .chart-container {
            width: 33%;  /* 3개의 차트를 가로로 나열하기 위해 각각 33%로 설정 */
            padding: 20px;
        }
        .chart-wrapper {
            display: flex;
            justify-content: space-between;  /* 차트를 가로로 나란히 배치 */
        }
        canvas {
            width: 100% !important;
            height: 400px !important;
        }
    </style>
</head>
<body>
<h1>예약 통계 차트</h1>
    <section>
        

        <!-- 차트를 가로로 배치 -->
        <div class="chart-wrapper">
            <!-- 월별 예약 차트 -->
            <div class="chart-container">
                <h2>월별 예약</h2>
                <canvas id="monthlyChart"></canvas>
            </div>

            <!-- 항공편별 예약 차트 -->
            <div class="chart-container">
                <h2>행선지별 예약</h2>
                <canvas id="flightChart"></canvas>
            </div>

            <!-- 좌석 등급별 예약 차트 -->
            <div class="chart-container">
                <h2>좌석 등급별 예약</h2>
                <canvas id="seatClassChart"></canvas>
            </div>
        </div>
    </section>

    <script>
        // 월별 예약 차트 - 곡선형 차트
        var monthlyCtx = document.getElementById('monthlyChart').getContext('2d');
        var monthlyChart = new Chart(monthlyCtx, {
            type: 'line',  // 'bar' 대신 'line'으로 변경
            data: {
                labels: ${monthlyLabels},  // JSON 형태로 전달된 데이터를 받음
                datasets: [{
                    label: '월별 예약',
                    data: ${monthlyReservations},
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 4,
                    fill: true,
                    tension: 0.4 // 곡선의 휘는 정도 조절
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true  // y축 시작값을 0으로 설정
                    }
                },
                plugins: {
                    legend: {
                        display: false  // 차트의 라벨을 숨김
                    }
                }
            }
        });

        // 항공편별 예약 차트 - 곡선형 차트
        var flightCtx = document.getElementById('flightChart').getContext('2d');
        var flightChart = new Chart(flightCtx, {
            type: 'line',  // 'bar' 대신 'line'으로 변경
            data: {
                labels: ${flightLabels},  // JSON 형태로 전달된 데이터를 받음
                datasets: [{
                    label: '행선지별 예약',
                    data: ${flightReservations},
                    backgroundColor: 'rgba(153, 102, 255, 0.2)',
                    borderColor: 'rgba(153, 102, 255, 1)',
                    borderWidth: 4,
                    fill: true,
                    tension: 0.4 // 곡선의 휘는 정도 조절
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true  // y축 시작값을 0으로 설정
                    }
                },
                plugins: {
                    legend: {
                        display: false  // 차트의 라벨을 숨김
                    }
                }
            }
        });

        // 좌석 등급별 예약 차트 - 곡선형 차트
        var seatClassCtx = document.getElementById('seatClassChart').getContext('2d');
        var seatClassChart = new Chart(seatClassCtx, {
            type: 'line',  // 'bar' 대신 'line'으로 변경
            data: {
                labels: ${seatClassLabels},  // JSON 형태로 전달된 데이터를 받음
                datasets: [{
                    label: '좌석 등급별 예약',
                    data: ${seatClassReservations},
                    backgroundColor: 'rgba(255, 159, 64, 0.2)',
                    borderColor: 'rgba(255, 159, 64, 1)',
                    borderWidth: 4,
                    fill: true,
                    tension: 0.4 // 곡선의 휘는 정도 조절
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true  // y축 시작값을 0으로 설정
                    }
                },
                plugins: {
                    legend: {
                        display: false  // 차트의 라벨을 숨김
                    }
                }
            }
        });
    </script>
</body>
</html>
