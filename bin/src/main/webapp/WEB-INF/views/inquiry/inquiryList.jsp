<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>나의 문의 조회</title>
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
    <h3>나의 문의 조회</h3>
    <table>
        <thead>
            <tr>
                <th>순번</th>
                <th>접수번호</th>
                <th>제목</th>
                <th>게시일</th>
                <th>상태</th>
                <th>조회</th> <!-- 비회원 조회 시 비밀번호 입력 추가 -->
            </tr>
        </thead>
        <tbody>
            <c:forEach var="inquiry" items="${mapAll}">
                <tr>
                    <td>${inquiry.id}</td>
                    <td>${inquiry.ref}</td>
                    <td>${inquiry.title}</td>
                    <td>${inquiry.writeday}</td>
                    <td class="status-${inquiry.status}">
                        <c:choose>
                            <c:when test="${inquiry.status == 1}">접수됨</c:when>
                            <c:when test="${inquiry.status == 2}">처리중</c:when>
                            <c:when test="${inquiry.status == 3}">완료됨</c:when>
                            <c:when test="${inquiry.status == 4}">반려됨</c:when>
                            <c:otherwise>알수없음</c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${inquiry.userid == 'guest'}">
                                <form action="/inquiry/detail/${inquiry.id}" method="post">
                                    <input type="password" name="pwd" placeholder="비밀번호 입력" required>
                                    <button type="submit" class="btn btn-primary btn-sm">조회</button>
                                </form>
                            </c:when>
                            <c:otherwise>
                                <a href="/inquiry/detail/${inquiry.id}" class="btn btn-primary btn-sm">조회</a>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <br>
    <a href="/inquiry/inquiryWrite" class="btn">문의 작성하기</a>
    
    <tr>
     <td>
     <!-- 이전 그룹 -->
     	<c:if test="${istart != 1}">
     		<a href="inquiryList?page=${pstart-1}&id=${id}"><img src="../static/4.png"></a>
     	</c:if>
     	<c:if test="${istart == 1}">
     		<img src="../static/4.png">
     	</c:if>
     <!-- 이전 페이지 -->
     	<c:if test="${page != 1}">
     		<a href="inquiryList?page=${page-1}&id=${id}"><img src="../static/3.png"></a>
     	</c:if>
     	<c:if test="${page == 1}">
     		<img src="../static/3.png">
     	</c:if>
     
     	<c:forEach var="i" begin="${istart}" end="${iend}">
     	 <c:if test="${page == i}">
     		<a href="inquiryList?page=${i}&id=${id}" style="color:#003b8b"> ${i} </a>
     	 </c:if>
     	 <c:if test="${page != i}">
     		<a href="inquiryList?page=${i}&id=${id}"> ${i} </a>
     	 </c:if>
     	</c:forEach>
     	
     <!-- 다음 페이지 -->
     	<c:if test="${page != chong}">
     		<a href="inquiryList?page=${page+1}&id=${id}"> <img src="../static/2.png"> </a>
     	</c:if>
     	<c:if test="${page==chong}">
     		<img src="../static/2.png">
     	</c:if>
     	
     	
     </td>
    </tr>
 </section>

</body>
</html>
