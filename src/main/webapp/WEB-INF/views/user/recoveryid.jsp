<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
	    background-color: #f5f5f5;
	    margin: 0;
	    padding: 0;
	}
	.container {
	    width: 400px;
	    margin: 100px auto;
	    background-color: #fff;
	    border-radius: 10px;
	    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	    padding: 20px;
	}
	h1 {
	    text-align: center;
	    margin-bottom: 20px;
	}
	.form-group {
	    margin-bottom: 15px;
	}
	label {
	    display: block;
	    margin-bottom: 5px;
	}
	input[type="text"], input[type="password"] {
	    width: 100%;
	    padding: 10px;
	    border: 1px solid #ddd;
	    border-radius: 5px;
	}
	.buttons {
	    display: flex;
	    justify-content: space-between;
	}
	button {
	    padding: 10px 20px;
	    border: none;
	    border-radius: 5px;
	    cursor: pointer;
	}
	.cancel {
	    background-color: #ccc;
	}
	.confirm {
	    background-color: #007BFF;
	    color: #fff;
	}
	.note {
	    font-size: 12px;
	    margin-top: 10px;
	    color: #888;
	}
</style>
<script>
    function showPopupAndRedirect() {
        // 팝업창을 띄우고 확인을 누르면 페이지 이동
        alert("복구 신청이 완료되었습니다.");
        window.location.href = "../user/userView"; // memberView 페이지로 이동
    }
</script>
</head>
<body>
<body>
    <div class="container">
        <h1>비밀번호 확인</h1>
        <form action="/user/recoveryReq" method="post"> 
            <div class="form-group">
                <label for="userid">아이디</label>
                <input type="text" id="userid" name="userid" value="${userid}" readonly>
            </div>
            <div class="form-group">
                <label for="password">비밀번호 확인</label>
                <input type="password" id="password" name="pwd" required>
            </div>
            <div class="buttons">
                <button type="button" class="cancel" onclick="window.location.href='/cancel-url'">취소</button>
                <button type="submit" class="confirm">확인</button>
            </div>
        </form>
        <p class="note">회원님의 개인 정보를 보호하기 위해, 회원정보 변경 시 비밀번호를 재확인합니다.</p>
    </div>
</body>
</html>