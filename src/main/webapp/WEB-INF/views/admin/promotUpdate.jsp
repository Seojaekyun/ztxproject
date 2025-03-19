<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>프로모션 등록</title>
<style>
	body {
		background-color: #f9f9f9;
		margin: 0;
		padding: 0;
	}
	section form {
		max-width: 800px;
		margin: 50px auto;
		background-color: white;
		padding: 20px;
		box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
		border-radius: 10px;
	}
	section h2 {
		font-size: 24px;
		font-weight: bold;
		text-align: center;
		color: #333;
		margin-bottom: 20px;
	}
	section .flex-container {
		display: flex;
		justify-content: space-between;
		gap: 10px;
	}
	section .flex-item {
		display: inline-block;
		width: 48%;
	}
	section label {
		font-size: 14px;
		color: #333;
		display: block;
		margin-bottom: 10px;
		font-weight: bold;
	}
	section input[type="text"], input[type="date"], select, textarea {
		width: calc(100% - 20px);
		padding: 10px;
		margin-bottom: 20px;
		border: 1px solid #ddd;
		border-radius: 5px;
		box-sizing: border-box;
		font-size: 14px;
	}
	section textarea {
		height: 50px;
	}
	section button {
		width: 100%;
		background-color: #000A8E;
		color: white;
		border: none;
		padding: 15px;
		font-size: 16px;
		border-radius: 8px;
		cursor: pointer;
		transition: background-color 0.3s ease;
	}
	section button:hover {
		background-color: #333;
	}
</style>
<script type="text/javascript">

</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment-timezone/0.5.40/moment-timezone-with-data.min.js"></script>
</head>
<body>
<section>
	<h2>프로모션 추가</h2>
	<form action="/admin/upPromots" method="post" enctype="multipart/form-data">
	<input type="hidden" name="id" value="${pdto.id}">
	<input type="hidden" name="fname" value="${pdto.fname}">
		<div class="flex-container">
			<div class="flex-item">
				<label for="title">제목</label>
				<input type="text" id="title" name="title" value="${pdto.title }">
			</div>
			<div class="flex-item">
				<label for="title">부제</label>
				<input type="text" id="subtitle" name="subtitle" value="${pdto.subtitle }">
			</div>
			<div class="flex-item">
				<label for="fname">파일 등록</label>
				<img src="../static/resources/${pdto.fname}" width="50">
				<input type="file" id="fname" name="file">
			</div>
		</div>
		<label for="content">내용</label>
		<textarea id="content" name="content">${pdto.content }</textarea>
		<button type="submit">프로모션 등록</button>
	</form>
</section>
</body>
</html>