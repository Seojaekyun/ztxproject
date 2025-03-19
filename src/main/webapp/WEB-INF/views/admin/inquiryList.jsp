<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Q＆A 관리</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<style>
    /* 기본 스타일 */
    body {
        font-family: 'Noto Sans KR', sans-serif;
        background-color: #f4f6f9;
        margin: 0;
        padding: 0;
    }
    h2 {
        font-size: 24px;
        font-weight: 700;
        text-align: center;
        margin-top: 20px;
        color: #333;
    }
    section {
        max-width: 800px;
        margin: 30px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }
    th, td {
        padding: 10px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #004EA2;
        color: white;
        text-transform: uppercase;
        font-weight: 500;
    }
    td {
        background-color: #fff;
        color: #333;
        font-size: 14px;
    }
    a {
        color: #004EA2;
        text-decoration: none;
    }
    a:hover {
        font-weight: bold;
    }
    /* 배지 스타일 */
    .badge-unanswered {
        background-color: #DF251F;
        color: white;
        font-size: 12px;
        padding: 3px 8px;
        border-radius: 3px;
        font-weight: 700;
    }
    .badge-answered {
        background-color: #4CAF50;
        color: white;
        font-size: 12px;
        padding: 3px 8px;
        border-radius: 3px;
        font-weight: 700;
    }
    /* 페이징 스타일 */
    .pagination {
        display: flex;
        justify-content: center;
        gap: 5px;
        margin-top: 10px;
        font-size: 14px;
    }
    .pagination a, .pagination span {
        padding: 8px 12px;
        text-decoration: none;
        border: 1px solid #ddd;
        border-radius: 5px;
        color: #004EA2;
    }
    .pagination a.active, .pagination span.active {
        background-color: #004EA2;
        color: white;
        border: none;
    }
    .pagination a:hover {
        background-color: #f4f4f4;
    }
    /* 반응형 디자인 */
    @media (max-width: 768px) {
        h2 {
            font-size: 20px;
        }
        th, td {
            font-size: 14px;
            padding: 8px;
        }
    }
</style>
</head>
<body>

<h2>Q ＆ A 관리</h2>
<section>
    <table>
        <tr>
            <th>no.</th>
            <th>유형</th>
            <th>작성자</th>
            <th>제목</th>
            <th>작성일</th>
            <th>답변 상태</th>
        </tr>

        <c:forEach var="inquiry" items="${inquiries}">
        <tr>
            <td>${inquiry.id}</td>
            <td>
            	<c:choose>
				<c:when test="${inquiry.category eq 4}">
				<span id="s1">기타 문의</span>
				</c:when>
				<c:when test="${inquiry.category eq 3}">
				<span id="s2">웹 문의</span>
				</c:when>
				<c:when test="${inquiry.category eq 2}">
				<span id="s1">취소 문의</span>
				</c:when>
				<c:when test="${inquiry.category eq 1}">
				<span id="s2">탑승 문의</span>
				</c:when>
				<c:when test="${inquiry.category eq 0}">
				<span id="s1">예약 문의</span>
				</c:when>
				<c:otherwise>
				<span id="s1">알 수 없는 문의</span>
				</c:otherwise>
				</c:choose>
            </td>
            <td>${inquiry.name}</td>
            <td style="text-align: left">
            	<a href="../admin/inquiryAnswer?id=${inquiry.id}">${inquiry.title}</a>
            </td>
            <td>${inquiry.writeday}</td>
            <td>
                <c:choose>
                    <c:when test="${inquiry.status == 0}">
                        <span class="badge-unanswered">답변대기</span>
                    </c:when>
                    <c:when test="${inquiry.status == 1}">
                        <span class="badge-answered">답변완료</span>
                    </c:when>
                </c:choose>
            </td> 
        </tr>
        </c:forEach>
    </table>

    <!-- 페이징 처리 -->
    <div class="pagination">
        <c:if test="${page > 1}">
        <a href="/admin/inquiryList?page=${page - 1}">이전</a>
        </c:if>
        <span>${page} / ${totalPage}</span>
        <c:if test="${page < totalPage}">
        <a href="/admin/inquiryList?page=${page + 1}">다음</a>
        </c:if>
    </div>
</section>

</body>
</html>
