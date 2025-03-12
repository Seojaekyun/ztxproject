<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>문의 상세보기</title>
<style>
   body {
     font-family: 'Noto Sans KR', sans-serif;
     background-color: #f5f5f5;
     margin: 0;
     padding: 0;
   }

   section {
     width: 80%;
     margin: 40px auto;
     background: white;
     padding: 20px;
     border-radius: 10px;
     box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
     text-align: center;
   }

   h3 {
     margin-bottom: 20px;
   }

   table {
     width: 100%;
     border-collapse: collapse;
     background-color: white;
   }

   th, td {
     padding: 12px;
     text-align: center;
     border-bottom: 1px solid #ddd;
   }

   th {
     background-color: #003b8b;
     color: white;
     font-weight: bold;
   }

   tr:last-child td {
     border-bottom: 2px solid black;
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
   }

   .btn:hover {
     background-color: #005bb5;
   }
</style>

<script>
function validatePassword(actionUrl, correctPwd) {
    let inputPwd = document.getElementById("inputPwd").value;

    if (inputPwd !== correctPwd) {
        alert("비밀번호가 일치하지 않습니다.");
        return false; // 🚫 이동 차단
    }

    document.getElementById("actionForm").action = actionUrl;
    document.getElementById("actionForm").submit(); // ✅ 이동 허용
}
</script>

</head>
<body>

 <section>
    <h3>문의 상세보기</h3>
    <table>
        <tr><th>제목</th><td>${inquiry.title}</td></tr>
        <tr><th>작성자</th><td>${inquiry.name}</td></tr>
        <tr><th>작성일</th><td>${inquiry.writeday}</td></tr>
        <tr><th>내용</th><td>${inquiry.content}</td></tr>
    </table>
    <br>
    
    <!-- 🚀 비회원일 경우 비밀번호 입력 후 수정/삭제 가능 -->
    <c:if test="${inquiry.userid eq 'guest'}">
        <form id="actionForm" method="POST">
            <input type="hidden" name="id" value="${inquiry.id}">
            
            <!-- 비밀번호 입력 -->
            <label>비밀번호 입력: </label>
            <input type="password" id="inputPwd" name="pwd" required>

            <!-- 수정 버튼 -->
            <button type="button" onclick="validatePassword('/inquiry/inquiryUpdate', '${inquiry.pwd}')">수정</button>

            <!-- 삭제 버튼 -->
            <button type="button" onclick="validatePassword('/inquiry/inquiryDelete', '${inquiry.pwd}')">삭제</button>
        </form>
    </c:if>

    <!-- 🚀 회원일 경우 비밀번호 없이 수정 가능 -->
    <c:if test="${inquiry.userid ne 'guest'}">
        <a href="/inquiry/inquiryUpdate?id=${inquiry.id}" class="btn">수정</a>
        <a href="/inquiry/inquiryDelete?id=${inquiry.id}" class="btn">삭제</a>
    </c:if>
    
    <br>
    <a href="/inquiry/inquiryList" class="btn">목록으로</a>
 </section>

</body>
</html>
