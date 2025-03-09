<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
  body {
    font-family:Arial, sans-serif;
    background-color:#f4f4f4;
    margin:0;
    padding:0;
  }
  section {
    max-width:500px;
    margin:50px auto;
    background:white;
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
    margin-bottom:25px;
  }
  section input, select {
    width:100%;
    padding:10px;
    margin:5px 0;
    border:1px solid #ccc;
    border-radius:4px;
    font-size:16px;
    box-sizing:border-box;
  }
  input[type="submit"],
  input[type="button"] {
    width:49%;
    cursor:pointer;
    border:none;
    padding:12px;
  }
  input[type="text"]:focus,
  input[type="password"]:focus {
    border-color:#66afe9;
    outline:none;
  }
  section #submit {
    background-color:#083B82;
    color:white;
  }
  section #submit:hover {
    background-color:#45a049;
  }
  section .email-container {
    display:flex;
    align-items:center;
    gap:5px;
  }
  section .email-container input {
    flex:1;
  }
  section .email-container select {
    width:44%;
  }
  section #umsg, #pmsg {
    font-size:12px;
  }
</style>
<script>
  function useridCheck(userid)
  {
	  userid=userid.trim();
	  
	  if(userid.length >= 6)
	  {
		  var chk=new XMLHttpRequest();
		  chk.onload=function()
		  {
			  //alert(chk.responseText);
			  if(chk.responseText == "0")
			  {
				  document.getElementById("umsg").innerText="사용 가능한 아이디";
				  document.getElementById("umsg").style.color="blue";
				  uchk=1;
			  }
			  else
			  {
				  document.getElementById("umsg").innerText="사용 불가능한 아이디";
				  document.getElementById("umsg").style.color="red";
				  uchk=0;
			  }  
			  
		  }
		  chk.open("get", "useridCheck?userid="+userid);
		  chk.send();
	  }
	  else
	  {
		  document.getElementById("umsg").innerText="아이디의 길이는 6자 이상입니다";
		  document.getElementById("umsg").style.color="red";
		  uchk=0;
	  }
  }
  
  function pwdCheck()
  {
  	var pwd=document.uform.pwd.value;
  	var pwd2=document.uform.pwd2.value;
  	
  	if(pwd2.length != 0)
  	{
  		if(pwd == pwd2)
  		{
  			document.getElementById("pmsg").innerText="비밀번호가 일치합니다";
  			document.getElementById("pmsg").style.color="blue";
  			pchk=1;
  		}
  		else
  		{
  			document.getElementById("pmsg").innerText="비밀번호가 일치하지 않습니다";
  			document.getElementById("pmsg").style.color="red";
  			pchk=0;
  		}
  	}
  }
  
  function getServer(gs)
  { 
  	document.mform.server.value=gs.value;  	
  }
  
  var uchk=0;
  var pchk=0;
  function check()
  {
	  var emailOk=document.uform.uid.value+"@"+document.uform.dserver.value;
	  document.uform.email.value=emailOk;
	  
	  if(uchk == 0)
	  {
		  return false;
	  }
	  else if(pchk == 0)
	  {
		  return false;
	  }
	  else if(document.uform.name.value.trim() == "")
	  {
		  alert("이름을 입력하세요.");
		  return false;
	  }
	  else if(document.uform.phone.value.trim() == "")
	  {
		  alert("전화번호를 입력하세요.");
		  return false;
	  }
	  else
	  {
		  return true;
	  }
  }
</script>
</head>
<body> <!-- user/user.jsp -->
 <section>
  <form method="post" name="uform" action="userOk" onsubmit="return check()">
    <input type="hidden" name="email">
    <h3>회원 가입</h3>
    <div>
      <input type="text" name="userid" onblur="useridCheck(this.value)" id="txt" placeholder="아이디(6자이상)">
      <br> <span id="umsg"> </span>
    </div>
    <div> 
      <input type="text" name="name" id="txt" placeholder="이 름"> 
    </div>
    <div> 
      <input type="password" name="pwd" onkeyup="pwdCheck()" id="txt" placeholder="비밀번호"> 
    </div>
    <div>
      <input type="password" name="pwd2" onkeyup="pwdCheck()" id="txt" placeholder="비밀번호 확인">
      <br> <span id="pmsg"> </span>
    </div>
    <div class="email-container">
      <input type="text" name="uid" class="email"> @
      <select name="dserver" id="select" onchange="getServer(this)">
        <option value="naver.com"> naver.com </option>
        <option value="daum.net"> daum.net </option>
        <option value="gmail.com"> gmail.com </option>
        <option value="kakao.com"> kakao.com </option>
      </select>
    </div>
    <div> 
      <input type="text" name="phone" id="txt" placeholder="전화번호"> 
    </div>
    <div> 
      <input type="button" value="취 소" id="button" onclick="location='../main/index'">
      <input type="submit" value="회원 가입" id="submit">
    </div>
  </form> 
 </section>
</body>
</html>
