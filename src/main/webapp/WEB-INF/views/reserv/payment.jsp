<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f7f8fa;
        margin: 20px;
        color: #333;
    }
    h2 {
        color: #222;
        text-align: center;
        margin-bottom: 20px;
        font-size: 26px;
    }
    .flight-box {
    	width: 1000px;
        background-color: #fff;
        border: 1px solid #0066cc;
        border-radius: 10px;
        padding: 25px;
        margin: auto;
        margin-bottom: 25px;
        box-shadow: 0 3px 12px rgba(0, 0, 0, 0.1);
    }
    table {
    	width: 100%;
    }
    .flight-info {
        display: flex;
        justify-content: space-between;
        margin-bottom: 15px;
    }
    .flight-info div {
        flex: 1;
        text-align: center;
    }
    .flight-header {
        font-size: 18px;
        font-weight: bold;
        color: #333;
    }
    .flight-time, .flight-details {
        font-size: 18px;
        color: #555;
    }
    .flight-details {
        margin-top: 15px;
        padding-top: 10px;
        border-top: 1px solid #0066cc;
    }
    .toggle-details {
        cursor: pointer;
        color: #0056b3;
        font-size: 16px;
        text-align: center;
    }
    .toggle-details:hover {
        color: #003d7a;
    }
    button, submit {
        background-color: #0066cc;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 10px;
        cursor: pointer;
        font-size: 15px;
        display: block;
        margin: 20px auto;
    }
    #btn1 {
    	background-color: #0066cc;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 10px;
        cursor: pointer;
        font-size: 13px;
    	display: inline-block;
    }
    button:hover {
        background-color: #218838;
    }
    .details-item {
        margin-bottom: 12px;
        font-size: 18px;
    }
    .PNR-box {
        font-size: 18px;
        color: #333;
        margin-top: 20px;
    }
    #sudan .sub {
		display:none;
	}
	#sudan #fsub {
		display:block;
	}
	#sudan #sudanFirst {
		width: 100%;
		height:110px;
		border:1px solid #0066cc;
		padding:10px;
	}
	#sudan #sudanSecond {
		width: 100%;
		height:40px;
		border:1px solid #0066cc;
		border-top:none;
		padding:10px;
	}
	#sudan .subMain {
		display:none;
	}
	#sudan #up {
		display:none;
		font-size: 18px;
	}
	#sudan #down {
		font-size: 18px;
	}
	#sudan select {
		width:120px;
		height:28px;
		margin-left:10px;
	}
	#PNR {
		font-size: 19px;
		font-weight: 600;
		text-align: right;
		width: 120px;
		border: none;
	}
</style>
<script>
	function viewSub(n) {
		var sub=document.getElementsByClassName("sub");
		for(i=0;i<sub.length;i++) {
			sub[i].style.display="none";
		}
		sub[n].style.display="block";
	}
	
	function down() { // 다른결제수단을 보이게 하기  => #sudanSecond의 높이 : 180 , .subMain를 block
		document.getElementById("sudanSecond").style.height="180px";
		var subMain=document.getElementsByClassName("subMain");
		for(i=0;i<subMain.length;i++) {
			subMain[i].style.display="block";
		}
		document.getElementById("up").style.display="inline";
		document.getElementById("down").style.display="none";
	}
	
	function up() { // 다른결제수단을 숨기기  => #sudanSecond의 높이 : 40, .subMain를 none
		document.getElementById("sudanSecond").style.height="40px";
		var subMain=document.getElementsByClassName("subMain");
		for(i=0;i<subMain.length;i++) {
			subMain[i].style.display="none";
		}
		document.getElementById("up").style.display="none";
		document.getElementById("down").style.display="inline";
	}
	
</script>
</head>
<body>
	<h2>예약 세부 사항</h2>
	<form name="gform" method="post" action="chargeOk">
	<!-- 가는편 항공편 정보 -->
	<div class="flight-box">
		<c:forEach var="res" items="${rsvClist}">
		<input type="hidden" name="reservid" value="${res.reservid }">
		<input type="hidden" name="charge" value="${res['charge']}">
		<div class="flight-header">예약 번호: <input type="text" name="PNR" id="PNR" value="${res['PNR']}" readonly></div>
		<br>
		<div class="flight-info">
			<div>
				<p class="flight-time">출발 시간: ${res['departureTime']}</p>
				<p class="flight-time">도착 시간: ${res['arrivalTime']}</p>
			</div>
			<div>
				<p class="flight-time">선택한 좌석:
					<c:forEach var="rsi" items="${rsvSeatInfo}">
					${rsi['seatnum']} <!-- 좌석 데이터가 없으면 공백 표시 -->
					</c:forEach>
				</P>
			</div>
		</div>
		<div id="going-details" class="flight-details">
			<table>
				<tr>
					<td>
						<div class="details-item">출발지: ${res['departure']}</div>	
					</td>
					<td>
						<div class="details-item">여객 시간: }</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="details-item">도착지: ${res['arrival']}</div> <!-- 출발지, 도착지 추가 -->
					</td>
					<td>
						<div class="details-item">탑승 인원: ${res.resnum}</div> <!-- 탑승 인원 추가 -->
					</td>
					<td>
						<div class="details-item">총 결제 금액: <fmt:formatNumber value="${res['charge']}" type="number"/>원</div> <!-- 총 결제 금액 추가 -->
					</td>
				</tr>
			</table>
		</div>
		<br>
		<hr>
		<br>
		<section id="member"> <!-- 구매자 정보 -->
			<table>
				<tr>
					<td width="200"> 예약자 ID </td>
					<td> ${res['userid'] } </td>
				</tr>
			</table>
		</section>
		<br>
		</c:forEach>
		<section id="sudan">
			<span id="h3"> 결제 수단 </span>
			<div id="sudanFirst">
				<div>
					<input type="radio" value="0" name="sudan" class="sudan" checked onclick="viewSub(0)"> 신용/체크카드
					<div class="sub" id="fsub">
						<select name="card">
							<option> 선 택 </option>
							<option value="0"> 신한카드 </option>
							<option value="1"> 농협카드 </option>
							<option value="2"> 우리카드 </option>
							<option value="3"> 국민카드 </option>
							<option value="4"> 하나카드 </option>
						</select>
						<select name="halbu">
							<option value="0"> 일시불 </option>
							<option value="2"> 2개월 </option>
							<option value="3"> 3개월 </option>
							<option value="6"> 6개월 </option>
							<option value="12"> 12개월</option>
						</select>
					</div>
				</div>
				<div>
					<input type="radio" name="sudan" value="1"  class="sudan" onclick="viewSub(1)"> e-Pay
					<div class="sub">
						0원
					</div>
				</div>
			</div>
			<div id="sudanSecond">
				<div> 다른 결제 수단
					<span id="down" onclick="down()">▼</span>
					<span id="up" onclick="up()">▲</span>
				</div>
				<div class="subMain">
					<input type="radio" name="sudan" value="2"  class="sudan" onclick="viewSub(2)"> 계좌이체
					<div class="sub">
						<select name="bank">
							<option> 선 택 </option>
							<option value="0"> 신한은행 </option>
							<option value="1"> 농협은행 </option>
							<option value="2"> 우리은행 </option>
							<option value="3"> 국민은행 </option>
							<option value="4"> 하나은행 </option>
						</select>
					</div>
				</div>
				<div class="subMain">
					<input type="radio" name="sudan" value="3" class="sudan" onclick="viewSub(3)"> 법인카드
					<div class="sub">
						<select name="lcard">
							<option> 선 택 </option>
							<option value="0"> 신한카드 </option>
							<option value="1"> 농협카드 </option>
							<option value="2"> 우리카드 </option>
							<option value="3"> 국민카드 </option>
							<option value="4"> 하나카드 </option>
						</select>
					</div>
				</div>
				<div class="subMain">
					<input type="radio" name="sudan" value="4" class="sudan" onclick="viewSub(4)"> 휴대폰
					<div class="sub">
						<select name="tong">
							<option> 선 택 </option>
							<option value="0"> SKT </option>
							<option value="1"> KT </option>
							<option value="2"> LG </option>
							<option value="3"> 알뜰폰 </option>
						</select>
					</div>
				</div>
				<div class="subMain">
					<input type="radio" name="sudan" value="5" class="sudan" onclick="viewSub(5)"> 무통장입금
					<div class="sub">
						<select name="nbank">
							<option> 선 택 </option>
							<option value="0"> 신한은행 </option>
							<option value="1"> 농협은행 </option>
							<option value="2"> 우리은행 </option>
							<option value="3"> 국민은행 </option>
							<option value="4"> 하나은행 </option>
						</select>
					</div>
				</div>
			</div>
		</section>
		<br>
		<section id="last">
			<div style="text-align: right;">
			<input type="submit" id="btn1" value="결제하기" id="submit">
			</div>
			<br>
		</section>
	</div>
	</form>
	<hr>
	<button onclick="window.location.href='chargePay';">돌아가기</button>
</body>
</html>
