<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    body {
		margin: 0;
		padding: 0;
		background-color: #f4f4f4;
	}
	.container {
		max-width: 800px;
		margin: 20px auto;
		background-color: white;
		padding: 20px;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	}
	table {
		width: 100%;
		border-collapse: collapse;
		margin-bottom: 20px;
	}
	table, th, td {
		border-bottom: 1px solid #ddd;
		padding: 12px;
		text-align: left;
	}
	th {
		background-color: #004EA2;
		color:white;
	}
	#btn {
		text-align: center;
		margin-top: 20px;
	}
	#btn a {
		display: inline-block;
		padding: 10px 15px;
		background-color:#004EA2;
		color: white;
		text-decoration: none;
		border-radius: 5px;
		margin: 0 5px;
	}
	#btn a:hover {
		background-color: #003A66;
	}
	main {
		top: -95px;
		position: relative;
	}
	.nullbox {
		height: 95px;
		display: flex;
		background-color: #078EB9;
	}
	.csc {
		background-color: #078EB9;
		color: white;
		padding: 20px;
		text-align: center;
		font-size: 24px;
		font-weight: 600;
	}
	.cscmc {
		width: 100%;
		background: white;
	}
	.cscmenu {
		width: 600px;
		display: flex;
		justify-content: space-around;
		background: white;
		padding: 10px;
		margin: auto;
	}
	.cscmenu a {
		color: black;
		text-decoration: none;
		font-weight: bold;
	}
  </style>
</head>
<body> <!-- gongji/content.jsp -->
<main>
	<div class="nullbox"></div>
	<div class="csc">고객센터</div>
	<div class="cscmc">
		<div class="cscmenu">
		    <a href="../gongji/list">공지 사항</a>
		    <a href="../inquiry/list">Q＆A</a>
		    <a href="../promot/list">이벤트</a>
		    <a href="../review/list">여행 후기</a>
		</div>
	</div>
	<table>
	  <tr>
		<th>제목</th>
		<td>${gdto.title}</td>
	  </tr>
	  <tr>
		<th>조회수</th>
		<td>${gdto.readnum}</td>
	  </tr>
	  <tr>
		<th>내용</th>
		<td id="content">${gdto.content}</td>
	  </tr>
	</table>
	<div id="btn">
		<a href="list">목록</a>
	</div>
</main>
</body>
</html>