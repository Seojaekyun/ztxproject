<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공지사항 관리</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
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
	h3 {
      font-size:24px;
      font-weight:bold;
      color:#333;
      text-align:center;
      margin-bottom:20px;
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
	#tbbox {
	  height: 50px;
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
	/* 필독 및 공지 배지 스타일 */
	#badge1 {
		background-color: #DF251F;
		color: white;
		font-size: 11px;
		padding: 3px 8px;
		border-radius: 3px;
		margin-right: 8px;
		font-weight: 700;
	}
	#badge2 {
		background-color: #4CAF50;
		color: white;
		font-size: 11px;
		padding: 3px 8px;
		border-radius: 3px;
		margin-right: 8px;
		font-weight: 700;
	}
	#paging {
	  text-align:center;
  	  margin-top:25px;
    }
    #paging a, #paging span {
      display:inline-block;
      padding:5px 10px;
      margin:0 3px;
      font-size:13px;
      color:#333;
      text-decoration:none;
      border:1px solid #ddd;
      border-radius:3px;
      transition:all 0.2s ease-in-out;
    }
    #paging a:hover {
      background-color:#004EA2;
      color:white;
    }
    #paging .active {
      background-color:#004EA2;
      color:white;
      font-weight:bold;
      
      pointer-events:none;
    }
    #paging .disabled {
      color:#bbb;
      
      pointer-events:none;
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
<body> <!-- gongji/list.jsp -->
<main>
	<div class="nullbox"></div>
	<div class="csc">공지사항</div>
	<div class="cscmc">
		<div class="cscmenu">
		    <a href="../gongji/list">공지 사항</a>
		    <a href="../inquiry/inquiryList">Q＆A</a>
		    <a href="#">이벤트</a>
		    <a href="../review/list">여행 후기</a>
		</div>
	</div>
	 <section>
	    <table>
	        <tr>
	            <th colspan="2">제목</th>
	            <th>작성자</th>
	            <th>조회수</th>
	            <th>작성일</th>
	        </tr>
	        <c:forEach items="${glist}" var="gdto">
	            <tr>
	                <td width="100">
	                    <c:if test="${gdto.state == 1}">
	                        <span id="badge1">필독</span>
	                    </c:if>
	                    <c:if test="${gdto.state == 0}">
	                        <span id="badge2">공지</span>
	                    </c:if>
	                </td>
	                <td style="text-align:left">
	                    <a href="readnum?id=${gdto.id}"> ${gdto.title }</a>
	                </td>
	                <td>${gdto.writer}</td>
	                <td>${gdto.readnum}</td>
	                <td>${gdto.writeday}</td>
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
</main>
</body>
</html>