<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>고객센터 문의 등록</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script>
        window.onload = function () {
            let userId = "${sessionScope.userid}";
            if (userId) {
                document.getElementById("passwordField").style.display = "none"; // ✅ 회원이면 비밀번호 입력칸 숨김
            }
        };
    </script>
</head>
<body>

<div class="container mt-5">
    <h2 class="text-primary text-center">고객 의견 접수</h2>
    <form action="/inquiry/inquiryWriteOk" method="post">
        
        <!-- 문의 유형 -->
        <div class="mb-3">
            <label class="form-label">문의 유형</label>
            <select class="form-select" name="category" required>
                <option value="">선택하세요</option>
                <option value="1">불편/개선</option>
                <option value="2">단순 문의</option>
                <option value="3">친절 제보</option>
                <option value="4">서식 VOC</option>
                <option value="5">시민 재해 예방</option>
            </select>
        </div>

        <!-- 이름 (회원이면 자동 입력) -->
        <div class="mb-3">
            <label class="form-label">이름</label>
            <input type="text" class="form-control" name="name" 
                   value="${udto.name}" 
                   <c:if test='${sessionScope.userid != null}'>readonly</c:if>
                   placeholder="이름을 입력하세요" required>
        </div>

        <!-- 연락처 (회원이면 자동 입력) -->
        <div class="mb-3">
            <label class="form-label">연락처</label>
            <input type="text" class="form-control" name="phone" 
                   value="${udto.phone}" 
                   <c:if test='${sessionScope.userid != null}'>readonly</c:if>
                   placeholder="예: 010-1234-5678" required>
        </div>

        <!-- 제목 (필수 입력) -->
        <div class="mb-3">
            <label class="form-label">제목</label>
            <input type="text" class="form-control" name="title" placeholder="제목을 입력하세요" required>
        </div>

        <!-- 문의 내용 (회원/비회원 공통) -->
        <div class="mb-3">
            <label class="form-label">문의 내용</label>
            <textarea class="form-control" name="content" rows="5" placeholder="문의 내용을 입력하세요" required></textarea>
        </div>

        <!-- 비밀번호 (비회원만 입력) -->
        <div class="mb-3" id="passwordField">
            <label class="form-label">비밀번호 (비회원용)</label>
            <input type="password" class="form-control" name="pwd" placeholder="비밀번호 입력 (비회원)">
        </div>

        <!-- 버튼 -->
        <div class="d-grid gap-2">
            <button type="submit" class="btn btn-primary">문의 등록</button>
            <a href="/inquiry/inquiryList" class="btn btn-secondary">목록으로 돌아가기</a>
        </div>
        
    </form>
</div>

</body>
</html>
