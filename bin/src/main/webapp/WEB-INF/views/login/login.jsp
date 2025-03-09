<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
  body {
    font-family:Arial, sans-serif;
    background-color:#f4f4f4;
    margin:0;
    padding:0;
  }
  section {
    width:100%;
    max-width:500px;
    margin:50px auto;
    background-color:white;
    padding:30px;
    border-radius:8px;
    box-shadow:0 4px 8px rgba(0, 0, 0, 0.1);
  }
  section div {
    margin-top:10px;
  }
  section h3 {
    text-align:center;
    color:#333;
    font-size:24px;
    margin-bottom:30px;
  }
  input[type="text"],
  input[type="password"],
  input[type="submit"] {
    width:100%;
    padding:12px;
    margin:5px 0;
    border:1px solid #ccc;
    border-radius:4px;
    box-sizing:border-box;
    font-size:16px;
  }
  input[type="text"]:focus,
  input[type="password"]:focus {
    border-color:#66afe9;
    outline:none;
  }
  section #submit {
    background-color:#083B82;
    color:white;
    border:none;
    cursor:pointer;
    font-size:18px;
    transition:background-color 0.3s ease;
  }
  section #submit:hover {
    background-color: #45a049;
  }
  section .error-message {
    font-size:12px;
    color:red;
    margin-top:5px;
  }
  section a {
    text-decoration:none;
    color:#083B82;
  }
  section .footer-links {
    display:flex;
    justify-content:center;
    gap:20px;
    font-size:14px;
    margin-top:10px;
  }
  section .footer-links span {
    cursor:pointer;
    text-decoration:none;
  }
  section .footer-links a {
    text-decoration: none;
    color:#083B82;
  }
  a {
  	text-decoration: none;
  }
</style>
<script>
  function findU()
  {
	open("fUserid","op","width=600,height=500");
  }
  function findP()
  {
	open("fPassword","op","width=600,height=500");  
  }
  function check()
  {
	  if(document.lform.userid.value.trim() == "")
	  {
		  alert("아이디를 입력하세요.")
		  return false;
	  }
	  else if(document.lform.pwd.value.trim() == "")
	  {
		  alert("비밀번호를 입력하세요.")
		  return false;
	  }
	  else
	  {
		  return true;
	  }  
  }
</script>
</head>
<body> <!-- login/login.jsp -->
 <section>
  <h3>로그인</h3>
  <form method="post" action="loginOk" name="lform" onsubmit="return check()">
    <div> 
      <input type="text" name="userid" id="txt" placeholder="아이디"> 
    </div>
    <div>
      <input type="password" name="pwd" id="txt" placeholder="비밀번호">
     <c:if test="${err == 1}">
      <br> <span style="font-size:12px; color:red;"> 아이디 혹은 비밀번호가 틀렸습니다. </span>
     </c:if>
    </div>
    <div> 
      <input type="submit" value="로그인" id="submit"> 
    </div>
    <div class="footer-links">
      <span onclick="findU()">아이디 찾기</span> |
      <span onclick="findP()">비밀번호 찾기</span> |
      <span onclick="location='../user/user'">회원가입</span>
    </div>
  </form>
	
 </section>
 <a href="loginAd"><span style="font-size: 30px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></a>
</body>
</html>
