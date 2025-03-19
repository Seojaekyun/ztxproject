<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 작성</title>
<style>
	body {
		font-family: Arial, sans-serif;
		margin: 0;
		padding: 0;
		background-color: #f4f4f4;
	}
	.container {
		max-width: 600px;
		margin: 20px auto;
		background-color: white;
		padding: 20px;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		border-radius: 8px;
	}
	h3 {
		text-align: center;
		color: #00467F;
		margin-bottom: 20px;
	}
	form {
		display: flex;
		flex-direction: column;
	}
	input, textarea {
		width: 100%;
		padding: 10px;
		margin-bottom: 15px;
		border: 1px solid #ccc;
		border-radius: 5px;
		font-size: 14px;
	}
	textarea {
		height: 150px;
		resize: none;
	}
	input[type="file"] {
		border: none;
	}
	input[type="submit"] {
		background-color: #00467F;
		color: white;
		border: none;
		cursor: pointer;
		font-size: 16px;
		padding: 10px;
		border-radius: 5px;
	}
	input[type="submit"]:hover {
		background-color: #003A66;
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
</head>
<body> <!-- review/write.jsp -->
<main>
	<div class="nullbox"></div>
	<div class="csc">여행 후기</div>
	<div class="cscmc">
		<div class="cscmenu">
		    <a href="../gongji/list">공지 사항</a>
		    <a href="../inquiry/inquiryList">Q＆A</a>
		    <a href="../promot/list">이벤트</a>
		    <a href="../review/list">여행 후기</a>
		</div>
	</div>
	<div class="container">
		<h3> 후기 작성 </h3>
		<form method="post" action="writeOk" enctype="multipart/form-data">
			<input type="text" name="title" placeholder="제 목" required>
			<input type="file" name="file">
			<textarea name="content" placeholder="공지 내용" required></textarea>
			<input type="submit" value="등록"><a href="list"><input type="button" value="취소"></a>
		</form>
	</div>
</main>
</body>
</html>
