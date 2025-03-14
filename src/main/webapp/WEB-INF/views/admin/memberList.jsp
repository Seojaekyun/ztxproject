<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<style>
	body {
		font-family: 'Noto Sans KR', sans-serif;
		background-color: #f0f4f8;
		margin: 0;
		padding: 0;
	}
	h3 {
		font-size: 24px;
		font-weight: 700;
		color: #333;
		margin-bottom: 20px;
	}
	section {
		width: 90%;
		max-width: 900px;
		margin: auto;
		padding-bottom: 40px;
		background-color: #fff;
		border-radius: 8px;
		box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
		padding: 20px;
	}
	table {
		width: 100%;
		border-collapse: collapse;
		margin-bottom: 20px;
	}
	table, th, td {
		border: 1px solid #ddd;
	}
	th, td {
		padding: 6px;
		text-align: center;
	}
	th {
		background-color: #004EA2;
		color: white;
		text-transform: uppercase;
	}
	td {
		background-color: #fafafa;
		color: #333;
		font-size: 14px;
	}
	/* 등급 배지 스타일 */
	.badge {
		display: inline-block;
		padding: 2px 4px;
		font-size: 12px;
		border-radius: 12px;
		color: white;
		font-weight: 700;
	}
	.badge-normal { background-color: #6c757d; }   /* 일반회원 */
	.badge-premium { background-color: #28a745; }  /* 우수회원 */
	.badge-vip { background-color: #ffc107; }      /* VIP */
	.badge-withdraw { background-color: #dc3545; } /* 탈퇴신청, 탈퇴회원 */
	.badge-recover { background-color: #007bff; }  /* 복구신청 */

	section button, input[type="button"] {
		background-color: #007BFF;
		color: white;
		border: none;
		padding: 5px 8px;
		border-radius: 5px;
		cursor: pointer;
		font-size: 10px;
	}
	section button:hover, input[type="button"]:hover {
		background-color: #0056b3;
	}
	.pagination {
		display: flex;
		justify-content: center;
		margin-top: 10px;
	}
	.pagination a, .pagination span {
		margin: 0 5px;
		padding: 5px 10px;
		border: 1px solid #ddd;
		border-radius: 5px;
		text-decoration: none;
		color: #007BFF;
		font-size: 10px;
	}
	.pagination a:hover {
		background-color: #f4f4f4;
	}
	.pagination span {
		background-color: #007BFF;
		color: white;
	}
	/* 반응형 디자인 */
	@media (max-width: 768px) {
		section {
			width: 100%;
			padding: 10px;
		}
		th, td {
			padding: 8px;
			font-size: 12px;
		}
	}
</style>
</head>
<body>
<section>
	<h3>회원 관리</h3> <!-- 테이블 제목 -->
	<table>
		<tr>
			<th>고객명</th>
			<th>ID</th>
			<th>가입일</th>
			<th>회원등급</th>
			<th>최근예약현황</th>
			<th>등급조정</th>
			
			<th>요청사항</th>
		</tr>
		<c:forEach items="${ulist}" var="mdto">
			<tr>
				<td>${mdto.name}</td>
				<td><a href="oneMeminfo?userid=${mdto.userid}">${mdto.userid}</a></td>
				<td>${mdto.writeday}</td> <!-- 예시로 writeday 추가 -->
				<td>
					<c:if test="${mdto.level == 0}"><input type="button" value="Silver" style="background: silver"></c:if>
					<c:if test="${mdto.level == 1}"><input type="button" value="Gold" style="background: gold"></c:if>
					<c:if test="${mdto.level == 2}"><input type="button" value="VIP" style="background:#3b00ff"></c:if>
					<c:if test="${mdto.level == 3}"> 탈퇴신청 </c:if>
					<c:if test="${mdto.level == 4}"> 탈퇴회원 </c:if>
					<c:if test="${mdto.level == 5}"> 복구요청 </c:if>
					<c:if test="${mdto.level == 6}"><input type="button" value="Black" style="background: black"></c:if>
				</td>
				<td>
					<c:forEach items="${mdto.reservlist}" var="rsv">
						${rsv.reservday}<br>
					</c:forEach>
				</td>
				<td>
					<c:if test="${mdto.level == 0}">
						<a href="../admin/memberUp?id=${mdto.id}&level=1"><input type="button" value="Gold" style="background: gold"></a>
						<a href="../admin/memberUp?id=${mdto.id}&level=6"><input type="button" value="Black"  style="background: black"></a>
					</c:if>
					<c:if test="${mdto.level == 1}">
						<a href="../admin/memberUp?id=${mdto.id}&level=2"><input type="button" value="VIP" style="background:#3b00ff"></a>
						<a href="../admin/memberUp?id=${mdto.id}&level=0"><input type="button" value="Silver" style="background: silver"></a>
					</c:if>
					<c:if test="${mdto.level == 2}">
						<a href="../admin/memberUp?id=${mdto.id}&level=1"><input type="button" value="Gold" style="background: gold"></a>
					</c:if>
					<c:if test="${mdto.level == 6}">
						<a href="../admin/memberUp?id=${mdto.id}&level=0"><input type="button" value="Silver" style="background: silver"></a>
						<a href="../admin/memberUp?id=${mdto.id}&level=7"><input type="button" value="OUT" style="background: #635e5e"></a>
					</c:if>
					<c:if test="${mdto.level == 7}">
						<a href="../admin/memberUp?id=${mdto.id}&level=6"><input type="button" value="Black" style="background: black"></a>
					</c:if>
				</td>
				<td>
					<c:if test="${mdto.level == 3}">
						<a href="../admin/memberUp?id=${mdto.id}&level=4"><input type="button" value="탈퇴승인"></a>
					</c:if>
					<c:if test="${mdto.level == 5}">
						<a href="../admin/memberUp?id=${mdto.id}&level=${mdto.previousLevel}"><input type="button" value="복구승인"></a>
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>

	<!-- 페이지네이션 -->
	<div class="pagination">
		<c:if test="${currentPage > 1}">
			<a href="?page=${currentPage - 1}">이전</a>
		</c:if>
		<c:forEach begin="1" end="${totalPages}" var="i">
			<c:if test="${i == currentPage}">
				<span>${i}</span>
			</c:if>
			<c:if test="${i != currentPage}">
				<a href="?page=${i}">${i}</a>
			</c:if>
		</c:forEach>
		<c:if test="${currentPage < totalPages}">
			<a href="?page=${currentPage + 1}">다음</a>
		</c:if>
	</div>
	
</section>
</body>
</html>