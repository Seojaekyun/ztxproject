<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>MonoRail - ZTX</title>
<link rel="icon" type="image/x-icon" href="/static/resources/favicon.png">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ko.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Hahmlet:wght@100..900&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Gugi&family=Hahmlet:wght@100..900&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
		font-family: "Noto Sans KR", arial, sans-serif;
	}
	body {
		margin: auto;
		font-family: "Noto Sans KR", arial, sans-serif;
	}
	header {
		width: 100%;
		margin: auto;
		z-index:100;
	}
	#section1 {
		width: 100%;
		height: 45px; /* Adjust the height as needed */
	}
	#s1container {
		width: 1650px;
		min-width: 1000px;
		height: 45px; /* Adjust the height as needed */
		display: flex;
		margin: auto;
		justify-content: between;
		position: relative;
		align-items: center;
	}
	#titleMenu {
		top: 0;
		right: 0;
		width: 400px;
		display: flex;
		text-align: center;
		font-size: 16px;
		font-weight: 600;
		line-height: 45px;
		align: center;
		justify-content: flex-start;
		margin-left: 110px;
	}
	#titleMenu div {
		width: 100px;
		text-align: center;
		border: 1px solid #078EB9;
		border-top: none;
		border-bottom: none;
	}
	#titleMenu div:hover {
		cursor: pointer;
	}
	#s1container #loginMenu {
		display: flex;
	    text-align: right;
	    font-size: 16px;
	    font-weight: 600;
	    line-height: 45px;
	    align-items: right;
	    width: 1030px;
	    justify-content: flex-end;
	    z-index: 111;
	}
	#s1container #loginMenu a {
		text-decoration: none;
		color: black;
		text-align: right;
	}
	#s1container #loginMenu a:hover {
		text-decoration: none;
		color: #00467F;
	}
	#s1container #loginMenu ul {
		list-style-type: none;
		margin: 0;
		padding: 10px;
		display: inline-block;
		align-items: right;
	}
	#s1container #loginMenu ul li {
		position: relative;
	}
	#s1container #loginMenu .cmenu, #s1container #loginMenu .mmenu {
		padding-left: 0;
		position: absolute;
		left: -10px;
		top: 30px;
		background: white;
		display: none;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		z-index: 12;
		border-radius:5px;
	}
	#s1container #loginMenu .cmenu > li, #s1container #loginMenu .mmenu > li {
		list-style-type: none;
		width: 100px;
		height: 35px;
		line-height: 35px;
		text-align: center;
		cursor: pointer;
		font-size: 15px;
	}
	#s1container #loginMenu .cmenu > li:hover,  #s1container #loginMenu .mmenu > li:hover {
		text-decoration: none;
		color: #00467F;
	}
	#s1container #loginMenu #supMenu, #s1container #loginMenu #myInfo {
		position: relative;
	}
	/* Center the nav at the bottom */
	#s1container #nav {
		position: absolute;
		bottom: 0 !important;
		left: 40%;
		transform: translateX(-50%);
		z-index: 2000;
		max-width: 1000px;
	}
	#s1container nav {
		display: flex;
		line-height: 30px !important;
		font-size: 16px;
	}
	#s1container nav a {
		text-decoration: none;
	}
	#s1container nav a:hover {
		text-decoration: none;
		color: #00467F;
	}
	#s1container > #nullbox {
		width: 150px;
		height: 40px;
		background: none;
		z-index: 20;
		position: absolute;
		top: 0; /* 부모 요소의 중앙 */
		right: 0; /* 부모 요소의 중앙 */
	}
	#loginMenu > #langMenu > select {
		font-size: 16px;
		width: 100px;
		background: white;
		color: black;
		border: none;
		font-weight: 400;
	}
	#section2 {
		width: 100%;
		height: 95px;
		z-index: 10;
		background: rgba(0,0,0,0.45);
		position: relative;
	}
	#s2container {
		width: 1650px;
		min-width: 1000px;
		height: 95px; /* Adjust the height as needed */
		margin: auto;
		display: flex;
		justify-content: space-between;
	}
	#logocontainer {
		margin: auto;
		margin-left: 100px;
		max-width: 260px;
		min-width: 260px;
		height: 50px;
		background: none;
		align-items: center;
		display: flex;
    	justify-content: space-between;
	}
	#logocontainer > #logoimg {
		width: 50px;
		height: 50px;
		padding-left: 10px;
		background: none;
		display: inline-block;
	}
	#s2container > #nav {
		margin-right: 150px;
		display: flex;
    	justify-content: space-between;
	}
	#s2container > #nav > #main {
		line-height:95px;
		margin: auto; /* Adjusted to align properly */
		text-align: center;
	}
	#s2container > #nav > #main > div {
		display: inline-block;
		list-style-type: none;
		width: 190px;
		height: 30px !important;
		line-height: 30px !important;
		text-align: right;
		font-size: 22px;
		font-weight: 600;
		position: relative;
		z-index: 5;
		color: white;
	}
	#s2container #nav #main > div > a{
		text-decoration: none;
		color: white;
	}
	#section3 {
		margin:auto;
		width: 100%;
		z-index: 10;
		background: none;
		position: relative;
	}
	#sub {
		position: absolute;
		width: 100%;
		min-width: 1000px;
		top:-95px;
		height: 190px; /* Adjust the height as needed */
		margin: auto;
		z-index: 11;
		display: none;
		background: white;
	}
	#sub:hover {
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
	}
	#sub > #section2 {
		width: 100%;
		height: 95px;
		z-index: 10;
		background: white;
		position: relative;
		border-top: 1px lightgray solid;
		border-bottom: 1px lightgray solid;
	}
	#sub > #section2 > #s2container {
		width: 1650px;
		min-width: 1000px;
		height: 95px; /* Adjust the height as needed */
		margin: auto;
		display: flex;
		justify-content: space-between;
	}
	#sub > #section2 > #s2container > #logocontainer {
		margin: auto;
		margin-left: 100px;
		max-width: 260px;
		min-width: 260px;
		height: 50px;
		background: none;
		align-items: center;
		display: flex;
    	justify-content: space-between;
	}
	#sub > #section2 > #s2container > #logocontainer > #logoimg {
		width: 50px;
		height: 50px;
		background: none;
		display: inline-block;
	}
	#sub > #section2 > #s2container > #nav {
		margin-right: 150px;
		display: flex;
    	justify-content: space-between;
	}
	#sub > #section2 > #s2container > #nav > #main {
		line-height:95px;
		margin: auto; /* Adjusted to align properly */
		text-align: center;
	}
	#sub > #section2 > #s2container > #nav > #main > div {
		display: inline-block;
		list-style-type: none;
		width: 190px;
		height: 30px !important;
		line-height: 30px !important;
		text-align: right;
		font-size: 22px;
		font-weight: 600;
		position: relative;
		z-index: 12;
		color: black;
	}
	#sub > #section2 > #s2container > #nav > #main > div > a{
		text-decoration: none !important;
		color: black !important;
	}
	#sub > div > .menu {
		padding-left: 300px;
		width: 1200px;
		height: 95px;
		background: none;
		border-radius:2px;
		z-index: 11;
		margin: auto;
		display: flex;
		justify-content: flex-end;
	}
	#sub > div > .menu > div {
		margin: auto;
		list-style-type: none;
		font-size: 18px;
		font-weight: 600;
		z-index: 12;
		text-align: left;
	}
	#sub > div > .menu > div > a{
		text-decoration: none !important;
		color: black !important;
	}
	#subtitle {
		width: 200px;
		height: 95px;
		line-height: 95px;
		padding-right: 50px;
		display: flex;
		justify-content: flex-end;
	}
	#submenu {
		width: 100%;
		display: flex;
		justify-content: flex-start;
	}
	#submenu > div{
		padding-left: 50px;
		display: inline-block;
	}
	#menuicon {
		width: 250px;
		line-height: 110px;
		text-align: center;
	}
	hr {
		color: blue;
	}
	footer {
		width: 100%;
		min-width: 1200px;
		height: 200px;
		background: #343c45;
		color: white;
		text-align: center;
		font-size: 10px;
		margin-top: 40px;
	}
	#footerbox1 {
		border-bottom: 1px solid gray;
		height: 80px;
	}
	#footerbox1, #footerbox2 {
		display: flex;
		justify-content: space-around;
	}
	#footerbox2 {
		height: 120px;
	}
	.footer-container {
		display: flex;
		justify-content: flex-start;
		align-items: center;
		width: 1000px;
		margin: auto;
		flex-wrap: wrap;
		font-size: 15px;
	}
	#social {
		width: 400px;
		height: 80px;
		display: flex;
		justify-content: center;
		align-items: center;
		padding-right: 60px;
	}
	#social img {
		margin-left: 10px;
	}
	#social > img:hover {
		cursor: pointer;
	}
	#famsite {
		width: 400px;
		height: 120px;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.footer-logo {
		margin-left: 40px;
		font-size: 25px;
		line-height: 50px;
		font-weight: 900;
	}
	.footer-logo img {
		height: 25px;
	}
	#logof {
		width: 1000px;
		height: 50px;
		background: #343c45;
		align-items: center;
		display: flex;
	}
	#logof > #logotext {
		height: 50px;
		width: 200px;
		background: #343c45;
		font-size: 25px;
		font-weight: 900;
		line-height: 50px;
	}
	.footer-info {
		text-align: left;
	}
	.footer-info div {
		margin-bottom: 5px;
	}
	.footer {
		display: flex;
		justify-content: flex-start;
		align-items: center;
		width: 1000px;
		margin: auto;
		flex-wrap: wrap;
		font-size: 14px;
		line-height: 60px;
	}
	
	@media (max-width: 768px) {
		.footer-container {
			flex-direction: column;
			text-align: center;
		}
		.footer-info, .footer-contact {
			text-align: center;
		}
	}
	#main1 .icona {
		margin-right: 8px;
		opacity: 0;
		transition: opacity 0.3s;
	}
	#main1:hover .icona {
		opacity: 1;
	}
	#main2 .iconb {
		margin-right: 8px;
		opacity: 0;
		transition: opacity 0.3s;
	}
	#main2:hover .iconb {
		opacity: 1;
	}
	#main3 .iconc {
		margin-right: 8px;
		opacity: 0;
		transition: opacity 0.3s;
	}
	#main3:hover .iconc {
		opacity: 1;
	}
	#main4 .icond {
		margin-right: 8px;
		opacity: 0;
		transition: opacity 0.3s;
	}
	#main4:hover .icond {
		opacity: 1;
	}
	#main5 .icone {
		margin-right: 8px;
		opacity: 0;
		transition: opacity 0.3s;
	}
	#main5:hover .icone {
		opacity: 1;
	}
	.iconmem {
		margin-right: 8px;
		opacity: 0;
		transition: opacity 0.3s;
	}
	#into:hover .iconmem {
		opacity: 1;
	}
	#chat-console {
		width: 320px;
		height: 450px;
		border: 2px solid #2DD1C5;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		border-radius: 10px;
		position: fixed;
		bottom: 20px;
		right: 20px;
		background: #fff;
		display: none;
		flex-direction: column;
		overflow: hidden;
		z-index: 9999;
	}
	#chat-header {
		background: #2DD1C5;
		color: white;
		padding: 15px;
		text-align: center;
		font-weight: bold;
		cursor: pointer;
		position: relative;
		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
		z-index: 9999;
	}
	#chat-header button {
		position: absolute;
		top: 50%;
		right: 15px;
		transform: translateY(-50%);
		background: #E74C3C;
		color: white;
		border: none;
		padding: 5px 10px;
		cursor: pointer;
		font-size: 12px;
		border-radius: 5px;
		transition: background-color 0.3s;
		z-index: 9999;
	}
	#chat-header button:hover {
		background: #C0392B;
	}
	#chat-body {
		flex: 1;
		padding: 15px;
		overflow-y: auto;
		background-color: #F8F9FA;
		display: flex;
		flex-direction: column;
	}
	#chat-body .message {
		margin-bottom: 12px;
		display: flex;
		width: 100%;
	}
	#chat-body .user-message {
		color: white;
		text-align: right;
		background: #2DD1C5;
		padding: 10px;
		border-radius: 15px;
		max-width: 80%;
		display: block;
		align-self: flex-end; /* 오른쪽 정렬 */
		clear: both;
	}
	#chat-body .admin-message {
		color: black;
		text-align: left;
		background: #E3F2FD;
		padding: 10px;
		border-radius: 15px;
		max-width: 80%;
		display: block;
		align-self: flex-start; /* 왼쪽 정렬 */
		clear: both;
	}
	#chat-input {
		display: flex;
		padding: 10px;
		background-color: #F1F1F1;
		border-bottom-left-radius: 10px;
		border-bottom-right-radius: 10px;
	}
	#chat-input input[type="text"] {
		flex: 1;
		padding: 10px;
		border: 1px solid #CCC;
		border-radius: 20px;
		outline: none;
		margin-right: 10px;
	}
	#chat-input button {
		padding: 8px 15px;
		background: #2DD1C5;
		color: white;
		border: none;
		cursor: pointer;
		border-radius: 20px;
		transition: background-color 0.3s;
	}
	#chat-input button:hover {
		background: #1A9987;
	}
	#chat-toggle {
		position: fixed;
		width: 60px;
		height: 60px;
		bottom: 20px;
		right: 30px;
		background: #00467F;
		color: yellow;
		padding: 5px;
		cursor: pointer;
		border-radius: 30px;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
		transition: background-color 0.3s;
		font-size: 30px;
		z-index: 9999;
	}
	#chatbot {
		width: 95%;
		height: 95%;
	}
	#chat-toggle:hover {
		background-color: #1A9987;
	}
	a {
		text-decoration: none;
		color: black;
	}
	a:hover {
		text-decoration: none;
		color:#004EA2;
	}
	select {
		background: #343c45;
		width: 150px;
		height: 35px;
		border-radius: 25px;
		text-align: center;
		border: 2px solid white;
		color: white;
		font-size: 16px;
		font-weight: bold;
	}
	option {
		font-size: 14px;
		border-radius: 10px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function viewCmenu(n) {
		document.getElementsByClassName("cmenu")[n].style.display = "block";
	}
	function hideCmenu(n) {
		document.getElementsByClassName("cmenu")[n].style.display = "none";
	}
	function viewMmenu(n) {
		document.getElementsByClassName("mmenu")[n].style.display = "block";
	}
	function hideMmenu(n) {
		document.getElementsByClassName("mmenu")[n].style.display = "none";
	}
	function viewMenu(n) {
		document.getElementById("sub").style.display = "inline-block";
		
		let menus = document.getElementsByClassName("menu");
		for (let i = 0; i < menus.length; i++) {
			menus[i].style.display = "none";
		}
		
		// 선택한 메뉴만 보이게 하기
		if (menus[n]) {
			menus[n].style.display = "flex";
		}
	}
	function hideMenu(n) {
		document.getElementById("sub").style.display = "none";
		
	}
	

</script>

<sitemesh:write property="head" />

</head>

<body>
	<header>
		<div id="section1">
			<div id="s1container">
				<div id="titleMenu">
					<div>🌎은하철도</div>
					<div style="background: #078EB9; color: white;">승차권예매</div>
					<div>기차여행</div>
				</div>
				<div id="loginMenu">
					<c:if test="${userid!=null&&userid=='administrator'}">
						<a href="../admin/index" style="color: orange;"> 관리자 홈 </a>&nbsp;&nbsp;&nbsp;
					</c:if>
					<c:if test="${userid==null}">
						<a href="../user/user" id="into"> <span class="iconmem">📋</span>회원가입 </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<!-- <a href="../login/login"> 로그인 </a>&nbsp;|&nbsp; -->
					</c:if>
					<c:if test="${userid==null}">
						<a href="/login/login"> 로그인 </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</c:if>
					<c:if test="${userid!=null&&userid!='administrator'}">
					<div id="myInfo" onmouseover="viewMmenu(0)" onmouseout="hideMmenu(0)">
						<span> ${name}님 &nbsp;&nbsp;&nbsp; </span>
						<ul class="mmenu">
							<li><a href="../user/userView">나의정보</a></li>
							<li><a href="../reserv/list">예약정보</a></li>
							<li><a href="../inquiry/myList">나의문의</a></li>
							<li><a href="../member/myRev">나의후기</a></li>
						</ul>
					</div>
					<a href="/login/logout">로그아웃</a>&nbsp;&nbsp;&nbsp;
					</c:if>
					<div id="supMenu" onmouseover="viewCmenu(0)" onmouseout="hideCmenu(0)">
						<span>고객센터</span>&nbsp;&nbsp;&nbsp;
						<ul class="cmenu">
							<li><a href="../gongji/list"> 공지사항 </a></li>
							<li><a href="../inquiry/list"> Q＆A </a></li>
							<li><a href="../promot/list"> 이벤트 </a></li>
							<li><a href="../review/list"> 여행후기 </a></li>
						</ul>
					</div>
					<div id="langMenu">
						<select>
							<option>Language</option>
							<option>KOREAN</option>
						</select>
					</div>
				</div>
				<div id="nullbox"></div>
			</div>
		</div>
		<div id="section2">
			<div id="s2container">
				<div id="logocontainer">
					<div id="logoimg">
						<a href="/main/index">
							<img src="../static/resources/ggologo(white).png" height="30px" align="middle">
						</a>
					</div>
				</div>
				<div id="nav">
					<div id="main">
						<div id="main1" onmouseover="viewMenu(0)">
							<span class="icona">🚄</span>승차권
						</div>
						<div id="main2" onmouseover="viewMenu(1)">
							<span class="iconb">🚄</span>철도역·열차
						</div>
						<div id="main3" onmouseover="viewMenu(2)">
							<span class="iconc">🚄</span>고객서비스
						</div>
						<div id="main4" onmouseover="viewMenu(3)">
							<span class="icond">🚄</span>꼬레일 멤버십
						</div>
					</div>
				</div>
				<div id="menuicon">
					<img src="../static/resources/menuicon.png" style="height: 30px;">
				</div>
			</div>
		</div>
		<div id="section3">
			<div id="sub">
				<div id="section2">
					<div id="s2container">
						<div id="logocontainer">
							<div id="logoimg">
								<a href="/main/index">
									<img src="../static/resources/ggologo(blue).png" height="30px" align="middle">
								</a>
							</div>
						</div>
						<div id="nav">
							<div id="main">
								<div id="main1" onmouseover="viewMenu(0)">
									<span class="icona">🚄</span>승차권
								</div>
								<div id="main2" onmouseover="viewMenu(1)">
									<span class="iconb">🚄</span>철도역·열차
								</div>
								<div id="main3" onmouseover="viewMenu(2)">
									<span class="iconc">🚄</span>고객서비스
								</div>
								<div id="main4" onmouseover="viewMenu(3)">
									<span class="icond">🚄</span>꼬레일 멤버십
								</div>
							</div>
						</div>
						<div id="menuicon">
							<img src="../static/resources/menuicon(b).png" style="height: 30px;">
						</div>
					</div>
				</div>
				<div id="main1" onmouseover="viewMenu(0)" onmouseout="hideMenu(0)">
					<div class="menu">
						<div id="subtitle" style="font-size: 22px; border-right: solid 1px lightgray;">승차권</div>
						<div id="submenu">
							<div><a href="../reserv/reserv">예약</a></div>
							<div><a href="../reserv/reservInfo">예약 조회</a></div>
							<div><a href="../routes/list">운행 정보</a></div>
						</div>
					</div>
				</div>
				<div id="main2" onmouseover="viewMenu(1)" onmouseout="hideMenu(1)">
					<div class="menu">
						<div id="subtitle" style="font-size: 22px; border-right: solid 1px lightgray;">철도역·열차</div>
						<div id="submenu">
							<div><a href="/main/etiquette">탑승 안내</a></div>
							<div><a href="/main/station">철도역 안내</a></div>
							<div><a href="/main/information">역 편의 시설</a></div>
							<div><a href="/main/traininformation">열차 편의시설</a></div>
						</div>
					</div>						
				</div>
				<div id="main3" onmouseover="viewMenu(2)" onmouseout="hideMenu(2)">
					<div class="menu">
						<div id="subtitle" style="font-size: 22px; border-right: solid 1px lightgray;">고객서비스</div>
						<div id="submenu">
							<div><a href="/main/csCustomer">고객센터</a></div>
							<div><a href="/main/pickup">유실물</a></div>
							<div><a href="/main/trainservice">열차 서비스</a></div>
							<div><a href="/main/free">자유 여행</a></div>
							<div><a href="/main/theme">테마 여행</a></div>
						</div>
					</div>
				</div>
				<div id="main4" onmouseover="viewMenu(3)" onmouseout="hideMenu(3)">
					<div class="menu">
						<div id="subtitle" style="font-size: 22px; border-right: solid 1px lightgray;">멤버십</div>
						<div id="submenu">
							<div><a href="/membership/membership">멤버십 소개</a></div>
							<div><a href="/membership/membershipsogae">멤버십 제휴소개</a></div>
							<div><a href="">멤버십 가입신청</a></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
<script>
	function endChat() { // 닫기 버튼
		sendMessage("상담이 종료되었습니다.");
		var endButton = document.getElementById('endChatButton');
		endButton.innerText = '닫기';
		endButton.onclick = closeAndResetChat;
	}
	
	function closeAndResetChat() { // 채팅
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "../main/resetChatHistory", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				var chatBody = document.getElementById('chat-body');
				chatBody.innerHTML = '';
				var chatConsole = document.getElementById('chat-console');
				chatConsole.style.display = 'none';
				var chatToggle = document.getElementById('chat-toggle');
				chatToggle.style.display = 'block';
				var endButton = document.getElementById('endChatButton');
				endButton.innerText = '끝내기';
				endButton.onclick = endChat;
			}
		};
		xhr.send();
	}
	
	function sendMessage(message) { // 메시지 전송 함수
		var messageInput = message || document.getElementById('chat-message').value;
		var chatBody = document.getElementById('chat-body');
		if (messageInput.trim() === "") return;
			var xhr = new XMLHttpRequest();
		xhr.open("POST", "../main/sendMessage", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				var newMessage = document.createElement('div');
				newMessage.className = "user-message";
				newMessage.textContent = messageInput;
				chatBody.appendChild(newMessage);
				document.getElementById('chat-message').value = "";
			}
		};
		xhr.send("message=" + encodeURIComponent(messageInput) + "&isAdmin=false");
	}
	
	document.addEventListener('DOMContentLoaded', function() { // Enter 키로 메시지 전송
		document.getElementById('chat-message').addEventListener('keydown', function(event) {
			if (event.key === "Enter") {
				event.preventDefault();
				sendMessage();
			}
		});
	});
	
	function toggleChat() { // 채팅 창 토글
		var chatConsole = document.getElementById('chat-console');
		var chatToggle = document.getElementById('chat-toggle');
		if (chatConsole.style.display === 'none' || chatConsole.style.display === '') {
			chatConsole.style.display = 'flex';
			chatToggle.style.display = 'none';
		}
		else {
			chatConsole.style.display = 'none';
			chatToggle.style.display = 'block';
		}
	}
	
	function pollMessages() { // 메시지 갱신
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "/main/getMessages", true);
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				var chatBody = document.getElementById('chat-body');
				var messages = JSON.parse(xhr.responseText);
				chatBody.innerHTML = '';
				messages.forEach(function(msg) {
					var newMessage = document.createElement('div');
					if (msg.startsWith('팅커벨:')) {
						newMessage.className = 'admin-message';
						newMessage.textContent = '‍💻'+ msg.replace(/^팅커벨:\s*/, '');
					}
					else {
						newMessage.className = 'user-message';
						// "손님: " 접두사를 제거하고 메시지만 출력
						newMessage.textContent = msg.replace(/^손님:\s*/, '');
					}
					chatBody.appendChild(newMessage);
				});
				pollMessages();
			}
		};
		xhr.send();
	}
	// 페이지 로드 후 메시지 요청 시작
	pollMessages();

	function goToSite(select) {
		const url = select.value;
		if(url) {
			window.open(url, "_blank");
			select.selectedIndex = 0;
		}
	}

</script>
  
	<!-- 채팅 상담 버튼 -->
	<div id="chat-toggle" onclick="toggleChat()"><img src="../static/resources/cb.png" id="chatbot"></div>
	<!-- 채팅 창 -->
	<div id="chat-console">
	<div id="chat-header">
		채팅 상담
		<button id="endChatButton" onclick="endChat()">끝내기</button>
	</div>
	<div id="chat-body"></div>
	<div id="chat-input">
		<input type="text" id="chat-message" placeholder="메시지를 입력하세요">
		<button onclick="sendMessage()">보내기</button>
	</div>
	</div>
	
<sitemesh:write property="body" />
	
	<footer>
		<div id="footerbox1">
			<div class="footer" style="color: white">
				이용약관 ㆍ 여객운송약관 및 부속약관 ㆍ 개인정보처리방침 ㆍ 이메일무단수집거부 ㆍ 저작권정책지원 ㆍ 브라우저 안내
			</div>
			<div id="social">
				<a href="https://www.youtube.com/c/%ED%95%9C%EA%B5%AD%EC%B2%A0%EB%8F%84TV" target="_blank"><img src="/static/resources/youtube.png"></a>
				<a href="https://www.facebook.com/KoreaRailroad" target="_blank"><img src="/static/resources/facebook.png"></a>
				<a href="https://www.instagram.com/korail_official_/" target="_blank"><img src="/static/resources/insta.png"></a>
				<a href="https://blog.naver.com/korailblog" target="_blank"><img src="/static/resources/blog.png"></a>
				<a href="https://x.com/korail_official" target="_blank"><img src="/static/resources/twitter.png"></a>
			</div>
		</div>
		<div id="footerbox2">
			<div class="footer-container">
				<div class="footer-info">
					<div>(주)GgoRail | 대표이사 : 철이 | 사업자등록 : 314-82-99999 | 통신판매업신고 : 은하철도-999</div>
					<div>본사 : 경기도 파주시 야당동 | TEL: 090-888-1234(유료) | 전화번호 : 010-1234-5678</div>
				</div>
				<div class="footer-logo">
					<img alt="logo" src="../static/resources/ggologo(white).png" align="top">
				</div>
			</div>
			<div id="famsite">
				<select onchange="goToSite(this)">
					<option>패밀리 사이트</option>
					<option value="http://localhost:8099/main/index">eLT항공</option>
					<option value="https://www.kobus.co.kr/main.do">코버스</option>
					<option value="https://kr.trip.com/?locale=ko-KR&curr=KRW">트립닷컴</option>
					<option value="https://www.agoda.com/ko-kr/?ds=KhSAhFMDhlLeCC8Q">아고다</option>
				</select>
			</div>
		</div>
	</footer>
	
</body>
</html>