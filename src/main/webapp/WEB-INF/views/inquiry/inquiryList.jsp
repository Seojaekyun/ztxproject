<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
     width: 1000px;
     height: 550px;
     margin: 10px auto;
     background: white;
     padding: 20px;
     border-radius: 10px;
     box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
     text-align: center;
   }
   #tablebox {
   	 height: 470px;
   }

   h2 {
     margin-bottom: 20px;
   }

   table {
     width: 100%;
     border-collapse: collapse;
     background-color: white;
   }

   th, td {
     padding: 7px;
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
   #btnbox {
     display: flex;
     justify-content: flex-end;
     margin-top: 1px;
     right: 20px;
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
<body>
<main>
	<div class="nullbox"></div>
<div class="csc">Q＆A</div>
<div class="cscmc">
	<div class="cscmenu">
	    <a href="../gongji/list">공지 사항</a>
	    <a href="../inquiry/inquiryList">Q＆A</a>
	    <a href="../promot/list">이벤트</a>
	    <a href="../review/list">여행 후기</a>
	</div>
</div>
 <section>
 <div id="tablebox">
    <table>
        <thead>
            <tr>
                <th> </th>
                <th>문의 유형</th>
                <th>제목</th>
                <th>작성자</th>
                <th>상태</th>
                <th>조회수</th>
                <th>게시일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="inquiry" items="${inquiries}">
                <tr>
                    <td>${inquiry.id}</td>
                    <td class="status-${inquiry.status}">
    					<c:choose>
						<c:when test="${inquiry.category eq 4}">
						<span id="s1">기타 문의</span>
						</c:when>
						<c:when test="${inquiry.category eq 3}">
						<span id="s2">웹사이트 관련 문의</span>
						</c:when>
						<c:when test="${inquiry.category eq 2}">
						<span id="s1">예약취소 관련 문의</span>
						</c:when>
						<c:when test="${inquiry.category eq 1}">
						<span id="s2">탑승 관련 문의</span>
						</c:when>
						<c:when test="${inquiry.category eq 0}">
						<span id="s1">예약 관련 문의</span>
						</c:when>
						<c:otherwise>
						<span id="s1">알 수 없는 문의</span>
						</c:otherwise>
						</c:choose>
				    </td>
				    <td style="text-align: left"><a href="/inquiry/readnum?id=${inquiry.id}">${inquiry.title}</a></td>
				    <td>${inquiry.userid}</td>
					<td>
                    <c:choose>
                        <c:when test="${empty inquiry.answer}">
                            <span class="badge-unanswered">답변대기</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge-answered">답변완료</span>
                        </c:otherwise>
                    </c:choose>
                	</td>
                    <td>${inquiry.readnum}</td>
                    <td>${inquiry.writeday}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    </div>
    <div id="btnbox">
    <a href="/inquiry/inquiryWrite" class="btn">문의 하기</a>
    </div>
 </section>
</main>
</body>
</html>
