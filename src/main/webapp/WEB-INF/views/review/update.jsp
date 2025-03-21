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
		background-color: #f4f6f9;
	}
	main {
		top: -95px;
		position: relative;
	}
	section {
		width:1000px;
		height:550px;
		margin:10px auto;
		padding:20px;
		background-color:#fff;
		border-radius:8px;
		box-shadow:0 2px 10px rgba(0, 0, 0, 0.1);
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
	table {
		width:100%;
		border-collapse: collapse;
		margin-top:20px;
		margin-bottom: 20px;
	}
	th, td {
		padding: 6px;
		text-align: center;
		border-bottom: 1px solid #ddd;
	}
	th {
		background-color: #004EA2;
		color: #fff;
		font-weight: 500;
		text-transform: uppercase;
	}
	td {
		background-color: #fff;
		color: #333;
		font-size: 14px;
	}
	input[type="text"], textarea {
		width: 100%;
		padding: 8px;
		border: 1px solid #ccc;
		border-radius: 4px;
		font-size: 14px;
	}
	textarea {
		height: 120px;
		resize: vertical;
	}
	input[type="submit"], input[type="button"] {
		background-color: #004EA2;
		color: white;
		border: none;
		padding: 8px 15px;
		cursor: pointer;
		border-radius: 4px;
		font-size: 14px;
	}
	input[type="submit"]:hover, input[type="button"]:hover {
		background-color: #003A80;
	}
	#ori img {
		width: 80px;
		height: 80px;
		border-radius: 5px;
		object-fit: cover;
	}
</style>
</head>
<body> <!-- review/update.jsp -->
<main>
	<div class="nullbox"></div>
	<div class="csc"> 여행 후기 </div>
	<div class="cscmc">
		<div class="cscmenu">
			<a href="../gongji/list">공지 사항</a>
			<a href="../inquiry/list">Q＆A</a>
			<a href="../promot/list">이벤트</a>
			<a href="../review/list">여행 후기</a>
		</div>
	</div>
	<section>
		<form method="post" action="updateOk" enctype="multipart/form-data">
			<input type="hidden" name="id" value="${revdto.id}">
			<input type="hidden" name="page" value="${page}">
			<table>
				<tr>
					<th width="200"> 제 목 </th>
					<td>
						<input type="text" name="title" id="title" value="${revdto.title}">
					</td>
				</tr>
				<tr>
					<th> 작성자 </th>
					<td> ${revdto.userid} </td>
				</tr>
				<tr>
					<th> 파 일 </th>
					<td>
						<div id="ori">
							<img src="../static/resources/files/${revdto.fname}">
							<input type="button" value="그림변경" onclick="chg(0)">
						</div>
						<div id="chgImg" id="chgImg" style="display:none;">
							<input type="file" name="file" id="file">
							<input type="button" value="그림취소" onclick="chg(1)">
						</div>
					</td>
				</tr>
				<tr>
					<th> 내 용 </th>
					<td> <textarea name="content" id="content"> ${revdto.content} </textarea> </td>
				</tr>
				<tr>
					<td colspan="3"> <input type="submit" value="수정" id="submit"> </td>
				</tr>
			</table>
		</form>
	</section>
</main>
<script>
	function chg(n) {
		if(n==0) {
			document.getElementById("chgImg").style.display="block";
			document.getElementById("ori").style.display="none";
		}
		else {
			document.getElementById("chgImg").style.display="none";
			document.getElementById("ori").style.display="block";
			document.getElementById("file").value="";
		}
	}
</script>
</body>
</html>