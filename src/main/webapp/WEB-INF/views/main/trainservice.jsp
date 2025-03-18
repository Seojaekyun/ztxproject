<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>열차 이용안내</title>
<link rel="stylesheet" href="/resources/css/style.css">
<style>
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
}

.tab-menu button.active {
	background: #003366;
	color: #fff;
}

.tab-content {
	display: none;
	padding: 20px;
	border: 1px solid #ddd;
	background: #fafafa;
}

.tab-content.active {
	display: block;
}

.info-row {
	display: flex;
	align-items: flex-start;
	justify-content: flex-start;
	padding: 12px 0;
	border-bottom: 1px solid #e0e0e0;
}

.info-row span:first-child {
	min-width: 150px;
	font-weight: bold;
	font-size: 16px;
	color: #333;
}

.info-row span:last-child {
	font-size: 16px;
	color: #555;
	line-height: 1.8;
	border: none;
	background: transparent;
	padding: 0;
}
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
	}
	.tab-menu button.active {
	    background: #003366;
	    color: #fff;
	}
	.tab-content {
	    display: none;
	    padding: 20px;
	    border: 1px solid #ddd;
	    background: #fafafa;
	}
	.tab-content.active {
	    display: block;
	}
	.info-row {
	    display: flex;
	    align-items: flex-start;
	    justify-content: flex-start;
	    padding: 12px 0;
	    border-bottom: 1px solid #e0e0e0;
	}
	.info-row span:first-child {
	    min-width: 150px;
	    font-weight: bold;
	    font-size: 16px;
	    color: #333;
	}
	.info-row span:last-child {
	    font-size: 16px;
	    color: #555;
	    line-height: 1.8;
	    border: none;
	    background: transparent;
	    padding: 0;
	}
	.csc {
		background-color: #078EB9;
		color: white;
		padding: 20px;
		text-align: center;
		font-size: 24px;
		font-weight: 600;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<main>
	<div class="nullbox"></div>
	<div class="csc">열차 서비스</div>
	<div class="service-container">
		<div class="tab-menu">
			<button data-target="#service1" class="active">ZTX특실 서비스</button>
			<button data-target="#service2">ZTX특실깨우미 서비스</button>
			<button data-target="#service3">ZTX특실서비스콜</button>
		</div>
		<div id="service1" class="tab-content active">
			<div class="info-row">
				<span>물품</span>
				<span>생수, 쿠키, 견과, 물티슈, 수면안대, 신문</span>
			</div>
			<div class="info-row">
				<span>이용방법</span>
				<span>승무원에게 요청 (생수, 신문은 셀프 이용)</span>
			</div>
			<div class="info-row">
				<span>도서및잡지</span>
				<span>
					ZTX미니도서관(ZTX3,4,5호차, ZTX-산천 3호차) 운영<br>
					<p style="color:red;">※ ZTX-이음의 우등실은 물품 및 도서·잡지 서비스를 제공하지 않습니다.<p>
				</span>
			</div>
		</div>
		<div id="service2" class="tab-content">
			<div class="info-row">
				<span>대상열차</span>
				<span>ZTX(ZTX-산천포함) 특실</span>
			</div>
			<div class="info-row">
				<span>제공서비스</span>
				<span>도착 5분전에 깨워줌으로써 편안한 여행서비스 제공</span>
			</div>
			<div class="info-row">
				<span>이용방법</span>
				<span>열차 승차 후 열차승무원에게 요청</span>
			</div>
		</div>
		<div id="service3" class="tab-content">
			<div class="info-row">
				<span>서비스콜 안내</span>
				<span>
					서비스 콜 신청 시열차 내 긴급사항 및 고객 불편사항에 대해 승무원이 신속안내를 해드립니다.<br>
					※ 서비스콜 버튼 클릭 → 해당사항 선택 또는 입력 → 전송
				</span>
			</div>
			<div class="info-row" style="justify-content: flex-end;">
				<span><img src="../static/resources/trainservice.png" alt="열차서비스"></span>
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