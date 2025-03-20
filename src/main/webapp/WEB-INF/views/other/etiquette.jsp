<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>열차 이용안내</title>
<link rel="stylesheet" href="/resources/css/style.css">
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

.service-container {
	width: 1100px;
	margin: auto;
	padding: 20px 0;
}

.section-title {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 15px;
	color: #003366;
	border-bottom: 2px solid #003366;
	padding-bottom: 5px;
}

.tab-menu {
	display: flex;
	gap: 10px;
	margin-bottom: 25px;
}

.tab-menu button {
	padding: 12px 25px;
	background: #f1f1f1;
	border: 1px solid #ccc;
	cursor: pointer;
	font-size: 16px;
	border-radius: 5px;
}

.tab-menu button.active {
	background: #003b8b;
	color: #fff;
}

.tab-content {
	display: none;
	padding: 20px;
	border: none;
	background: white;
}

.tab-content.active {
	display: block;
}

.csc {
	background-color: #078EB9;
	color: white;
	padding: 20px;
	text-align: center;
	font-size: 24px;
	font-weight: 600;
}

.info-box-1 {
	background-color: #f9f9f9;
	padding: 30px;
	margin-bottom: 20px;
}

.chapter-item {
	display: flex;
	align-items: center;
	margin-bottom: 10px;
	font-weight: bold;
	font-size: 22px;
}

.chapter-dot {
	display: inline-block;
	width: 25px;
	height: 25px;
	border-radius: 50%;
	margin-right: 10px;
	flex-shrink: 0;
}

.chapter-text {
	font-size: 18px;
	margin: 0 0 20px 35px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<main>
		<div class="nullbox"></div>
		<div class="csc">탑승 안내</div>
		<div class="service-container">
			<div class="tab-menu">
				<button data-target="#service1" class="active">휴대품 세부승차 기준</button>
				<button data-target="#service2">올바른철도 이용문화</button>
				<button data-target="#service3">열차이용 기초질서 지키기</button>
			</div>

			<div id="service1" class="tab-content active">
				<h2 class="section-title">휴대품 승차기준</h2>
				<div>
					<p>고객 1인이 스스로 운반할 수 있어야 하고, 좌석 또는 통로를 차지하지 않는 두 개 이내의 물품을 가지고 열차에 승차하실 수 있습니다.</p>
					<p>소지하신 수화물은 객실사이에 있는 수화물 보관함 또는 객실 내 선반에 보관하여 주시기 바랍니다.</p>
					<p align="center"><img src="../static/resources/manners/hyu.png"></p>
				</div>

				<h2 class="section-title">반려동물</h2>
				<div>
					<p>반려동물은 별도 운반 케이스에 넣어서 승차하셔야 합니다.</p>
					<p>열차에 승차할 수 있는 반려동물은 개, 고양이, 새 등 무게 10kg 이내로, 길이 100cm(45cm × 30cm × 25cm) 이내 운반용기에 넣어 동행해 주시기 바랍니다.</p>
					<div style="display: flex; justify-content: space-between; gap: 20px;">
						<div style="flex: 1; padding: 15px; border-radius: 8px; text-align: center;">
							<div class="info-box-1">
								<p>반려동물은 반드시 필요한</p>
								<p>예방접종을 하셔야 합니다.</p>
							</div>
							<div style="margin-top: 10px;">
								<img src="../static/resources/manners/animal.png" alt="반려동물">
							</div>
						</div>
						<div style="flex: 1; padding: 15px; border-radius: 8px; text-align: center;">
							<div class="info-box-1">
								<p>다른 고객에게 두려움과 혐오감을</p>
								<p>줄 수 있는 맹수, 맹금류 등은</p>
								<p>탑승이 제한됩니다.</p>
							</div>
							<div style="margin-top: 10px;">
								<img src="../static/resources/manners/animal2.png" alt="맹수제한">
							</div>
						</div>
					</div>
				</div>

				<h2 class="section-title">자전거</h2>
				<div>
					<p>열차 승차 전에 반드시 접어서 열차에 승차 하셔야 합니다. 일체형 자전거의 경우 완전 분해하여 가방에 넣어야 승차가 가능합니다.</p>
					<p align="center"><img src="../static/resources/manners/train.png"></p>
				</div>
			</div>

			<div id="service2" class="tab-content">
				<p align="center"><img src="../static/resources/manners/manners.jpg" width="1000"></p>
			</div>

			<div id="service3" class="tab-content">
				<div>
					<h2 class="section-title">GGORAIL 열차이용 기초질서 지키기 캠페인</h2>
					<p>꼬레일에서는 올바른 철도여행문화를 선도해 나가기 위해 '열차이용 기초 질서 지키기' 캠페인을 연중 시행하고 있습니다.</p>
					<p>모두의 즐거운 기차여행을 위하여 코레일과 함께 하나씩 실천해 보시는 건 어떨까요?</p> <br><br><br><br>
					<p>이달의 기초질서 지키기</p>
					<p style="font-size: 30px; color: #003366; font-weight: bold; font-family: 'Noto Sans KR', Arial, sans-serif;">객실안에서 조용히 하기</p>
					<p align="left"><img src="../static/resources/manners/chapter.png"></p>

					<div>
						<div class="chapter-item" style="color: #c08429;">
							<span class="chapter-dot" style="background: #c08429;"></span> Chapter 01
						</div>
						<p class="chapter-text">객실 안에서는 소곤소곤~~ 조용히 대화해 주세요</p>
					</div>

					<div>
						<div class="chapter-item" style="color: #1d3557;">
							<span class="chapter-dot" style="background: #1d3557;"></span> Chapter 02
						</div>
						<p class="chapter-text">휴대전화 통화를 할 때에는 객실 밖 통로를 이용해 주시고,</p>
					</div>

					<div>
						<div class="chapter-item" style="color: #8b0000;">
							<span class="chapter-dot" style="background: #8b0000;"></span> Chapter 03
						</div>
						<p class="chapter-text">함께 여행하는 어린이들도 객실 예절을 지킬 수 있도록 보살펴 주시기 바랍니다.</p>
					</div>
				</div>	<br><br><br>

				<div style="text-align: center; margin-top: 40px;">
					<h2 style="font-size: 30px; color: #003366; font-weight: bold; font-family: 'Noto Sans KR', Arial, sans-serif;">고객님 한분 한분의 작은 실천이 모두의 기차여행을 더욱 즐겁게 합니다.</h2>
				</div>
			</div>
		</div>
	</main>

	<script>
	$('.tab-menu button').on('click', function() {
	    $('.tab-menu button').removeClass('active');
	    $(this).addClass('active');
	    const target = $(this).data('target');
	    $('.tab-content').removeClass('active');
	    $(target).addClass('active');
	});
	</script>
</body>
</html>
