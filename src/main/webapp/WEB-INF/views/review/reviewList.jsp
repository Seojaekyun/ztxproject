<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> <!-- review/reviewList.jsp -->
 <section>
  <h3> 여행 후기 </h3>
   <div align="right"> <a href="reviewWrite"> 작성하기 </a> </div>
   <table>
     <tr>
       <td> 제 목 </td>
       <td> 작성자 </td>
       <td> 조회수 </td>
       <td> 작성일 </td>
     </tr>
    <c:forEach items="${revlist}" var="revdto">
     <tr>
       <td> ${revdto.title} </td>
       <td> ${revdto.userid} </td>
       <td> ${revdto.readnum} </td>
       <td> ${revdto.writeday} </td>
     </tr>
    </c:forEach> 
   </table>
 </section> 
</body>
</html>