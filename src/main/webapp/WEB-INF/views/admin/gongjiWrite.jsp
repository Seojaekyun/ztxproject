<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<style>
	body {
		font-family: 'Noto Sans KR', sans-serif;
		background-color: #f9f9f9;
		margin: 0;
		padding: 0;
	}
	section {
		width: 90%;
		max-width: 800px;
		margin: 40px auto;
		background-color: #fff;
		padding: 20px;
		border-radius: 8px;
		box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
		text-align: center;
	}
	h3 {
		font-size: 24px;
		color: #333;
		margin-bottom: 20px;
	}
	section input[type=text], section textarea {
		width: 95%;
		max-width: 95%;
		border: 1px solid #007BFF;
		outline: none;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 16px;
		border-radius: 8px;
		padding: 10px;
		margin-bottom: 15px;
	}
	section textarea {
		height: 200px;
	}
	section input[type=submit] {
		width: 150px;
		height: 45px;
		border: none;
		background-color: #007BFF;
		color: white;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 16px;
		border-radius: 8px;
		cursor: pointer;
		transition: background-color 0.3s ease;
	}
	section input[type=submit]:hover {
		background-color: #0056b3;
	}
	section .radio-group {
		margin-bottom: 20px;
	}
	section .radio-group input[type=radio] {
		margin-right: 10px;
	}
	section .radio-group label {
		font-size: 16px;
		margin-right: 20px;
	}
	/* 반응형 디자인 */
	@media (max-width: 768px) {
		section {
			width: 95%;
			padding: 10px;
		}
		h3 {
			font-size: 20px;
		}
		section input[type=submit] {
			width: 100%;
		}
	}
</style>
</head>
<body>
	<section>
		<form method="post" action="gongjiWriteOk">
			<input type="hidden" name="writer" value="tester"><!-- 로그인 작업 후 관리자 아이디로 수정 -->
			<h3>공지사항 작성</h3>
			<div><input type="text" name="title" placeholder="제 목" required></div>
			<div><textarea name="content" placeholder="공지 내용" required></textarea></div>
			<div class="radio-group">
				<label><input type="radio" name="state" value="0" required> 일반</label>
				<label><input type="radio" name="state" value="1"> 상시</label>
				<label><input type="radio" name="state" value="2"> 필수</label>
			</div>
			<div><input type="submit" value="공지사항 등록"></div>
		</form>
	</section>
</body>
</html>
