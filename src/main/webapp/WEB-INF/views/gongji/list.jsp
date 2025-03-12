<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> <!-- /gongji/list.jsp -->
 <section>
  <h3> 공지사항 </h3>
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
                    <a href="gongjiContent?id=${gdto.id}">${gdto.title}</a>
                </td>
                <td>${gdto.writer}</td>
                <td>${gdto.readnum}</td>
                <td>${gdto.writeday}</td>
            </tr>
        </c:forEach>
   </table>
 </section>
</body>
</html>