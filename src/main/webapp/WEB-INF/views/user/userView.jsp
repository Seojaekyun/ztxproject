<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<style>
	body {
		font-family: Arial, sans-serif;
		background-color: #f8f8f8;
		margin: 0;
		padding: 20px;
	}
	section {
		width: 1000px;
		margin: 0 auto;
		padding: 20px;
		background-color: white;
		border-radius: 15px;
		box-shadow: 0 4px 12px rgba(0,0,0,0.1);
	}
	.profile-header {
		display: flex;
		flex-direction: column;
		background-color: #f0f4f8;
		padding: 20px;
		border-radius: 10px;
		margin-bottom: 30px;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	}
	.profile-info {
		display: flex;
		align-items: flex-start;
		background-color: white;
		border-radius: 10px;
		padding: 20px;
		margin-bottom: 20px;
		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	}
	.etc_aligner {
		display: flex;
		align-items: flex-start;
		background-color: white;
		border-radius: 10px;
	}
	.profile-divider {
		width: 1px;
		height: 121px;
		background-color: #ccc; /* 세로선 색상 */
		margin: 0 10px; /* 세로선 좌우 여백 */
	}
	.txt-divider {
		width: 98%;
		height: 1px;
		background-color: #ccc; /* 세로선 색상 */
		margin: 0 10px; /* 세로선 좌우 여백 */
		margin-bottom:10px;
	}
	.profile-item {
		width: 50%;
		padding: 10px;
		text-align: left;
		margin-bottom: 12px;
	}
	.profile-divider {
		border-left: 2px solid #ccc; /* 두 블럭 사이에 세로선 추가 */
	}
	.email{
		width: 50%;
		margin-right: 10px;
	}
	.email_aligner{
		display: flex;
		justify-content: space-around;
		align-items: center;
	}
	.phone{
		width: 50%;
		margin-right: 10px;
		border-left: 1px solid lightgray;
	}
	.phone_aligner{
		display: flex;
		justify-content: space-around;
		align-items: center;
	}
	.profile-header h2 {
		font-size: 20px;
		margin-bottom: 8px;
		color: #333;
		font-weight: bold;
	}
	.profile-header span {
		font-size: 16px;
		color: #555;
		display: block;
	}
	.section-box {
		background-color: white;
		padding: 20px;
		margin-bottom: 20px;
		border-radius: 10px;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		width: 100%;
	}
	.section-box h3 {
		font-size: 18px;
		margin-bottom: 15px;
		font-weight: bold;
	}
	.section-box p {
		margin-bottom: 15px;
		font-size: 14px;
		color: #666;
	}
	.section-box input[type=text], .section-box input[type=password] {
		width: calc(100% - 20px);
		padding: 12px;
		margin-bottom: 10px;
		border: 1px solid #ccc;
		border-radius: 5px;
	}
	.section-box input[type=submit] {
		width: 95%;
		padding: 12px;
		background-color: #0078D7;
		color: white;
		border: none;
		border-radius: 5px;
		cursor: pointer;
		font-size: 16px;
		transition: background-color 0.3s ease;
	}
	#submit {
		width: 98%;
		padding: 12px;
		background-color: #0078D7;
		color: white;
		border: none;
		border-radius: 5px;
		cursor: pointer;
		font-size: 16px;
		transition: background-color 0.3s ease;
	}
	.section-box input[type=submit]:hover {
		background-color: #005bb5;
	}
	.section-box button {
		width: 100px;
		padding: 10px;
		margin-top: 10px;
		background-color: #0078D7;
		color: white;
		border: none;
		border-radius: 5px;
		cursor: pointer;
		font-size: 14px;
	}
	.section-box button:hover {
		background-color: #005bb5;
	}
	.delete_id {
		display: flex;
    	justify-content: flex-end;
	}

</style>
<script>
	var mychk = 0;
	function pwdChg(my) {
		if (mychk % 2 == 0) {
			document.getElementById("pwdChg").style.display = "block";
			my.innerHTML = "<b>비밀번호 변경취소</b>";  // 텍스트를 굵게
		}
		else {
			document.getElementById("pwdChg").style.display = "none";
			my.innerHTML = "<b>비밀번호 변경</b>";  // 텍스트를 굵게
		}
		mychk++;
	}
	
	var mychk2=0;
	function emailTwo(my) {
		if(mychk2 % 2 == 0) {
			document.getElementById("emailTwo").style.display="block";
			my.innerHTML = "<b>이메일 수정취소</b>";
		}
		else {
			document.getElementById("emailTwo").style.display="none";
			my.innerHTML = "<b>이메일 수정</b>";
		}
		mychk2++;
	}
	
	var mychk3=0;
	function phoneTwo(my) {
		if(mychk3 % 2 == 0) {
			document.getElementById("phoneTwo").style.display="block";
			my.innerHTML = "<b>연락처 수정취소</b>";
		}
		else {
			document.getElementById("phoneTwo").style.display="none";
			my.innerHTML = "<b>연락처 수정</b>";
		}
		mychk3++;
	}
	
	function pwdCheck() {
		var pwd = document.mform.pwd.value;
		var pwd2 = document.mform.pwd2.value;
		
		if (pwd == pwd2) {
			document.getElementById("pmsg").innerText = "비밀번호가 일치합니다";
			document.getElementById("pmsg").style.color = "blue";
			document.getElementById("pmsg").style.fontSize="12px";
			pchk = 1;
		}
		else {
			document.getElementById("pmsg").innerText = "비밀번호가 일치하지 않습니다";
			document.getElementById("pmsg").style.color = "red";
			document.getElementById("pmsg").style.fontSize="12px";
			pchk = 0;
		}
	}
	
	window.onload = function() {
		var message = "<c:out value='${message}' />";   // FlashAttribute로 전달된 메시지 확인
		if (message.trim() !== "") {
			alert(message);  // 팝업 메시지 출력
		}
	}
	
</script>
</head>
<body> 
 <section>
    <!-- 상단 회원 정보 -->
    <div class="profile-header">
		<div class="profile-info">
			<div class="profile-item">
				<h2>성명</h2>
				<span>${udto.name}</span>
			</div>
			<div class=profile-divider></div>
			<div class="profile-item">
				<h2>아이디</h2>
				<span>${udto.userid}</span>
			</div>
		</div>
        <!-- 비밀번호 변경 -->
		<div class="section-box">
			<h3>비밀번호</h3>
			<p>회원님의 소중한 개인정보 보호를 위해 비밀번호를 주기적으로 변경해 주세요.</p>
			<span style="font-size:14px;cursor:pointer;" onclick="pwdChg(this)">
				<c:if test="${err == null}"><b>비밀번호 변경</b></c:if>
				<c:if test="${err == 1}"><b>비밀번호 변경취소</b></c:if>
			</span>
			<div id="pwdChg" style="display:none; margin-top:10px;">
				<form name="mform" method="post" action="pwdChg">
				<input type="password" name="oldPwd" placeholder="기존 비밀번호"><br>
				<input type="password" name="pwd" placeholder="새 비밀번호" onkeyup="pwdCheck()"><br>
				<input type="password" name="pwd2" placeholder="새 비밀번호 확인" onkeyup="pwdCheck()"><br>
				<br> <span style="margin-bottom: 15px; margin-top: -25px;" id="pmsg"></span>
				<input id="submit" type="submit" value="비밀번호 변경">
				</form>
			</div>
		</div>
		<!-- 기본정보 수정 -->
		<div class="section-box">
			<h3>기본정보</h3>
			<p>이메일, 연락처 정보를 변경할 수 있습니다.</p>
			<div class=txt-divider></div>
			<div class="etc_aligner">
				<div class="email">
					<div id="emailOne" class="email_aligner">
						<span>${udto.email}</span>  
						<span style="font-size:14px;cursor:pointer;" onclick="emailTwo(this)">
							<c:if test="${err == null}"><b>이메일 수정</b></c:if>
							<c:if test="${err == 1}"><b>이메일 수정취소</b></c:if>
						</span>
					</div>
					<div id="emailTwo" class="email_aligner" style="display:none;margin-top:10px;">
						<form method="post" action="emailEdit">
						<input type="text" name="email" value="${udto.email}">
						<input type="submit" value="수정">
						</form>
					</div>
				</div>
				<div class="phone">
					<div id="phoneOne" class="phone_aligner">
						<span>${udto.phone}</span> 
						<span style="font-size:14px;cursor:pointer;" onclick="phoneTwo(this)">
							<c:if test="${err == null}"><b>연락처 수정</b></c:if>
							<c:if test="${err == 1}"><b>연락처 수정취소</b></c:if>
						</span>
					</div>
					<div id="phoneTwo" class="phone_aligner" style="display:none;margin-top:10px;">
						<form method="post" action="phoneEdit">
						<input type="text" name="phone" value="${udto.phone}">
						<input type="submit" value="수정">
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="delete_id">
			<c:choose>
			<c:when test="${udto.level == 0 || udto.level == 1 || udto.level == 2 || udto.level == 6}">
			<a href="../user/reqOut"><input type="button" value="탈퇴신청" id="outbtn"></a>
			</c:when>
			<c:when test="${udto.level == 3}">
			<span>탈퇴승인중 | <a href="../user/recoveryid"><input type="button" value="탈퇴취소" id="outbtn"></a></span>
			</c:when>
			<c:when test="${udto.level == 5}">
			<span>복구승인중 | <a href="../user/reqOut">탈퇴 신청 ></a></span>
			</c:when>
			</c:choose>
		</div>
    </div>
</section>

</body>
</html>
