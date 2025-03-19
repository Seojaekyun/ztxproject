<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> <!-- review/update.jsp -->
 <form method="post" action="updateOk">
  <table>
	<tr>
	  <th> 제 목 </th>
	  <td> <input type="text" name="title" id="title" value="${revdto.title}"> </td>
	</tr>
	<tr>
	  <th> 작성자 </th>
	  <td> ${revdto.userid} </td>
	</tr>
	<tr>
	  <th> 파 일 </th>
	  <td> ${revdto.fname} </td>
	</tr>
	<tr>
	  <th> 내 용 </th>
	  <td> <textarea name="content" id="content"> ${revdto.content} </textarea> </td>
	</tr>
	<tr>
	  <td> <input type="submit" value="수정" id="submit"> </td>
	</tr>
  </table>
 </form> 
</body>
</html>