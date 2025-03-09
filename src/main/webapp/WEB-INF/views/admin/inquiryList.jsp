<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Q ＆ A 리스트</title>
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
        padding: 6px;
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
        text-decoration: underline;
    }
    /* 배지 스타일 */
    #badge1 {
        background-color: #DF251F;
        color: white;
        font-size: 12px;
        padding: 3px 8px;
        border-radius: 3px;
        margin-right: 8px;
        font-weight: 700;
    }
    #badge2 {
        background-color: #4CAF50;
        color: white;
        font-size: 12px;
        padding: 3px 8px;
        border-radius: 3px;
        margin-right: 8px;
        font-weight: 700;
    }
    /* 페이징 스타일 */
    .pagination {
        display: flex;
        justify-content: center;
        gap: 5px;
        margin-top: 10px;
        font-size: 10px;
    }
    .pagination a, .pagination span {
        padding: 5px 10px;
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
            padding: 10px;
        }
    }
</style>
</head>
<body>

<div>
    <h2>Q ＆ A 관리</h2>
</div>
<section>
    <table>
        <tr>
            <th colspan="2">문의사항</th>
            <th>작성자</th>
            <th>조회수</th>
            <th>작성일</th>
        </tr>
        <c:forEach items="${ilist}" var="idto">
            <tr>
                <td width="100">
                    <c:if test="${idto.answer == 0}">
                        <span id="badge1">답변대기</span>
                    </c:if>
                    <c:if test="${idto.answer == 1}">
                        <span id="badge2">답변완료</span>
                    </c:if>
                </td>
                <td style="text-align:left">
                    <a href="inquiryContent?id=${idto.id}">
                        <c:choose>
                            <c:when test="${idto.state == 0}">예약접수 관련 문의</c:when>
                            <c:when test="${idto.state == 1}">탑승수속 관련 문의</c:when>
                            <c:when test="${idto.state == 2}">예약취소 관련 문의</c:when>
                            <c:when test="${idto.state == 3}">웹사이트 관련 문의</c:when>
                            <c:otherwise>기타 문의</c:otherwise>
                        </c:choose>
                    </a>
                </td>
                <td>${idto.userid}</td>
                <td>${idto.readnum}</td>
                <td>${idto.writeday}</td>
            </tr>
        </c:forEach>
    </table>

    <!-- 페이징 처리 -->
    <div class="pagination">
        <c:set var="prevPage" value="${currentPage - 10 < 1 ? 1 : currentPage - 10}" />
        <a href="?page=${prevPage}">&laquo; 이전10</a>
        <c:set var="startPage" value="${currentPage <= 5 ? 1 : currentPage - 4}" />
        <c:set var="endPage" value="${startPage + 9}" />
        <c:if test="${startPage < 1}">
            <c:set var="startPage" value="1" />
        </c:if>
        <c:if test="${endPage > totalPages}">
            <c:set var="endPage" value="${totalPages}" />
            <c:set var="startPage" value="${endPage - 9 > 0 ? endPage - 9 : 1}" />
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
        <c:set var="nextPage" value="${currentPage + 10 > totalPages ? totalPages : currentPage + 10}" />
        <a href="?page=${nextPage}">다음10 &raquo;</a>
    </div>
</section>

</body>
</html>
