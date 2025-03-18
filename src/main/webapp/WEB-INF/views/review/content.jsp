<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> <!-- review/content.jsp -->
 <section>
  <table> 
   <tr>
     <td> 제 목 </td>
     <td> ${revdto.title} </td>
   </tr>
   <tr>
     <td> 작성자 </td>
     <td> ${revdto.userid} </td>
     <td> 조회수 </td>
     <td> ${revdto.readnum} </td>
   </tr>
   <tr>
     <td> 사 진 </td>
     <td> ${revdto.fname} </td>
   </tr>
   <tr>
     <td> 작성일 </td>
     <td> ${revdto.content} </td>
   </tr>
  </table>
    <div id="btn">
      <a href="list"> 목록 </a>
     <c:if test="${userid == revdto.userid}">
       <a href="update?id=${revdto.id}&page=${page}"> </a>
       <a href="delete?id=${revdto.id}&page=${page}"> </a>
     </c:if>
    </div>
 </section>
</body>
</html>