<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
  <style>
    body {
	  font-family:'Noto Sans KR', sans-serif;
	  margin:0;
	  padding:0;
	  background-color:#f4f6f9;
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
	  height:800px;
	  margin:30px auto;
	  padding:20px;
	  background-color:#fff;
	  border-radius:8px;
	  box-shadow:0 2px 10px rgba(0, 0, 0, 0.1);
	}
	#tbbox {
	  height: 50px;
	}
	table {
	  width:100%;
	  border-collapse:collapse;
	  margin-bottom:20px;
	}
	th, td {
	  padding:8px;
	  text-align:center;
	  border-bottom:1px solid #ddd;
	}
	th {
	  background-color:#004EA2;
	  color:#fff;
	  font-weight:500;
	  text-transform:uppercase;
	}
	td {
	  background-color:#fff;
	  color:#333;
	  font-size:15px;
	}
	a {
	  color:#004EA2;
	  text-decoration:none;
	}
	a:hover {
	  text-decoration:underline;
	}
	#badge1 {
	  background-color:#DF251F;
	  color:white;
	  font-size:11px;
	  padding:3px 8px;
	  border-radius:3px;
	  margin-right:8px;
	  font-weight:700;
	}
	#badge2 {
	  background-color:#4CAF50;
	  color:white;
	  font-size:11px;
	  padding:3px 8px;
	  border-radius:3px;
	  margin-right:8px;
	  font-weight:700;
	}
	#paging {
	  text-align:center;
  	  margin-top:15px;
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
      border:1px solid #004EA2;
      pointer-events:none;
    }
    #paging .disabled {
      color:#bbb;
      border:1px solid #eee;
      pointer-events:none;
    }
  </style>
</head>
<body> <!-- gongji/list.jsp -->
 <section>
  <h3> 공지사항 </h3>
  <div id="tbbox">
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
         <a href="readnum?id=${gdto.id}">${gdto.title}</a>
       </td>
       <td>${gdto.writer}</td>
       <td>${gdto.readnum}</td>
       <td>${gdto.writeday}</td>
     </tr>
    </c:forEach>
   </table>
   </div>
   <div id="paging">
   
    <c:if test="${pstart != 1}">
     <a href="list?page=${pstart-1}"> &laquo; 이전 </a>
    </c:if>
    <c:if test="${pstart == 1}">
     <span class="disabled"> &laquo; 이전 </span>
    </c:if>
    
    <c:if test="${page != 1}">
     <a href="${page-1}"> &lt; </a>
    </c:if>
    <c:if test="${page == 1}">
     <span class="disabled"> &lt; </span>
    </c:if>
    
    <c:forEach var="i" begin="${pstart}" end="${pend}">
      <c:if test="${page == i}">
       <a href="list?page=${i}"> <span class="active"> ${i} </span> </a>
      </c:if>
      <c:if test="${page != i}">
       <a href="list?page=${i}"> ${i} </a>
      </c:if>
    </c:forEach>
    
    <c:if test="${page != chong}">
     <a href="list?page=${page+1}"> &gt; </a>
    </c:if>
    <c:if test="${page == chong}">
     <span class="disabled"> &gt; </span>
    </c:if>
    
    <c:if test="${pend != chong}">
     <a href="list?page=${pend+1}"> 다음 &raquo; </a>
    </c:if>
    <c:if test="${pend == chong}">
     <span class="disabled"> 다음 &raquo; </span>
    </c:if>
    
   </div>
 </section>
</body>
</html>