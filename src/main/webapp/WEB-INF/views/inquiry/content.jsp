<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>문의 상세보기</title>
<style>
body {
	background-color: #f8f8f8;
	margin: 0;
	padding: 0;
}

.container {
	width: 1000px;
	margin: 40px auto;
	background: white;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
	text-align: center;
}

h2 {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 20px;
}

.inquiry-table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 10px;
	background: white;
}

.inquiry-table th, .inquiry-table td {
	padding: 15px;
	text-align: left;
	border-bottom: 1px solid #ddd;
	font-size: 16px;
}

.inquiry-table th {
	background: #003b8b;
	color: white;
	width: 20%;
}

.inquiry-table td {
	background: white;
}

.answer-box {
	background: #f5f5f5;
	padding: 15px;
	border-radius: 5px;
	font-size: 16px;
	margin-top: 15px;
	text-align: left;
}

.action-box {
	margin-top: 20px;
	text-align: center;
}

.pwd-input {
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	width: 200px;
}

.btn {
	display: inline-block;
	padding: 10px 15px;
	background: #003b8b;
	color: white;
	border: none;
	cursor: pointer;
	font-size: 16px;
	border-radius: 5px;
	text-decoration: none;
	margin-left: 5px;
}

.btn:hover {
	background: #005bb5;
}

.readonly {
	border: none;
	background: none;
	color: #333;
	font-size: 16px;
	width: 100%;
}

#upform, #delform {
	display: none;
}

#listbtn {
	margin-top: 10px;
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
.csc {
	background-color: #078EB9;
	color: white;
	padding: 20px;
	text-align: center;
	font-size: 24px;
	font-weight: 600;
}
.cscmc {
	width: 100%;
	background: white;
}
.cscmenu {
	width: 600px;
	display: flex;
	justify-content: space-around;
	background: white;
	padding: 10px;
	margin: auto;
}
.cscmenu a {
	color: black;
	text-decoration: none;
	font-weight: bold;
}
</style>
<script>
function validatePassword(actionUrl, correctPwd) {
    let inputPwd = document.getElementById("inputPwd").value;

    if (inputPwd !== correctPwd) {
        alert("비밀번호가 일치하지 않습니다.");
        return false; // 🚫 이동 차단
    }

    document.getElementById("actionForm").action = actionUrl;
    document.getElementById("actionForm").submit(); // ✅ 이동 허용
}
function upform() {
	document.getElementById("upform").style.display = "block";
	document.getElementById("delform").style.display = "none";
}
function delform() {
	document.getElementById("delform").style.display = "block";
	document.getElementById("upform").style.display = "none";
}

</script>
</head>
<body>
<main>
	<div class="nullbox"></div>
	<div class="csc">Q＆A</div>
		<div class="cscmc">
			<div class="cscmenu">
			    <a href="../gongji/list">공지 사항</a>
			    <a href="../inquiry/list">Q＆A</a>
			    <a href="../promot/list">이벤트</a>
			    <a href="../review/list">여행 후기</a>
			</div>
		</div>
	<section>
		<div class="container">
			<table class="inquiry-table">
				<tr>
					<th>제목</th>
					<td>${idto.title}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${idto.name}</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${idto.writeday}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${idto.content}</td>
				</tr>
			</table>
	
	
			<div class="answer-box">
				<strong>📢 관리자 답변</strong>
				<textarea class="readonly" readonly>${idto.answer ne null ? idto.answer : "답변이 등록되지 않았습니다."}</textarea>
			</div>
	
			<div class="action-box">
	
				<c:if test="${idto.userid eq 'guest'}">
					<form id="actionForm" method="get">
						<input type="hidden" name="id" value="${idto.id}">
	
	
						<div id="upform">
							<input type="password" id="inputPwd" class="pwd-input" name="pwd"
								placeholder="비밀번호 입력" required>
							<button type="button" class="btn"
								onclick="validatePassword('/inquiry/update', '${idto.pwd}')">수정</button>
						</div>
	
	
						<div id="delform">
							<input type="password" id="inputPwd" class="pwd-input" name="pwd"
								placeholder="비밀번호 입력" required>
							<button type="button" class="btn"
								onclick="validatePassword('/inquiry/delete', '${idto.pwd}')">삭제</button>
						</div>
					</form>
				</c:if>
	
	
				<c:if test="${idto.userid eq userid}">
					<a href="/inquiry/update?id=${idto.id}" class="btn">수정</a>
					<a href="/inquiry/delete?id=${idto.id}" class="btn">삭제</a>
				</c:if>
	
			</div>
			<div id="listbtn">
				<c:if test="${idto.userid eq 'guest'}">
					<input type="button" value="수정" id="upbtn" class="btn"
						onclick="upform()">
					<input type="button" value="삭제" id="delbtn" class="btn"
						onclick="delform()">
				</c:if>
				<a href="/inquiry/list"><input type="button" value="목록으로"
					class="btn"></a>
			</div>
		</div>
	</section>
</main>
</body>
</html>
