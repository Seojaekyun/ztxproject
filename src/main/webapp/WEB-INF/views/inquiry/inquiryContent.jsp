<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>문의 상세보기</title>
<style>
    body {
        font-family: 'Noto Sans KR', sans-serif;
        background-color: #f8f8f8;
        margin: 0;
        padding: 0;
        text-align: center;
    }

    /* 메인 컨테이너 */
    .container {
        width: 1000px;
        margin: 40px auto;
        background: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    }

    h2 {
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 20px;
    }

    /* 테이블 스타일 */
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

    /* 답변칸 */
    .answer-box {
        background: #f5f5f5;
        padding: 15px;
        border-radius: 5px;
        font-size: 16px;
        margin-top: 15px;
        text-align: left;
    }

    /* 비밀번호 입력 및 버튼 정렬 */
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

    /* 버튼 스타일 */
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

    /* readonly 스타일 */
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

<div class="container">
    <h2>문의 상세보기</h2>

    <table class="inquiry-table">
        <tr><th>제목</th><td>${idto.title}</td></tr>
        <tr><th>작성자</th><td>${idto.name}</td></tr>
        <tr><th>작성일</th><td>${idto.writeday}</td></tr>
        <tr><th>내용</th>
        <td>${idto.content}</td></tr>
    </table>

    <!-- 답변이 있으면 출력, 없으면 "답변이 등록되지 않았습니다." -->
    <div class="answer-box">
        <strong>📢 관리자 답변</strong>
        <textarea class="readonly" readonly>${idto.answer ne null ? idto.answer : "답변이 등록되지 않았습니다."}</textarea>
    </div>

    <div class="action-box">
        <!-- 🚀 비회원일 경우 비밀번호 입력 후 수정/삭제 가능 -->
        <c:if test="${idto.userid eq 'guest'}">
            <form id="actionForm" method="get">
                <input type="hidden" name="id" value="${idto.id}">
				
                <!-- 수정 -->
                <div id="upform">
	                <input type="password" id="inputPwd" class="pwd-input" name="pwd" placeholder="비밀번호 입력" required>
	                <button type="button" class="btn" onclick="validatePassword('/inquiry/inquiryUpdate', '${idto.pwd}')">수정</button>
				</div>
				
                <!-- 삭제 -->
                <div id="delform">
	                <input type="password" id="inputPwd" class="pwd-input" name="pwd" placeholder="비밀번호 입력" required>
	                <button type="button" class="btn" onclick="validatePassword('/inquiry/inquiryDelete', '${idto.pwd}')">삭제</button>
                </div>
            </form>
        </c:if>

        <!-- 🚀 회원일 경우 비밀번호 없이 수정 가능 -->
        <c:if test="${idto.userid eq userid}">
            <a href="/inquiry/inquiryUpdate?id=${idto.id}" class="btn" >수정</a>
            <a href="/inquiry/inquiryDelete?id=${idto.id}" class="btn">삭제</a>
        </c:if>

    </div>
    <div id="listbtn">
    <c:if test="${idto.userid eq 'guest'}">
    	<input type="button" value="수정" id="upbtn" class="btn" onclick="upform()">
		<input type="button" value="삭제" id="delbtn" class="btn" onclick="delform()">
	</c:if>
    	<a href="/inquiry/inquiryList"><input type="button" value="목록으로" class="btn"></a>
    </div>
</div>

</body>
</html>
