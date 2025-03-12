<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>문의 목록</title>
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
</head>
<body>

 <section>
    <h3>문의 목록</h3>
    <table>
        <thead>
            <tr>
                <th>순번</th>
                <th>조회수</th>
                <th>이름</th>
                <th>제목</th>
                <th>문의 유형</th>
                <th>상태</th>
                <th>조회</th>
                <th>게시일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="inquiry" items="${inquiries}">
                <tr>
                    <td>${inquiry.id}</td>
                    <td>${inquiry.readnum}</td>
                    <td>${inquiry.name}</td>
                    <td>${inquiry.title}</td>
                    <td class="status-${inquiry.status}">
    					<c:choose>
        					<c:when test="${inquiry.category == 1}">불편/개선</c:when>
        					<c:when test="${inquiry.category == 2}">단순 문의</c:when>
        					<c:when test="${inquiry.category == 3}">친절 제보</c:when>
        					<c:when test="${inquiry.category == 4}">서식 VOC</c:when>
        					<c:when test="${inquiry.category == 5}">시민 재해 예방</c:when>
        					<c:otherwise>알 수 없음</c:otherwise>
    					</c:choose>
				    </td>
					<td class="ref-${inquiry.ref}">
				    	<c:choose>
				    		<c:when test="${inquiry.ref == 0 }">미답변</c:when>
				    		<c:when test="${inquiry.ref == 1 }">답변완료</c:when>
				    	</c:choose>
				    </td>
                    <td>
                        <!-- ✅ 회원과 비회원 모두 비밀번호 입력 없이 조회 가능 -->
                        <a href="/inquiry/detail/${inquiry.id}" class="btn">조회</a>
                    </td>
                    <td>${inquiry.writeday}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <br>
    <a href="/inquiry/inquiryWrite" class="btn">문의 작성하기</a>
 </section>

</body>
</html>
