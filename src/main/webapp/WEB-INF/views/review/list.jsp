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
    font-family: 'Noto Sans KR', sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f6f9;
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
  section {
    width:1000px;
	height:550px;
	margin:10px auto;
	padding:20px;
	background-color:#fff;
	border-radius:8px;
	box-shadow:0 2px 10px rgba(0, 0, 0, 0.1);
  }
  table {
	width:100%;
	border-collapse: collapse;
	margin-bottom: 20px;
  }
  th, td {
	padding: 6px;
	text-align: center;
	border-bottom: 1px solid #ddd;
  }
  th {
	background-color: #004EA2;
	color: #fff;
	font-weight: 500;
	text-transform: uppercase;
  }
  td {
	background-color: #fff;
	color: #333;
	font-size: 14px;
  }
  a:hover {
	color:#004EA2;
  }
  #write {
	display: inline-block;
	width: 100px;
	background:#004EA2;
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
	<div class="csc"> 여행후기 </div>
	<div class="cscmc">
	  <div class="cscmenu">
	    <a href="../gongji/list">공지 사항</a>
	    <a href="../inquiry/inquiryList">Q＆A</a>
	    <a href="#">이벤트</a>
	    <a href="../review/list">여행 후기</a>
	  </div>
	</div>
	<section>
		<div class="container">
			<div class="content">
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
								<a href="readnum?id=${revdto.id}&page=${page}">
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
				<a href="write" id="write" style='align: right'> 후기 등록 </a>
			</div>
		</div>
	  </div>
	</section>
</main>
</body>
</html>