<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
  <style>
    body {
      font-family:'Arial', sans-serif;
      background-color:#f4f7fa;
      display:flex;
      justify-content:center;
      align-items:center;
      height:100vh;
      margin:0;
    }
    #uform {
      background-color:white;
      padding:30px;
      border-radius:8px;
      box-shadow:0 4px 8px rgba(0, 0, 0, 0.1);
      width:100%;
      max-width:400px;
      text-align:center;
    }
    #uform h4 {
      margin-bottom:20px;
      font-size:22px;
      color:#333;
    }
    #uform input {
      width:100%;
      padding:12px;
      margin:10px 0;
      border:1px solid #ddd;
      border-radius:8px;
      font-size:16px;
    }
    #uform input[type="button"] {
      background-color:#083B82;
      color:white;
      cursor:pointer;
    }
    #uform input[type="button"]:hover {
      background-color:#45a049;
    }
    #view {
      margin-top:20px;
      text-align:center;
      font-size:16px;
      font-weight:bold;
      color:#333;
    }
    .footer-links {
      display:flex;
      justify-content:center;
      gap:20px;
      font-size:14px;
      margin-top:10px;
    }
    .footer-links span {
      cursor:pointer;
      text-decoration:none;
      color:#083B82;
    }
    .footer-links span:hover {
      text-decoration:underline;
    }
  </style>
  <script>
  function getUserid(form)
  {
	    var name = form.name.value;
	    var email = form.email.value;
	    
	    if (!name || !email)
	    {
	        alert("빈칸이 있습니다	.");
	        return;
	      }

	    var chk = new XMLHttpRequest();
	    chk.onload = function () {
	        document.getElementById("uform").style.display="none";
	        document.getElementById("uform").name.value ="";
	        document.getElementById("uform").email.value="";
	        document.getElementById("view").innerText = "아이디 : " + (chk.responseText.trim() || "존재하지 않는 사용자입니다.");
	    };
	    chk.open("get", "/login/getUserid?name="+name+"&email="+email);
	    chk.send();
	}
  </script>
</head>
<body> <!-- login/fUserid.jsp -->
  <form id="uform">
    <h4> 아이디 찾기 </h4>
    <div> <input type="text" name="name" id="txt" placeholder="이 름"> </div>
    <div> <input type="text" name="email" id="txt" placeholder="이메일"> </div>
    <div>
      <input type="button" value="아이디 찾기" id="submit" onclick="getUserid(this.form)">
    </div>
  </form>
  
  <div id="view"></div>
</body>
</html>