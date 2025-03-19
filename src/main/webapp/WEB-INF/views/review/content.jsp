<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		background-color:#004EA2;
		color: white;
		text-decoration: none;
		border-radius: 5px;
		margin: 0 5px;
	}
	#btn a:hover {
		background-color: #003A66;
	}
</style>
</head>
<body>
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
			<th> 파 일 </th>
			<td colspan="3">${revdto.fname}</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td colspan="3">${revdto.writeday}</td>
		</tr>
		<tr>
			<th>내 용</th>
			<td colspan="3">${revdto.content}</td>
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
</body>
</html>
