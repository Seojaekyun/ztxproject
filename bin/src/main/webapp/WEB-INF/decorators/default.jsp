<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>MonoRail - ZTX</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ko.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Hahmlet:wght@100..900&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Gugi&family=Hahmlet:wght@100..900&display=swap');
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}
	body {
		margin: auto;
		font-family: Arial, sans-serif;
	}
	header {
		width: 100%;
		margin: auto;
	}
	#section1 {
		width: 1450px;
		min-width: 1000px;
		height: 30px; /* Adjust the height as needed */
		position: relative;
		max-width: 1900px;
		margin: auto;
	}
	#section1 #loginMenu {
		position: absolute ;
		top: 0;
		right: 0;
		margin-right: 9%; /* Adjust if necessary */
		display: flex;
		text-align: right;
		font-size: 14px;
		font-weight: 600;
		line-height: 30px;
	}
	#section1 #loginMenu a {
		text-decoration: none;
		color: black;
	}
	#section1 #loginMenu a:hover {
		text-decoration: none;
		color: #00467F;
	}
	#section1 #loginMenu ul {
		list-style-type: none;
		margin: 0;
		padding: 10px;
		display: flex;
		align-items: right;
	}
	#section1 #loginMenu ul li {
		position: relative;
	}
	#section1 #loginMenu .cmenu, #section1 #loginMenu .mmenu {
		padding-left: 0;
		position: absolute;
		left: -10px;
		top: 17px;
		background: white;
		display: none;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		z-index: 10;
		border-radius:5px;
	}
	#section1 #loginMenu .cmenu > li, #section1 #loginMenu .mmenu > li {
		list-style-type: none;
		width: 100px;
		height: 35px;
		line-height: 35px;
		text-align: center;
		cursor: pointer;
		font-size: 14px;
	}
	#section1 #loginMenu .cmenu > li:hover,  #section1 #loginMenu .mmenu > li:hover {
		text-decoration: none;
		color: #00467F;
	}
	#section1 #loginMenu #supMenu, #section1 #loginMenu #myInfo {
		position: relative;
	}
	/* Center the nav at the bottom */
	#section1 #nav {
		position: absolute;
		bottom: 0 !important;
		left: 40%;
		transform: translateX(-50%);
		z-index: 2000;
		max-width: 1000px;
	}
	#section1 nav {
		display: flex;
		line-height: 30px !important;
		font-family: Arial, sans-serif;
		font-size: 16px;
	}
	#section1 nav a {
		text-decoration: none;
	}
	#section1 nav a:hover {
		text-decoration: none;
		color: #00467F;
	}
	#logo {
		width: 100%;
		min-width: 1000px;
		height: 50px;
		background: #083B82;
		align-items: center;
	}
	#logocontainer {
		margin: auto;
		max-width: 1200px;
		min-width: 1000px;
		height: 50px;
		background: none;
		align-items: left;
		display: flex;
	}
	#logo > #logocontainer > #logoimg {
		width: 50px;
		height: 50px;
		background: #083B82;
	}
	#logo > #logocontainer > #logotext {
		height: 50px;
		width: 200px;
		background: #083B82;
		font-size: 25px;
		font-weight: 900;
		line-height: 50px;
	}
	#logotext a {
		text-decoration: none;
		color: white;
	}
	#section2 {
		width: 100%;
		min-width: 1000px;
		height: 60px; /* Adjust the height as needed */
		position: relative;
		max-width: 1900px;
		margin: auto;
	}
	#section2 nav #main {
		line-height:70px;
		margin: auto; /* Adjusted to align properly */
		text-align: center;
	}
	#section2 nav #main > li {
		display: inline-block;
		list-style-type: none;
		width: 180px;
		height: 30px !important;
		padding: 0 20px 0 0; 
		line-height: 30px !important;
		text-align: left;
		font-size: 18px;
		font-weight: 750;
		position: relative;
		z-index: 5;
	}
	#section2 nav #main > li > .menu {
		padding-left: 0px;
		position: absolute;
		left: 0px;
		top: 29px;
		background: white;
		visibility: hidden;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		border-radius:5px;
		z-index: 2000;
	}
	#section2 nav #main > li > a{
		text-decoration: none;
		color: black;
	}
	#section2 nav #main > li > .menu > li {
		list-style-type: none;
		width: 150px;
		height: 40px;
		line-height: 40px;
		padding-left: 30px;
		font-size: 14px;
		font-weight: 600;
		z-index: 2000;
	}
	#section2 nav #main > li > .menu > li > a{
		text-decoration: none;
		color: black;
	}
	hr {
		color: blue;
	}
	/* #login {
		position: absolute;
		bottom: 0;
		left: 0;
		margin-left: 83%;
		margin-bottom: 10px;
	}
	#loginbtn {
		width: 120px;
		padding: 10px;
		border-radius: 20px;
		background: #1f0c59;
		color: white;
		font-size: 15px;
	}
	#loginbtn:hover {
		cursor: pointer;
	} */
	footer {
		width: 100%;
		min-width: 1200px;
		height: 50px;
		background: lightgray;
		color: #5F6368;
		text-align: center;
		font-family: 'Hahmlet';
		font-size: 10px;
		margin-top: 40px;
	}
	.footer-container {
		display: flex;
		justify-content: space-around;
		align-items: center;
		min-width: 1000px;
		max-width: 1200px;
		margin: auto;
		flex-wrap: wrap;
	}
	.footer-logo {
		font-size: 25px;
		line-height: 50px;
		font-weight: 900;
		font-family: Arial, sans-serif;
	}
	.footer-logo img {
		height: 50px;
	}
	#logof {
		width: 100%;
		min-width: 1000px;
		height: 50px;
		background: lightgray;
		align-items: center;
		display: flex;
	}
	#logof > #logotext {
		height: 50px;
		width: 200px;
		background: lightgray;
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
		background: #083B82;
		color: white !important;
		text-align: center;
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
		font-family: Arial, sans-serif;
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
		font-family: Arial, sans-serif;
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
		document.getElementsByClassName("menu")[n].style.visibility = "visible";
	}
	function hideMenu(n) {
		document.getElementsByClassName("menu")[n].style.visibility = "hidden";
	}

</script>

<sitemesh:write property="head" />

</head>

<body>
	<header>
		<div id="section1">
			<div id="loginMenu">
				<c:if test="${userid!=null&&userid=='administrator'}">
					<a href="../admin/index" style="color: orange;"> 관리자 홈 </a>&nbsp;|&nbsp;
				</c:if>
				<c:if test="${userid==null}">
					<a href="../user/user" id="into"> <span class="iconmem">📋</span>회원가입 </a>&nbsp;&nbsp;|&nbsp;&nbsp;
					<!-- <a href="../login/login"> 로그인 </a>&nbsp;|&nbsp; -->
				</c:if>
				<c:if test="${userid==null}">
					<a href="../login/login"> 로그인 </a>&nbsp;&nbsp;|&nbsp;&nbsp;
				</c:if>
				<c:if test="${userid!=null&&userid!='admin'}">
				<div id="myInfo" onmouseover="viewMmenu(0)" onmouseout="hideMmenu(0)">
					<span> ${name}님 &nbsp;|&nbsp; </span>
					<ul class="mmenu">
						<li><a href="../user/userView">나의정보</a></li>
						<li><a href="../reserv/list">예약정보</a></li>
						<li><a href="../inquiry/inquiryMyList">나의문의</a></li>
						<li><a href="../member/myRev">나의후기</a></li>
					</ul>
				</div>
				<a href="../login/logout">로그아웃</a>&nbsp;|&nbsp;
				</c:if>
				<div id="supMenu" onmouseover="viewCmenu(0)" onmouseout="hideCmenu(0)">
					<span>고객센터</span>
					<ul class="cmenu">
						<li><a href="../gongji/list"> 공지사항 </a></li>
						<li><a href="../inquiry/inquiryList"> Q＆A </a></li>
						<li><a href="../promot/list"> 이벤트 </a></li>
						<li><a href="../review/list"> 여행후기 </a></li>
					</ul>
				</div>
			</div>
		</div>
		<div id="logo">
			<div id="logocontainer">
				<div id="logoimg">
					<a href="../main/index">
						<img src="../static/resources/train(white).png" height="50px" align="middle">
					</a>
				</div>
				<div id="logotext">
					<a href="../main/index">
						Let's GGoRail
					</a>
				</div>
			</div>
		</div>
		<div id="section2">
			<div id="nav">
				<nav>
					<ul id="main">
						<li id="main1" onmouseover="viewMenu(0)" onmouseout="hideMenu(0)">
							<span class="icona">🚄</span>승차권
							<ul class="menu">
								<li><a href="../reserv/reservation">예약</a></li>
								<li><a href="../reserv/reserveInfo">예약 조회</a></li>
								<li><a href="../reserv/routeList">운행 정보</a></li>
							</ul>
						</li>
						<li id="main2" onmouseover="viewMenu(1)" onmouseout="hideMenu(1)">
							<a href="../guide/checkinGuide"><span class="iconb">🚄</span>철도역·열차</a>
							<ul class="menu">
								<li><a href="../guide/boardingGuide">탑승 안내</a></li>
								<li><a href="../guide/seatGuide">좌석 안내</a></li>
								<li><a href="../guide/baggageGuide">수하물 안내</a></li>
							</ul>
						</li>
						<li id="main3" onmouseover="viewMenu(2)" onmouseout="hideMenu(2)">
							<a href="../guide/travel"><span class="iconc">🚄</span>여행상품</a>
							<ul class="menu">
								<li><a href="">여행 명소</a></li>
								<li><a href="">테마 여행</a></li>
							</ul>
						</li>
						<li id="main4" onmouseover="viewMenu(3)" onmouseout="hideMenu(3)">
							<a href="../guide/travel"><span class="icond">🚄</span>고객서비스</a>
							<ul class="menu">
								<li><a href="">고객센터</a></li>
								<li><a href="">유실물</a></li>
								<li><a href="">열차 서비스</a></li>
							</ul>
						</li>
						<li id="main5" onmouseover="viewMenu(4)" onmouseout="hideMenu(4)">
							<span class="icone">🚄</span>꼬레일 멤버십
							<ul class="menu">
								<li><a href="">멤버십 소개</a></li>
								<li><a href="">멤버십 가입신청</a></li>
							</ul>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	<hr>
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
		<div class="footer-container">
			<div class="footer-logo">
				<img alt="logo" src="../static/resources/train(gray).png" align="top">
				Let's GGoRail
			</div>
			<div class="footer-info">
				<div>(주)MonoRail</div>
			</div>
			<div class="footer-info">
				<div>대표이사 : 철이</div>
			</div>
			<div class="footer-info">
				<div>사업자등록 : 314-82-99999</div>
			</div>
			<div class="footer-info">
				<div>통신판매업신고 : 은하철도-999</div>
			</div>
			<div class="footer-info">
				<div>본사 : 경기도 파주시 야당동</div>
			</div>
			<div class="footer-info">
				<div>TEL: 090-888-1234(유료)</div>
			</div>
			<div class="footer-info">
				<div>전화번호 : 010-1234-5678</div>
			</div>
		</div>
	</footer>
	<div class="footer" style="color: white">
		<p>&copy; 2025 꼬레일. 모든 권리 보유.</p>
	</div>
</body>
</html>