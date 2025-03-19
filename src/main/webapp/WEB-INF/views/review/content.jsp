<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>여행 후기</title>
<style>
	body {
		font-family: Arial, sans-serif;
		margin: 0;
		padding: 0;
		background-color: #f4f4f4;
	}
	.container {
		max-width: 800px;
		margin: 20px auto;
		background-color: white;
		padding: 20px;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	}
	h2 {
		font-size: 22px;
		color: #00467F;
		margin-bottom: 10px;
		text-align: center;
	}
	table {
		width: 100%;
		border-collapse: collapse;
		margin-bottom: 20px;
	}
	table, th, td {
		border-bottom: 1px solid #ddd;
		padding: 12px;
		text-align: left;
	}
	th {
		background-color: #f2f2f2;
	}
	#btn {
		text-align: center;
		margin-top: 20px;
	}
	#btn a {
		display: inline-block;
		padding: 10px 15px;
		background-color: #00467F;
		color: white;
		text-decoration: none;
		border-radius: 5px;
		margin: 0 5px;
	}
	#btn a:hover {
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
<body>
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
		<table>
			<tr>
				<th>제 목</th>
				<td colspan="3">${revdto.title}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${revdto.userid}</td>
				<th>조회수</th>
				<td>${revdto.readnum}</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td colspan="3">${revdto.writeday}</td>
			</tr>
			<tr>
				<th>내 용</th>
				<td colspan="3">
				<img src="../static/resources/files/${revdto.fname}"><p>
				${revdto.content}</td>
			</tr>
		</table>
		<div id="btn">
			<a href="list">목록</a>
			<c:if test="${userid == revdto.userid}">
				<a href="update?id=${revdto.id}&page=${page}">수정</a>
				<a href="delete?id=${revdto.id}&page=${page}">삭제</a>
			</c:if>
		</div>
	</div>
</main>
</body>
</html>
