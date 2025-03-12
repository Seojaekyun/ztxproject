<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
  <style>
  body {
    font-family:'Arial', sans-serif;
    background-color:#f4f7fa;
    margin:0;
    padding:0;
  }
  section {
    background-color:white;
    padding:20px;
    border-radius:8px;
    box-shadow:0 4px 8px rgba(0, 0, 0, 0.1);
    width:100%;
    max-width:600px;
    margin:50px auto;
  }
  h3 {
    font-size:24px;
    font-weight:bold;
    color:#333;
    text-align:center;
    margin-bottom:20px;
  }
  table {
    width:100%;
    border-spacing:0;
    margin-top:10px;
  }
  table tr td {
    padding:10px;
    font-size:16px;
    color:#333;
    text-align:left;
  }
  table tr td:first-child {
    font-weight:bold;
    width:120px;
  }
  table tr td:last-child {
    width:75%;
  }
  input[type="text"],
  input[type="password"] {
    width:90%;
    padding:10px;
    margin:5px 0;
    border:1px solid #ddd;
    border-radius:5px;
    font-size:14px;
  }
  input[type="text"]:focus,
  input[type="password"]:focus {
    border-color:#66afe9;
    outline:none;
  }
  #btn {
    display:flex;
    justify-content:center;
    align-items:center;
    gap:20px;
    margin-top:20px;
  }
  input[type="submit"],
  input[type="button"] {
    width:35%;
    cursor:pointer;
    border:none;
    border-radius:5px;
    padding:12px;
  }
  section #submit {
    background-color:#083B82;
    color:white;
  }
  section #submit:hover {
    background-color:#45a049;
  }
  section #pmsg, #pmsg2, #pmsg3 {
    font-size:13px;
    margin-bottom:2px;
    display:block;
  }
  form {
    margin-top:10px;
  }
  </style>
  <script>
    function pwdCheck()
    {
    	var oPwd=document.vform.oPwd.value.trim();
    	
    	var chk=new XMLHttpRequest();
    	chk.onload=function()
    	{
    		//alert(chk.responseText);
    		if(chk.responseText=="0")
    		{
    			document.getElementById("pmsg").innerText="비밀번호가 일치하지 않습니다.";
    			document.getElementById("pmsg").style.color="red";
    		}
    		else
    		{
    			document.getElementById("pmsg").innerText="";
    		}
    	}
    	chk.open("get", "pwdCheck?oPwd="+oPwd);
    	chk.send();
    }
    function newPwd()
    {
    	var oPwd=document.vform.oPwd.value.trim();
		var nPwd=document.vform.pwd.value.trim();
		var nPwd2=document.vform.nPwd2.value.trim();
		
		if(nPwd.length == 0)
		{
			document.getElementById("pmsg2").innerText="";
			document.getElementById("pmsg3").innerText="";
			return;
		}
		
		if(oPwd == nPwd)
		{
			document.getElementById("pmsg2").innerText="이전과 같은 비밀번호입니다.";
			document.getElementById("pmsg2").style.color="red";
		}
		else
		{
			document.getElementById("pmsg2").innerText="";
		}
		
		if(nPwd == nPwd2)
		{
			document.getElementById("pmsg3").innerText="비밀번호가 일치합니다";
			document.getElementById("pmsg3").style.color="blue";
		}
		else
		{
			document.getElementById("pmsg3").innerText="비밀번호가 일치하지 않습니다.";
			document.getElementById("pmsg3").style.color="red";
		}
	}
  </script>
</head>
<body> <!-- user/userView.jsp -->
 <section>
  <form method="post" name="vform" action="updateOk">
  <table>
    <h3> 회원 정보 </h3> 
    <tr>
      <td> 아이디 </td>
      <td> ${udto.userid} </td>
    </tr>
    <tr>
      <td> 이 름 </td>
      <td> ${udto.name} </td>
    </tr>
    <tr>
      <td> 이메일 </td>
      <td>
        <input type="text" id="email" name="email" value="${udto.email}">
      </td>
    </tr>
    <tr>
      <td> 비밀번호 변경 </td>
      <td>
        <input type="password" name="oPwd" onblur="pwdCheck()" placeholder="현재 비밀번호">
        <span id="pmsg"> </span>
        <input type="password" name="pwd" onkeyup="newPwd()" placeholder="새 비밀번호">
        <span id="pmsg2"> </span> 
        <input type="password" name="nPwd2" onkeyup="newPwd()" placeholder="비밀번호 확인">
        <span id="pmsg3"> </span>
      </td>
    </tr>
    <tr>
      <td> 전화번호 </td>
      <td>
        <input type="text" id="phone" name="phone" value="${udto.phone}">
      </td>
    </tr>
  </table>
    <div id="btn">
      <input type="button" value="회원 탈퇴" id="button" onclick="">
      <input type="submit" value="수 정" id="submit">
    </div>
  </form>  
 </section>
</body>
</html>