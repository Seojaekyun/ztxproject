<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>문의 답변</title>
<style>
    body { 
    background-color: #f4f6f9; 
    margin: 0; 
    padding: 0; 
    }
    section { 
    max-width: 600px; 
    margin: 30px auto; 
    padding: 20px; 
    background-color: #fff; 
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); 
    }
    table { 
    width: 100%; 
    border-collapse: collapse; 
    margin-bottom: 20px; 
    }
    th, td { 
    padding: 8px; 
    text-align: left; 
    border-bottom: 1px solid #ddd; 
    }
    th { 
    background-color: #004EA2; 
    color: white; 
    font-weight: 500; 
    }
    textarea { 
    width: 100%; 
    height: 100px; 
    padding: 10px; 
    border: 1px solid #ddd; 
    border-radius: 5px; 
    }
    button { 
    padding: 8px 12px; 
    background-color: #004EA2; 
    color: white; 
    border: none; 
    cursor: pointer; 
    border-radius: 5px;
    display: inline-block;
    }
    .delete-btn { 
    background-color: #D9534F; 
    }
    a {
    	text-decoration: none;
    }
</style>
</head>
<body>

<h2>문의 답변</h2>
<section>
    <table>
    	<tr>
    		<th>아이디</th>
    		<td>${inquiry.userid}</td>
    	</tr>
    	<tr>
    		<th>전화번호</th>
    		<td>${inquiry.phone}</td>
    	</tr>
        <tr>
            <th>작성자</th>
            <td>${inquiry.name}</td>
        </tr>
        <tr>
            <th>제목</th>
            <td>${inquiry.title}</td>
        </tr>
        <tr>
            <th>문의 내용</th>
            <td>${inquiry.content}</td>
        </tr>
        <tr>
            <th>답변</th>
            <td>
                <form action="/admin/answerOk" method="post">
                    <input type="hidden" name="id" value="${inquiry.id}">
                    <textarea name="answer">${inquiry.answer}</textarea>
                    <button type="submit">답변 저장</button>
                    <a href="/admin/answerDel?id=${inquiry.id}">
                	    <button type="button" class="delete-btn">답변 삭제</button>
                	</a>
                	<a href="inquiryList"><button>목록으로</button></a>
                </form>
            </td>
        </tr>
    </table>
</section>

</body>
</html>
