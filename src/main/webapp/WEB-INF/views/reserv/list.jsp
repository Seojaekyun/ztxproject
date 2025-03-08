<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    
  </style>
</head>
<body> <!-- reserv/list.jsp -->
 <section>
  <table>
    <tr>
      <td> 예약코드 </td>
      <td> 예약날짜 </td>
      <td> 도착지 </td>
      <td> 출발시간 </td>
      <td> 도착시간 </td>
      <td> 금 액 </td>
      <td> 결제여부 </td>
    </tr>
   <c:forEach items="${reslist}" var="resdto">
    <tr>
      <td> ${resdto.PNR} </td>
      <td> ${resdto.reservday} </td>
      <td> ${resdto.routeDeparture} </td>
      <td> ${resdto.routeTime} </td>
      <td> ${resdto.routeArrivalTime} </td>
      <td> ${resdto.payment} </td>
      <td> ${resdto.state} </td>
    </tr>
  </c:forEach>
  </table>
 </section>
</body>
</html>