<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>
	body {
		margin: 0;
		font-family: 'Noto Sans KR', sans-serif;
		box-sizing: border-box;
	}
	header {
		width: 100%;
		background-color: gray;
		color: white;
	}
	header #first {
		display: flex;
		height: 30px;
		align-items: right;
		justify-content: flex-end;
		background-color: #001160;
		padding: 10px 20px;
		box-sizing: border-box;
		color: white;
	}
	header #one {
		flex-shrink: 0;
		font-size: 17px;
	}
	header #one a {
		text-decoration: none;
		color: white;
	}
	header #one a:hover {
		font-weight: bold;
	}
	header #second {
		display: flex;
		height: 50px;
		align-items: center;
		justify-content: space-between;
		background-color: #001160;
		padding: 10px 20px;
		box-sizing: border-box;
		color: white;
	}
	header #logo {
		display: flex;
		justify-content: space-between;
		width: 250px;
		flex-shrink: 0;
		margin-left: 10px;
		margin-bottom: 20px;
	}
	header #logo a{
		font-size: 24px;
		color: white;
		text-decoration: none;
		font-weight: bold;
	}
	header #two {
		display: flex;
		flex-grow: 1;
		justify-content: flex-start;
	}
	header #two button {
		background: none;
		border: none;
		margin: 0 10px;
		font-size: 17px;
		cursor: pointer;
		position: relative;
	}
	header #two button {
		text-decoration: none;
		color: white;
	}
	header #two button:hover {
		font-weight: bold;
	}
    #chatbot {
		width: 95%;
		height: 95%;
	}
    #chatToggleBtn {
        position: fixed;
        bottom: 20px;
        right: 20px;
        background-color: #23297A;
        color: white;
        border: none;
        cursor: pointer;
        font-size: 16px;
        border-radius: 50%;
        display: flex; /* 알림 아이콘 위치를 위해 flex로 설정 */
        align-items: center; /* 버튼과 알림 아이콘 정렬 */
        height:50px;
        width:50px;
        z-index: 2000;
    }
	#chatToggleBtn:hover {
		background-color: #2DD1C5;
	}
	#chatAlert {
        position: absolute;
        top: 0;
        right: 0;
        width: 12px;
        height: 12px;
        background-color: #00FF00; /* 연두색 */
        border-radius: 50%;
        display: hidden;
        z-index: 10;
    }
	/* 채팅 상담 UI 스타일 */
	#chat-console {
		width: 300px;
		height: 400px;
		border: 2px solid #2DD1C5;
		position: fixed;
		bottom: 20px; /* 버튼 위로 올리기 */
		right: 20px;
		background-color: #fff;
		display: none; /* 기본적으로 채팅 창을 숨김 */
		flex-direction: column;
		z-index: 2100;
	}
	#chat-header {
		background-color: #2DD1C5;
		color: white;
		padding: 10px;
		text-align: center;
		font-weight: bold;
		cursor: pointer;
		position: relative;
	}
	#chat-header button {
		position: absolute;
		top: 10px;
		right: 10px;
		background-color: red;
		color: white;
		border: none;
		padding: 5px;
		cursor: pointer;
		font-size: 12px;
		border-radius: 5px;
	}
	#chat-body {
		flex: 1;
		padding: 10px;
		overflow-y: auto;
	}
	#chat-body .message {
		margin-bottom: 10px;
	}
	#chat-body .user-message {
		color: black;
		text-align: left;
	}
	#chat-body .admin-message {
		color: blue;
		text-align: right;
	}
	#chat-input {
		display: flex;
		padding: 10px;
	}
	#chat-input input[type="text"] {
		flex: 1;
		padding: 5px;
	}
	#chat-input button {
		padding: 5px 10px;
		background-color: #23297A;
		color: white;
		border: none;
		cursor: pointer;
	}
</style>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>

</script>
	<sitemesh:write property="head"/>
</head>
<body>

	<header>
		<div id="first">
			<div id="one">
				<a href="../main/index">홈페이지</a>&nbsp;&nbsp;|&nbsp;&nbsp;    
				<a href="../login/logout">로그아웃</a>
			</div>
		</div>
		<div id="second">
			<div id="logo">
				<div id="logoimg">
					<a href="../admin/index">
						<img src="../static/resources/train(white).png" height="70px" align="middle">
					</a>
				</div>
				<div id="logotext">
					<a href="../admin/index">
						Let's GGoRail				
						Administrator
					</a>
				</div>
			</div>
			<div id="two">
				<button onclick="location.href='reservList'">예약현황</button>
				<button onclick="location.href='gongjiList'">공지사항</button>
				<button onclick="location.href='inquiryList'">고객문의</button>
				<button onclick="location.href='memberList'">회원관리</button>
				<button onclick="location.href='flightsList'">운행일정</button>
				<button onclick="location.href='promotList'">프로모션</button>
				<button onclick="location.href='rsvChart'">예약통계</button>
			</div>

		</div>
	</header>

	<!-- 채팅 상담 버튼 -->
	<div>
	<button id="chatToggleBtn">
		<img src="../static/resources/cb.png" id="chatbot">
		<div id="chatAlert"></div>
	</button>
	</div>
	<!-- 관리자 채팅 상담 UI -->
	<div id="chat-console">
		<div id="chat-header">
			채팅 상담
			<button onclick="closeChat()">끝내기</button>
		</div>
		<div id="chat-body"></div>
		<div id="chat-input">
			<input type="text" id="chat-message" placeholder="답변을 입력하세요">
			<button onclick="sendMessage()">보내기</button>
		</div>
	</div>
<script>
	// 채팅 창 열기/닫기
	document.getElementById('chatToggleBtn').addEventListener('click', function() {
		var chatConsole = document.getElementById('chat-console');
		chatConsole.style.display = chatConsole.style.display === 'none' ? 'flex' : 'none';
		document.getElementById('chatAlert').style.display = 'none'; // 새로운 메시지 알림 숨기기
	});
	
	function closeChat() {
		document.getElementById('chat-console').style.display = 'none'; // 채팅 창 닫기
	}
	
	// 메시지 전송 함수 (관리자 페이지)
	function sendMessage(message, callback) {
		var messageInput = message || document.getElementById('chat-message').value;
		var chatBody = document.getElementById('chat-body');
		
		if (messageInput.trim() === "") {
			return; // 빈 메시지는 전송하지 않음
		}
		
		// AJAX 요청을 통해 서버에 메시지 전송
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "../main/sendMessage", true);  // Controller 경로로 요청
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				var newMessage = document.createElement('div');
				newMessage.className = "admin-message"; // 관리자로 구분
				newMessage.textContent = "팅커벨: " + messageInput;
				chatBody.appendChild(newMessage);
				
				// 입력 창 비우기 (상담 종료 메시지가 아니면)
				if (!message) {
					document.getElementById('chat-message').value = "";
				}
			}
		};
		xhr.send("message=" + encodeURIComponent(messageInput) + "&isAdmin=true");
	}
	
	// Enter 키로 메시지 전송 (keydown 이벤트 추가)
	document.getElementById('chat-message').addEventListener('keydown', function(event) {
		if (event.key === "Enter") {
			event.preventDefault();  // 기본 엔터키 동작(줄바꿈) 방지
			sendMessage();  // 메시지 전송 함수 호출
		}
	});
	
	// 새 메시지가 왔을 때 알림을 표시하는 함수
	function showNewMessageAlert() {
		var chatConsole = document.getElementById('chat-console');
		console.log('새 메시지 알림 표시'); // 디버깅용 로그
        // 채팅창이 열려 있지 않은 경우에만 알림을 표시
        if (chatConsole.style.display === 'none') {
			document.getElementById('chatAlert').style.display = 'block'; // 알림 표시
		}
	}
	
	// 기존 메시지와 새 메시지를 비교하여 새 메시지가 있을 때 알림을 표시
	var previousMessages = [];  // 이전 메시지 저장
	
	function pollMessages() {
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
						newMessage.textContent = msg.replace(/^팅커벨:\s*/, '');
					}
					else {
						newMessage.className = 'user-message';
						newMessage.textContent = '🚶' + msg.replace(/^손님:\s*/, '');
					}
					chatBody.appendChild(newMessage);
				});
				
				// 새 메시지가 이전 메시지와 다른 경우 알림을 표시
				if (JSON.stringify(previousMessages) !== JSON.stringify(messages)) {
					console.log('새 메시지가 감지되었습니다.'); // 디버깅용 로그
					showNewMessageAlert();  // 새로운 메시지 알림 표시
					previousMessages = messages;  // 이전 메시지 업데이트
				}
				
				// 일정 주기로 메시지를 갱신
				pollMessages();
				/* setTimeout(pollMessages, 5000); */
			}
		};
		xhr.send();
	}
	
	// 페이지 로드 후 메시지 요청 시작
	pollMessages();
	
</script>

<sitemesh:write property="body"/>
</body>
</html>