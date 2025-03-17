<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<style>
	body {
		font-family: 'Noto Sans KR', sans-serif;
		background-color: #f9f9f9;
		margin: 0;
		padding: 0;
	}
	h3 {
		font-size: 24px;
		color: #333;
		border-bottom: 2px solid #4CAF50;
		padding-bottom: 10px;
		margin-bottom: 20px;
		text-align: center;
		width: 90%;
		max-width: 600px;
		margin: 50px auto 20px;
	}
	table {
		width: 90%;
		max-width: 600px;
		margin: 0 auto 20px;
		border-collapse: collapse;
	}
	table th, table td {
		border: 1px solid #ddd;
		padding: 8px;
		text-align: left;
		vertical-align: top;
	}
	table th {
		background-color: #f4f4f4;
		font-weight: 600;
		width: 150px;
		text-align: center;
	}
	table td {
		background-color: #fff;
		color: #333;
		word-wrap: break-word;
		white-space: pre-wrap;
	}
	#content {
		min-height: 200px;
		line-height: 1.6;
		word-wrap: break-word;
		white-space: pre-wrap;
	}
	/* 버튼 스타일 */
	#btn {
		text-align: right;
		width: 90%;
		max-width: 600px;
		margin: 20px auto;
	}
	#btn a {
		display: inline-block;
		text-decoration: none;
		padding: 5px 10px;
		border: 1px solid #4CAF50;
		color: #4CAF50;
		margin-left: 10px;
		border-radius: 4px;
		transition: all 0.3s ease;
		font-size: 12px;
	}
	#btn a:hover {
		background-color: #4CAF50;
		color: white;
	}
</style>
</head>
<body>

	<h3>공지사항</h3>
	<table>
		<tr>
			<th>제목</th>
			<td>${gdto.title}</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${gdto.readnum}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td id="content">${gdto.content}</td>
		</tr>
	</table>
	<div id="btn">
		<a href="gongjiList">목록</a>
		<a href="gongjiUpdate?id=${gdto.id}">수정</a>
		<a href="gongjiDelete?id=${gdto.id}">삭제</a>
	</div>
	
</body>
</html>
