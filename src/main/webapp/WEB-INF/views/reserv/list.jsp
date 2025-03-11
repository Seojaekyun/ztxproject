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
      border-spacing:0px;
      margin-top:10px;
    }
  </style>
</head>
<body> <!-- reserv/list.jsp -->
 <section>
  <table>
    <tr align="center">
      <th> 예약코드 </th>
      <th> 예약날짜 </th>
      <th> 도착지 </th>
      <th> 출발시간 </th>
      <th> 도착시간 </th>
      <th> 금 액 </th>
      <th> 결제여부 </th>
    </tr>
   <c:forEach items="${reslist}" var="resdto">
    <tr align="center">
      <td> ${resdto.PNR} </td>
      <td> ${resdto.reservday} </td>
      <td> ${resdto.routeDeparture} </td>
      <td> ${resdto.routeTime} </th>
      <td> ${resdto.routeArrivalTime} </td>
      <td> ${resdto.payment} </td>
      <td> ${resdto.state} </td>
    </tr>
   </c:forEach>
  </table>
  
    <div>
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