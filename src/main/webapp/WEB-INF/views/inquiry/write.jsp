<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>문의 등록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<style>
	body {
		background-color: #f5f5f5;
		margin: 0;
		padding: 0;
	}
	.container {
		width: 50%;
		margin: 40px auto;
		background: white;
		padding: 20px;
		border-radius: 10px;
		box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
		text-align: center;
	}
	h2 {
		margin-bottom: 20px;
	}
	.form-label {
		font-weight: bold;
	}
	.btn {
		display: inline-block;
		padding: 10px 15px;
		background-color: #0078d7;
		color: white;
		border: none;
		cursor: pointer;
		font-size: 16px;
		border-radius: 5px;
		text-decoration: none;
		width: 100%;
	}
	.btn:hover {
		background-color: #005bb5;
	}
	.readonly-input {
		background-color: #e9ecef;
		cursor: not-allowed;
	}
</style>
</head>
<body>
	<div class="container mt-5">
		<h2 class="text-primary text-center">고객 의견 접수</h2>
		<form action="/inquiry/writeOk" method="post">
			<div class="mb-3">
				<label class="form-label">문의 유형</label>
				<select class="form-select" name="category" required>
					<option value="">선택하세요</option>
					<option value="0">예약 관련 문의</option>
					<option value="1">탑승 관련 문의</option>
					<option value="2">예약취소 관련 문의</option>
					<option value="3">웹사이트 관련 문의</option>
					<option value="4">기타 문의</option>
				</select>
			</div>
			<div class="mb-3">
				<label class="form-label">이름</label>
				<c:choose>
					<c:when test="${not empty userInfo}">
					<input type="text" class="form-control readonly-input" name="name" value="${userInfo.name}" readonly>
					</c:when>
					<c:otherwise>
					<input type="text" class="form-control" name="name" required>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="mb-3">
				<label class="form-label">연락처</label>
				<c:choose>
					<c:when test="${not empty userInfo}">
					<input type="text" class="form-control readonly-input" name="phone" value="${userInfo.phone}" readonly>
					</c:when>
					<c:otherwise>
					<input type="text" class="form-control" name="phone" required>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="mb-3">
				<label class="form-label">제목</label> <input type="text" class="form-control" name="title" required>
			</div>
			<div class="mb-3">
				<label class="form-label">문의 내용</label>
				<textarea class="form-control" name="content" rows="5" required></textarea>
			</div>
			<div class="mb-3">
				<label class="form-label">비밀번호</label>
				<c:choose>
					<c:when test="${not empty userInfo}">
					<input type="hidden" name="pwd" value="회원문의">
					<input type="text" class="form-control readonly-input" value="회원 문의 (자동 저장)" readonly>
					</c:when>
					<c:otherwise>
					<input type="password" class="form-control" name="pwd" required>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="d-grid gap-2">
				<button type="submit" class="btn btn-primary">문의 등록</button>
				<a href="/inquiry/list" class="btn btn-secondary">돌아가기</a>
			</div>
		</form>
	</div>
</body>
</html>