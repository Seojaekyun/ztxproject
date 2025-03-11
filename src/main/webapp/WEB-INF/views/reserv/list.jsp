<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    table {
      width:100%;
      border-collapse:collapse;
      margin-top:20px;
      background-color:#ffffff;
      box-shadow:0 4px 8px rgba(0, 0, 0, 0.1);
      border-radius:8px;
      overflow:hidden;
    }
    th, td {
      border:1px solid #ddd;
      padding:12px;
      font-size:16px;
    }
    th {
      background-color:#007BFF;
      color:white;
      font-weight:bold;
      text-transform:uppercase;
    }
    td {
      text-align:center;
      color:#333;
    }
    tr:nth-child(even) {
      background-color:#f8f9fa;
    }
    tr:hover {
      background-color:#e9ecef;
      transition:background-color 0.3s ease-in-out;
    }
    a {
      text-decoration:none;
      color:black;
    }
    a:hover {
      text-decoration:underline;
      color:red;
    }
    
    #paging {
      margin-top:20px;
      text-align:center;
    }
    #paging a {
      display:inline;
      padding:0;
      margin:0 8px;
      text-decoration:none;
      color:#007BFF;
      font-size:16px;
      transition:color 0.3s;
      border:none;
      background:none;
    }
    #paging a:hover {
      color:#0056b3;
    }
    #paging a[style="color:red;"] {
      font-weight:bold;
      color:red;
      background:none;
      border:none;
    }
  </style>
</head>
<body> <!-- reserv/list.jsp -->
 <section>
  <table>
    <tr>
      <th> 예약코드 </th>
      <th> 예약날짜 </th>
      <th> 출발지 </th>
      <th> 도착지 </th>
      <th> 출발시간 </th>
      <th> 도착시간 </th>
      <th> 금 액 </th>
      <th> 결제여부 </th>
    </tr>
   <c:forEach items="${reslist}" var="resdto">
    <tr>
      <td> <a href=""> ${resdto.PNR} </a> </td>
      <td> ${resdto.reservday} </td>
      <td> ${resdto.routeDeparture} </td>
      <td> ${resdto.routeArrival} </td>
      <td> ${resdto.routeTime} </td>
      <td> ${resdto.routeArrivalTime} </td>
      <td> ${resdto.payment} </td>
      <td> ${resdto.state} </td>
    </tr>
   </c:forEach>
  </table>
  
    <div id="paging">
     <c:if test="${pstart != 1}">
      <a href="list?page=${pstart-1}"> « </a>
     </c:if>
     <c:if test="${pstart == 1}">
      «
     </c:if>
       
     <c:if test="${page != 1}">
      <a href="list?page=${page-1}"> ‹ </a>
     </c:if>
     <c:if test="${page == 1}">
      ‹
     </c:if>
       
     <c:forEach var="i" begin="${pstart}" end="${pend}">
       <c:if test="${page == i}">
        <a href="list?page=${i}" style="color:red;"> ${i} </a>
       </c:if>
       <c:if test="${page != i}">
        <a href="list?page=${i}"> ${i} </a>
       </c:if>
     </c:forEach>
       
     <c:if test="${page != chong}">
      <a href="list?page=${page+1}"> › </a>
     </c:if>
     <c:if test="${page == chong}">
      ›
     </c:if>
     
     <c:if test="${pend != chong}">
      <a href="list?page=${pend+1}"> » </a>
     </c:if>
     <c:if test="${pend == chong}">
      »
     </c:if>
   <div>
 </section>
</body>
</html>