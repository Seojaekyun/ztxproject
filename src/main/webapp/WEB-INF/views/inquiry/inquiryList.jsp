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
     width: 1000px;
     height: 800px;
     margin: 40px auto;
     background: white;
     padding: 20px;
     border-radius: 10px;
     box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
     text-align: center;
   }
   #tablebox {
   	 height: 700px;
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
   #btnbox {
   	 text-align: right;
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
</style>
</head>
<body>

 <section>
 <div id="tablebox">
    <h2>Q＆A</h2>
    <table>
        <thead>
            <tr>
                <th>순번</th>
                <th>아이디</th>
                <th>제목</th>
                <th>문의 유형</th>
                <th>상태</th>
                <th>조회수</th>
                <th>게시일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="inquiry" items="${inquiries}">
                <tr>
                    <td>${inquiry.id}</td>
                    <td>${inquiry.userid}</td>
                    <td align="left"><a href="/inquiry/readnum?id=${inquiry.id}">${inquiry.title}</a></td>
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

</body>
</html>
