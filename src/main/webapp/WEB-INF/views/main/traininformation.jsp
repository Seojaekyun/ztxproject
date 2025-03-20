<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>열차 편의 시설 안내</title>
<style>
.tab-menu {
	display: flex;
	gap: 10px;
	margin-bottom: 25px;
	margin-top: 30px;
}

.tab-menu button {
	padding: 12px 25px;
	background: #f1f1f1;
	border: 1px solid #ccc;
	cursor: pointer;
	font-size: 16px;
	border-radius: 5px;
	text-decoration: none;
}

.tab-menu button.active {
	background: #003b8b;
	color: #fff;
}

.tab-content {
	display: none;
	padding: 20px;
	background: white;
}

.tab-content.active {
	display: block;
}

.membership-container {
	width: 1100px;
	margin: auto;
	padding: 20px;
	background: white;
}

.section-title {
	font-size: 22px;
	font-weight: bold;
	margin-bottom: 15px;
	color: #003366;
	border-bottom: 2px solid #003366;
	padding-bottom: 5px;
}

.csc {
	background-color: #078EB9;
	color: white;
	padding: 20px;
	text-align: center;
	font-size: 24px;
	font-weight: 600;
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
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<main>
		<div class="nullbox"></div>
		<div class="csc">열차 편의시설</div>
		<div class="membership-container">
			<div class="tab-menu">
				<button data-target="#service1" class="active">영상정보 서비스</button>
				<button data-target="#service2">무선인터넷</button>
				<button data-target="#service3">수유실 및 자판기</button>
			</div>
		
			<div id="service1" class="tab-content active">
				<br>
				<h2 class="section-title">대상열차</h2>
				<br>
				<p style="color:#078EB9">ZTX, ZTX-산천, ZTX-이음 (ZTX-이음은 우등실 내 개별 VOD 모니터 제공)</p>
				<br>
				<br>
				<h2 class="section-title">서비스 내용</h2>
				<br>
				<div>
					<p>정차역 안내, 음악방송, 영상콘텐츠 방송, 꼬레일뉴스(GGORAIL 고객안내사항) 및 주요뉴스</p>
				</div>
				<br> <br>
				<h2 class="section-title">ZTX영상정보 콜센터</h2>
				<br>
				<div>
					<p>080-001-2843 (24시간 운영)</p>
				</div>
			</div>
		
			<div id="service2" class="tab-content">
				<br>
				<h2 class="section-title">대상열차</h2>
				<br>
				<p style="color:#078EB9">ZTX, ZTX-산천, ZTX-새마을, 새마을, 무궁화</p>
				<br>
				<br>
				<h2 class="section-title">이용요금</h2>
				<br>
				<div>
					<p>무료</p>
				</div>
				<br> <br>
				<h2 class="section-title">ZTX 인터넷 콜센터</h2>
				<br>
				<div>
					<p style="color:#078EB9; font-size:20px;">1688-3639(09:00~20:00)</p>
					<br>
					<p>ZTX의 경우 시속 300km이상으로 고속 운행함에 따라 인터넷 속도가 느리고 일부구간에서 장애가 발생할 수 있습니다.</p>
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
