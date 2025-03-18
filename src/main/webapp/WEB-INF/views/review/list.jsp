<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Q＆A</title>
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
	}
	section nav a:hover {
		text-decoration: underline;
	}
	.container {
		max-width: 1200px;
		margin: 20px auto;
		background-color: white;
		padding: 20px;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	}
	.content {
		height: 500px;
	}
	.content h2 {
		font-size: 22px;
		color: #00467F;
		margin-bottom: 10px;
	}
	table {
		width: 100%;
		height: 500px;
		border-collapse: collapse;
	}
	table, th, td {
		border-bottom: 1px solid #ddd;
		height: 30px;
	}
	th, td {
		padding: 12px;
		text-align: center;
	}
	th {
		background-color: #f2f2f2;
	}
	td {
		font-size: 12px;
	}
	.cta-button {
		display: inline-block;
		padding: 10px 15px;
		background-color: #00467F;
		color: white;
		text-decoration: none;
		border-radius: 5px;
		margin-top: 20px;
	}
	.cta-button:hover {
		background-color: #003A66;
	}
	.qna-table a {
		color: #00467F;
		text-decoration: none;
	}
	.qna-table a:hover {
		text-decoration: underline;
	}
	#write {
		display: inline-block;
		width: 100px;
		background: #23297A;
		color: white;
		text-align: center;
		text-decoration: none;
		padding: 10px 0;
		box-sizing: border-box;
		border-radius: 5px;
		cursor: pointer;
	}
	#write:hover {
		background: #1A1F6B;
	}
	.pagination {
		text-align: center;
		margin-top: 20px;
	}
	.pagination a {
		display: inline-block;
		padding: 5px 10px;
		margin: 0 3px;
		background-color: #4CAF50;
		color: white;
		text-decoration: none;
		border-radius: 5px;
		font-size: 12px;
	}
	.pagination a.active, .pagination span.active {
		background-color: #333;
		color: white;
		cursor: default;
		text-decoration: none;
	}
	.pagination span {
		display: inline-block;
		padding: 5px 10px;
		margin: 0 3px;
		background-color: #4CAF50;
		color: white;
		text-decoration: none;
		border-radius: 5px;
		font-size: 12px;
		cursor: default;
	}
	#badge1 {
		background: #DF251F;
		padding: 3px;
		font-size: 11px;
		font-weight: 900;
		margin-right: 5px;
		border-radius: 3px;
		color: white;
	}
	#badge2 {
		background: #65FF5E;
		padding: 3px;
		font-size: 11px;
		margin-right: 5px;
		border-radius: 3px;
		color: white;
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

<section>
	<div class="csc">고객센터</div>
	<div class="cscmc">
		<div class="cscmenu">
		    <a href="../gongji/list">공지 사항</a>
		    <a href="../inquiry/inquiryList">Q＆A</a>
		    <a href="#">이벤트</a>
		    <a href="../review/list">여행 후기</a>
		</div>
	</div>
	<div class="container">
		<div class="content">
			<h2>여행 후기</h2>
			<table class="qna-table">
				<tr>
					<th colspan="2"> 제 목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
				<c:forEach items="${revlist}" var="revdto">
					<tr>
						<td style="text-align: left" colspan="2">
							<a href="reviewReadnum?id=${revdto.id}">
								${revdto.title}
							</a>
						</td>
						<td>${revdto.userid}</td>
						<td>${revdto.readnum}</td>
						<td>${revdto.writeday}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<!-- 페이징 처리 -->
		<div class="pagination">
			<c:if test="${currentPage > 10}">
				<a href="?page=${currentPage - 10}">&laquo; 이전 10</a>
			</c:if>
			<c:set var="startPage" value="${currentPage - 5}" />
			<c:set var="endPage" value="${currentPage + 4}" />
			<c:if test="${startPage < 1}">
				<c:set var="startPage" value="1" />
			</c:if>
			<c:if test="${endPage > totalPages}">
				<c:set var="endPage" value="${totalPages}" />
			</c:if>
			<c:forEach begin="${startPage}" end="${endPage}" var="i">
				<c:choose>
					<c:when test="${i == currentPage}">
						<span class="active">${i}</span>
					</c:when>
					<c:otherwise>
						<a href="?page=${i}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${currentPage + 10 <= totalPages}">
				<a href="?page=${currentPage + 10}">다음 10 &raquo;</a>
			</c:if>
		</div>
		<div align="right">
			<a href="write" id="write" style='align: right'>후기 등록</a>
		</div>
	</div>
</section>

</body>
</html>