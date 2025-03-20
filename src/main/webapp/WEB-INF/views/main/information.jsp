<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>역 편의 시설 안내</title>
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
	<div class="csc">역 편의 시설</div>
	<div class="membership-container">
		<div class="tab-menu">
			<button data-target="#service1" class="active">꼬레일멤버십라운지</button>
			<button data-target="#service2">여행센터</button>
		</div>

		<div id="service1" class="tab-content active">
			<br>
			<div>
				<h2 class="section-title">라운지 운영역</h2>
				<br>
				<img src="../static/resources/rounge.png" width="1000px;" />
			</div>
			
			<br> <br> <br>
			<h2 class="section-title">제공 서비스</h2>
			<ul style="padding: 0; margin: 0;">
				<li style="display: flex; align-items: center; gap: 8px; list-style: disc; margin-left: 20px;"><span style="font-weight: bold; font-size: 17px;">기본서비스 :</span>
					<p style="margin: 0;">식수, PC, WiFi, TV뉴스, 열차정보, 신문/매거진,콘센트/USB포트</p>
				</li>
				<li style="display: flex; align-items: center; gap: 8px; list-style: disc; margin-left: 20px;"><span style="font-weight: bold; font-size: 17px;">유료서비스 :</span>
					<p style="margin: 0;">커피, 복합기</p>
				</li>
			</ul>
			<br><br>
			<h2 class="section-title">이용대상</h2>
			<div>
				<p>다음 해당하는 사항 중 1개를 소지한 고객</p>
				<ul>
					<li>QR코드 : 꼬레일 당일 승차권(꼬레일톡/종이/홈티켓/자동발매기) / 모바일 멤버십 카드(꼬레일톡)</li> <br>
					<li>RF카드 : 레일플러스카드(선불교통카드) / 우리카드(후불교통카드)</li>
				</ul>
				<p>※ 기존 멤버십 카드 및 개인 신용카드 홈페이지 등록 고객은 모바일 멤버십 카드로 사용(’19.3.4일~)</p>
			</div>
			<br><br>
			<h2>모바일 멤버십 카드 확인 방법</h2>
			<br>
			<div>
				<img src="../static/resources/card.png" width="1000px;" />
			</div>
			
			
			
			<br> <br> <br>
			<h2 class="section-title">출입방법</h2>
			<div>
				<p>1명씩 스피드게이트 단말기에 QR·RF 인식 후 입장</p>
				<ul>
					<li>입장 관련 직원의 도움이 필요한 경우 직원도움벨 호출</li>
				</ul>
			</div>
			<br> <br>
			<h2 class="section-title">유의사항</h2>
			<div>
				<ul>
					<li>외부 음식물 내부 반입 및 섭취 금지(단, 커피 및 음료는 가능)</li>
					<li>고객 개인물품 보관 불가(역사 내 물품보관함 이용)</li>
					<li>타인을 방해하거나 소음을 일으키는 행위 금지</li>
					<li>휴대폰 충전기 별도 대여 불가(콘셉트 및 USB포트 사용 가능)</li>
					<li>각종 매거진 및 도서 등 이용 후 제자리에 비치</li>
					<li>기저귀를 가는 행위 금지(역사 내 수유방 이용)</li>
				</ul>
			</div>
			<br> <br> <br>
			<h2 class="section-title">이용제한</h2>
			<div>
				<ul>
					<li>라운지 직원이 출입자격 소지 증빙을 확인 요구시 거부하는 경우</li>
					<li>라운지 직원에게 폭언, 폭행 등 위해를 가하는 경우</li>
					<li>고성방가, 악취 등으로 타인에게 피해를 끼치는 행위</li>
					<li>위해물품, 위험품을 휴대하고 라운지에 입장한 경우</li>
					<li>애완용 동물을 전용가방 등에 넣지 않고 외부로 노출된 경우</li>
					<li>각종 계약, 판매, 거래 등 상업적인 목적으로 입장한 경우</li>
					<li>기부, 연설, 권유 등으로 다른 고객에게 불편을 끼치는 행위</li>
					<li>직원의 동의없이 안내데스크에 출입하는 행위</li>
				</ul>
			</div>
			<br> <br> <br>
			<h2 class="section-title">운영사(위탁사)</h2>
			<div>
				<p>우리은행(우리피앤에스)</p>
			</div>
	</div>
	<div id="service2" class="tab-content">
			<br>
			<h2 class="section-title">제공 서비스</h2>
			<div>
				<ul>
					<li>기차여행 및 지역 관광명소 등 여행안내</li>
					<li>철도여행상품 판매</li>
					<li>공연티켓, 스포츠티켓 등 판매</li>
					<li>단체승차권, 입장권 발권</li>
				</ul>
			</div>
			<br><br>
			<h2 class="section-title">운영시간</h2>
			<div>
				<ul>
					<li>평일 09:00 ~ 18:00 / 주말 및 공휴일 제외</li>
				</ul>
			</div>
			<br><br>
			<div>
				<h2 class="section-title">전국 여행센터 연락처(전국 2개)</h2> <br>
				<img src="../static/resources/center.png" width="1000px"/>
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
