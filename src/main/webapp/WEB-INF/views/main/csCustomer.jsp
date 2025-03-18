<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>꼬레일 고객센터</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
	body {
		margin: 0;
		padding: 0;
		background-color: #f4f4f4;
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
	.csccont {
		max-width: 900px;
		margin: 20px auto;
		background: white;
		padding: 20px;
		box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
		border-radius: 5px;
	}
	.content {
		padding: 20px;
	}
</style>
</head>
<body>
	<div class="csc">고객센터</div>
	<div class="cscmc">
		<div class="cscmenu">
		    <a href="../gongji/list">공지 사항</a>
		    <a href="../inquiry/inquiryList">Q＆A</a>
		    <a href="#">이벤트</a>
		    <a href="../review/list">여행 후기</a>
		</div>
	</div>
	<div class="csccont">
		<div class="content">
			<h2>안내 사항</h2>
			<p>코레일 고객센터에 오신 것을 환영합니다. 궁금하신 사항을 검색하거나 고객센터에 문의해 주세요.</p>
		</div>
	</div>
</body>
</html>