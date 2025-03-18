<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이벤트</title>
<style>
	body {
		font-family: Arial, sans-serif;
		margin: 0;
		padding: 0;
		background-color: #f4f4f4;
	}
	section header {
		background-color: #00467F;
		padding: 20px;
		text-align: center;
		color: white;
	}
	section header h1 {
		margin: 0;
		font-size: 24px;
	}
	section nav {
		background-color: #0059A3;
		padding: 10px;
		text-align: center;
	}
	section nav a {
		color: white;
		margin: 0 15px;
		text-decoration: none;
		font-size: 16px;
		transition: color 0.3s ease;
	}
	section nav a:hover {
		text-decoration: underline;
		color: #FFD700;
	}
	.container {
		max-width: 1200px;
		margin: 30px auto;
		background-color: white;
		padding: 30px;
		box-shadow: 0 4px 16px rgba(0, 0, 0, 0.2);
		border-radius: 8px;
	}
	.content h2 {
		font-size: 26px;
		color: #00467F;
		margin-bottom: 20px;
		text-align: center;
		border-bottom: 2px solid #ddd;
		padding-bottom: 10px;
	}
	.event-title {
		font-size: 22px;
		font-weight: bold;
		color: #333;
		margin-bottom: 10px;
		text-align: center;
	}
	.event-meta {
		font-size: 14px;
		color: #777;
		margin-bottom: 20px;
		text-align: center;
	}
	.event-content {
		font-size: 16px;
		color: #555;
		line-height: 1.8;
		white-space: pre-wrap;
		padding: 20px;
		background-color: #fafafa;
		border-left: 4px solid #00467F;
		border-radius: 4px;
	}
	.event-content img {
		display: block;
		max-width: 100%;
		height: auto;
		margin: 20px auto;
	}
	.cta-button {
		display: inline-block;
		padding: 12px 24px;
		background-color: #00467F;
		color: white;
		text-decoration: none;
		border-radius: 5px;
		margin-top: 30px;
		transition: background-color 0.3s ease, transform 0.2s ease;
	}
	.cta-button:hover {
		background-color: #003A66;
		transform: translateY(-2px);
		}
	/* 반응형 디자인 */
	@media (max-width: 768px) {
		.container {
			padding: 20px;
		}
		.content h2 {
			font-size: 22px;
		}
		.event-title {
			font-size: 20px;
		}
		.cta-button {
			width: 100%;
			text-align: center;
		}
	}
</style>
</head>
<body>

<section>
	<header>
		<h1>이벤트</h1>
	</header>
	<nav>
		<a href="eventList">전체 이벤트</a>
        <a href="ongoingEvents">진행 중인 이벤트</a>
        <a href="pastEvents">지난 이벤트</a>
        <a href="faq">FAQ</a>
	</nav>
	<div class="container">
		<div class="content">
		<h2>이벤트 상세</h2>
			<div class="event-title">
				<c:out value="${pdto.title}" />
			</div>
			<div class="event-meta">
				조회수: <c:out value="${pdto.readnum}" />
			</div>
			<div class="event-content">
				<img src="../static/resources/${pdto.fname}" alt="이벤트 이미지">
				<c:out value="${pdto.content}" escapeXml="false" />
			</div>
			<div style="text-align: center;">
				<a class="cta-button" href="list">목록으로</a>
			</div>
		</div>
	</div>
</section>

</body>
</html>