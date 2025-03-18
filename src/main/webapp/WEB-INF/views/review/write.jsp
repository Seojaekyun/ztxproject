<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> <!-- review/write.jsp -->
  <section>
    <form method="post" action="writeOk" enctype="multipart/form-data">
	<h3>공지사항 작성</h3>
	<div>
	  <input type="text" name="title" placeholder="제 목" required>
	</div>
	<div>
	  <input type="file" name="file">
	</div>
	<div>
	  <textarea name="content" placeholder="공지 내용" required> </textarea>
	</div>
	<div> <input type="submit" value="등록"> </div>
	</form>
  </section>

</body>
</html>