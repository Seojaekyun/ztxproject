<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공지사항</title>
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
	.pagination {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }
    .pagination a {
        color: #00467F;
        padding: 8px 16px;
        text-decoration: none;
        border: 1px solid #ddd;
        margin: 0 2px;
        border-radius: 5px;
    }
    .pagination a:hover {
        background-color: #00467F;
        color: white;
    }
    .pagination .active {
        background-color: #00467F;
        color: white;
        border: 1px solid #00467F;
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
		    <a href="../promot/list">이벤트</a>
		    <a href="../review/list">여행 후기</a>
		</div>
	</div>
	 <section>
	   <table>
	     <tr>
	       <th>  </th>
	       <th width="60%"> 제목 </th>
	       <th> 작성자 </th>
	       <th> 작성일 </th>
	       <th> 조회 </th>
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
	       <td>
	         <a href="readnum?id=${gdto.id}"> ${gdto.title }</a>
	       </td>
	       <td>${gdto.writer}</td>
	       <td>${gdto.writeday}</td>
	       <td>${gdto.readnum}</td>
	     </tr>
	    </c:forEach>
	   </table>
	
	   <!-- 페이징 처리 -->
	   <div class="pagination">
	    <c:if test="${currentPage > 1}">
		 <a href="?page=${currentPage - 1}&selectedDate=${selectedDate}&departureAirport=${departureAirport}&arrivalAirport=${arrivalAirport}">이전</a>
		</c:if>
		<c:set var="startPage" value="${currentPage - (currentPage - 1) % 10}"/>
		  <c:forEach begin="${startPage}" end="${startPage + 9}" var="i">
			<c:if test="${i <= totalPages}">
			  <a href="?page=${i}&selectedDate=${selectedDate}&departureAirport=${departureAirport}&arrivalAirport=${arrivalAirport}" 
			  class="${i == currentPage ? 'active' : ''}">${i}</a>
			</c:if>
		  </c:forEach>
		  <c:if test="${currentPage < totalPages}">
			<a href="?page=${currentPage + 1}&selectedDate=${selectedDate}&departureAirport=${departureAirport}&arrivalAirport=${arrivalAirport}">다음</a>
		  </c:if>
	   </div>
	</section>
</main>
</body>
</html>