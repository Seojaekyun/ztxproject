<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>레일로 자유여행 패스 안내</title>
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
.tab-menu {
	display: flex;
	gap: 10px;
	margin-bottom: 25px;
	margin-top: 30px; /* 추가 */
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

.btn-primary {
	background: #007bff;
	color: white;
	padding: 10px 20px;
	border: none;
	cursor: pointer;
	display: inline-block;
}

.btn-primary:hover {
	background: #0056b3;
}

.membership-container {
	width: 1100px;
	margin: auto;
	padding: 20px;
	background: white;
}

.info-box {
	background-color: #f9f9f9;
	padding: 30px;
	border-left: 5px solid #003366;
	margin-bottom: 20px;
}

.info-box-1 {
	background-color: #f9f9f9;
	padding: 30px;
	margin-bottom: 20px;
}

.button {
	display: inline-block;
	padding: 10px 15px;
	background-color: #003b8b;
	color: white;
	text-decoration: none;
	border-radius: 5px;
	margin-top: 10px;
}

.section-title {
	font-size: 22px;
	font-weight: bold;
	margin-bottom: 15px;
	color: #003366;
	border-bottom: 2px solid #003366;
	padding-bottom: 5px;
}

.swiper-container {
	width: 48%;
}

.swiper-slide img {
	width: flex;
	height: auto;
	display: block;
}

.swiper-nav-wrapper {
	text-align: center;
	margin-top: 10px;
}

.slider-wrapper {
	display: 50%;
	justify-content: space-between;
	gap: 20px;
	margin-top: 50px;
}

.swiper-container, .mySwiper1, .mySwiper2 {
	width: 38%;
	box-sizing: border-box;

}

.swiper-slide img {
	width: 50%;
	height: auto;
	display: block;
}

.swiper-pagination1, .swiper-pagination2 {
	margin-top: 10px;
	text-align: center;
	position: static;
	
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
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
</head>
<body>
<main>
	<div class="nullbox"></div>
	<div class="csc">자유여행</div>
	<div class="membership-container">
		<div class="tab-menu">
			<button data-target="#service1" class="active">패스소개</button>
			<button data-target="#service2">좌석지정안내</button>
		</div>

		<div id="service1" class="tab-content active">

			<br>
			<div class="info-box">
				<h2 font-size="40px;">자유롭게 떠나보자! ZTX 내일로 두번째 이야기</h2>
				<br>
				<p>전 국민 누구나 즐기는 7일간의 자유여행!</p>
				<p>보다 더 자유롭고 편안해진 내일로를 경험해보세요.</p>
			</div>
			<div>
				<div style="text-align: center;">
					<a href="../login/login" class="button">내일로 2.0구매</a>
				</div>
			</div>
			<br> <br> <br>
			<h2 class="section-title">무엇이 바뀌었나</h2>
			<img src="../static/resources/what.png" width="1000px;" /> <br>
			<br>
			<h2 class="section-title">이용대상</h2>
			<br>
			<div>
				<h2 font-size="20px;">전국민 누구나</h2>
			</div>
			<br> <br> <br>
			<h2 class="section-title">패스가격</h2>
			<img src="../static/resources/price.png" width="1000px;" /> <br>
			<br> <br>
			<h2 class="section-title">이용열차</h2>
			<div>
				<ul>
					<li>ZTX의 좌석, 일반열차(ITX-마음, ITX-청춘, ITX-새마을, 새마을, 무궁화, 누리로)의 좌석
						및 입석 ㆍ자유석</li>
				</ul>
			</div>
			<br> <br> <br>
			<h2 class="section-title">운영기간</h2>
			<div>
				<ul>
					<p>연중운영</p>
					<li>단, 꼬레일이 지정한 명절 특별수송기간은 이용 불가</li>
				</ul>
			</div>
			<br> <br> <br>
			<h2 class="section-title">이용방법</h2>
			<div>
				<ul>
					<p>패스 구매일 익일부터 7일 이내 이용시작일 지정</p>
					<li>유효기간 중 ZTX의 좌석 2회(1일 1회, 총 2회), 일반열차의 좌석(1일 2회) 및
						입석ㆍ자유석(횟수 제한없음)</li>
					<li>열차의 좌석지정은 별도의 공석 범위내에서 이용되므로 일반좌석이 남아있더라도 패스좌석 매진 시 이용이
						불가할 수 있습니다.</li>
					<li>입석ㆍ자유석 이용 시 이용권을 반드시 발권하셔야 합니다.</li>
				</ul>
			</div>
			<br> <br> <br>
			<h2 class="section-title">운영기간</h2>
			<div>
				<ul>
					<p>이용시작일 기준 7일전부터 구매 가능</p>
					<li>패스 구매와 동시에 좌석지정권 및 입석ㆍ자유석 이용권 발매 가능 가능</li>
					<li>각 권종별 <span style="color: red;">연간 4회</span>까지만 구매 가능
					</li>
				</ul>
			</div>
			<br> <br> <br>
			<h2 class="section-title">판매처</h2>
			<div>
				<ul>
					<p>역 창구, 꼬레일톡, 홈페이지</p>
				</ul>
			</div>
			<br> <br> <br>
			<h2 class="section-title">주의사항</h2>
			<div class="info-box">
				<ul>
					<li>패스에 표기된 기명인만 사용 가능하며 타인 양도 절대 불가합니다.</li>
					<br>
					<li>열차 이용 시 ①본인임을 증명할 수 있는 신분증 ②내일로 두번째 이야기 패스 ③열차별 좌석지정권 또는
						입석ㆍ자유석 이용권을 모두 소지해야 합니다.</li>
					<p>미소지 시 최대 30배 부가운임이 징수됩니다.</p>
					<br>
					<li>종이승차권(MS중기권)은 분실 시 재발매되지 않습니다.</li>
					<br>
					<li>도중 여행중지, 열차 지연이나 운행 중지 등에 따른 보상 및 마일리지 적립 대상에서 제외되며, 서면상
						기재하지 않은 사항은 철도 공사가 정한</li>
					<p>여객운송약관 및 관련 규정을 적용합니다.</p>
					<br>
					<p>이용시작일 1일 전까지 최저수수료(400원) 공제 후 반환 가능합니다.</p>
					<br>
					<p>* 단, 구매 후 30분 이내에는 수수료 없이 반환 가능</p>
					<br>
					<li>이용시작일 이후, 좌석지정권 또는 입석ㆍ자유석 이용권을 사용하지 않은 경우 위약금(영수금액의 5%) 공제
						후 유효기간 내 반환 가능합니다.</li>
					<br>
					<p>* 단, 좌석지정권 또는 입석ㆍ자유석 이용권을 사용한 경우 반환 불가</p>
					<br>
					<li>부정판매 또는 타인 양도 시, 민ㆍ형사상의 법적 책임을 질 수 있습니다.</li>
				</ul>
			</div>
		</div>
	</div>
	<div id="service2" class="tab-content">
		<div class="membership-container">
			<br>
			<div class="info-box">
				<h2 font-size="40px;">자유롭게 떠나보자! ZTX 내일로 두번째 이야기</h2>
				<br>
				<p>전 국민 누구나 즐기는 7일간의 자유여행!</p>
				<p>보다 더 자유롭고 편안해진 내일로를 경험해보세요.</p>
			</div>
			<div>
				<div style="text-align: center;">
					<a href="../login/login" class="button">내일로 2.0구매</a>
				</div>
				<div
					style="display: flex; justify-content: space-between; gap: 20px; margin-top: 50px;">
					<div class="swiper mySwiper1" align="center">
						<h2 class="section-title">STEP1</h2>
						<p>꼬레일톡에서 “내일로2.0” 구매하기</p>
						<br>
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<img src="../static/resources/slide/1.jpg">
							</div>
							<div class="swiper-slide">
								<img src="../static/resources/slide/2.jpg">
							</div>
							<div class="swiper-slide">
								<img src="../static/resources/slide/3.jpg">
							</div>
							<div class="swiper-slide">
								<img src="../static/resources/slide/4.jpg">
							</div>
							<div class="swiper-slide">
								<img src="../static/resources/slide/5.jpg">
							</div>
							<div class="swiper-slide">
								<img src="../static/resources/slide/6.jpg">
							</div>
						</div>
						<div class="swiper-nav-wrapper">
							<div class="swiper-button-prev swiper-button-prev1"></div>
							<div class="swiper-button-next swiper-button-next1"></div>
						</div>
						<div class="swiper-pagination swiper-pagination1"></div>
					</div>

					<div class="swiper mySwiper2" align="center">
						<h2 class="section-title">STEP2</h2>
						<p>꼬레일톡에서 “내일로2.0” 좌석지정하기</p>
						<br>
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<img src="../static/resources/slide/1-1.jpg">
							</div>
							<div class="swiper-slide">
								<img src="../static/resources/slide/2-2.jpg">
							</div>
							<div class="swiper-slide">
								<img src="../static/resources/slide/3-3.jpg">
							</div>
							<div class="swiper-slide">
								<img src="../static/resources/slide/4-4.jpg">
							</div>
							<div class="swiper-slide">
								<img src="../static/resources/slide/5-5.jpg">
							</div>
							<div class="swiper-slide">
								<img src="../static/resources/slide/6-6.jpg">
							</div>
						</div>

						<div class="swiper-nav-wrapper">
							<div class="swiper-button-prev swiper-button-prev2"></div>
							<div class="swiper-button-next swiper-button-next2"></div>
						</div>
						<div class="swiper-pagination swiper-pagination2"></div>
					</div>
				</div>
				<br>
				<p align="right" style="font-size: 11px; color: gray;">※ 내일로는
					좌석(또는 입석)지정 후 이용할 수 있으며, 좌석(또는 입석) 승차권 없이는 이용이 불가합니다.</p>
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

		new Swiper(".mySwiper1", {
			navigation : {
				nextEl : ".swiper-nav-wrapper .swiper-button-next1",
				prevEl : ".swiper-nav-wrapper .swiper-button-prev1"
			},
			pagination : {
				el : ".swiper-pagination1",
				clickable : true
			},
			loop : true
		});
		new Swiper(".mySwiper2", {
			navigation : {
				nextEl : ".swiper-nav-wrapper .swiper-button-next2",
				prevEl : ".swiper-nav-wrapper .swiper-button-prev2"
			},
			pagination : {
				el : ".swiper-pagination2",
				clickable : true
			},
			loop : true
		});
	</script>
</body>
</html>
