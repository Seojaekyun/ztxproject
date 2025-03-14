<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>문의 수정</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-5">
    <h2 class="text-primary text-center">문의 수정</h2>
    <form action="/inquiry/inquiryUpdateOk" method="POST">
        
        <!-- 문의 ID (필수) -->
        <input type="hidden" name="id" value="${inquiry.id}">
        
        <!-- 연락처 -->
	<div class="mb-3">
    	<label class="form-label">연락처</label>
    	<input type="text" class="form-control" name="phone" value="${inquiry.phone}" required>
	</div>
        

        <!-- 문의 유형 -->
        <div class="mb-3">
            <label class="form-label">문의 유형</label>
            <select class="form-select" name="category" required>
                <option value="1" ${inquiry.category == 1 ? 'selected' : ''}>불편/개선</option>
                <option value="2" ${inquiry.category == 2 ? 'selected' : ''}>단순 문의</option>
                <option value="3" ${inquiry.category == 3 ? 'selected' : ''}>친절 제보</option>
                <option value="4" ${inquiry.category == 4 ? 'selected' : ''}>서식 VOC</option>
                <option value="5" ${inquiry.category == 5 ? 'selected' : ''}>시민 재해 예방</option>
            </select>
        </div>

        <!-- 제목 -->
        <div class="mb-3">
            <label class="form-label">제목</label>
            <input type="text" class="form-control" name="title" value="${inquiry.title}" required>
        </div>

        <!-- 문의 내용 -->
        <div class="mb-3">
            <label class="form-label">문의 내용</label>
            <textarea class="form-control" name="content" rows="5" required>${inquiry.content}</textarea>
        </div>

        <!-- 수정 버튼 -->
        <div class="d-grid gap-2">
            <button type="submit" class="btn btn-primary">문의 수정</button>
            <a href="/inquiry/inquiryList" class="btn btn-secondary">목록으로 돌아가기</a>
        </div>
        
    </form>
</div>

</body>
</html>
