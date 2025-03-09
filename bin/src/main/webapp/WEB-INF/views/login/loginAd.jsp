<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<style>
	.accountbox {
		width: 500px;
		height: 400px;
		margin: auto;
		text-align: center;
		margin-top: 100px;
		border: 1px solid #D2D2D2;
		border-radius: .4rem;
		padding-left: 20px;  /* 좌측 여백 */
		padding-right: 20px; /* 우측 여백 */
	}
	form > div {
		position:relative;
		width:390px;
		height:40px;
		border:1px solid #D2D2D2;
		border-radius: .4rem;
		margin:auto;
		margin-top:10px;
		text-align:left;
	}
	form > div > .inner {
		position: absolute;
		transform: translateY(40%); /* 수직 중앙 정렬 보정 */ 
		left: 9px;
		top: -2px;
		opacity: 0.6;
		background:#fff;
		z-index:1;
	}
	div input {
		position:relative;
		z-index:0;
		border:none;
		outline:none;
		margin-top:28px;
		margin-left:10px;
		font-size:15px;
		cursor:pointer;
	}
	h2 {
		padding-top:20px;
		padding-bottom: 30px;
	}
	#txt {
		margin-top: 8px;
		width:372px;
		height:30px;
		color: black;
	}
	#pwd  {
		margin-top: 8px;
		width: 372px;
		height: 30px;
	}
	#sub {
		width: 392px;
		height: 40px;
		background: black;
		color: white;
		border: 1px solid black;
		font-size: 16px;
		border-radius: .4rem;
		margin-top: 20px;
		margin-left: -1px;
	}
</style>
<script>
	function check(my) {
		if(my.adminid.value.trim().length==0) {
			alert("아이디를 입력하세요");
			return false;
		}
		else if(my.pwd.value.trim().length==0) {
			alert("비밀번호를 입력하세요");
			return false;
		}
		else {
			return true;
		}    	
	}

	var fs1=22;
	var fs2=22;
	
	function sizedown(n) {
		var num;
		if(n==0) { num=fs1; }
		else { num=fs2; }
		if(num!=11) {
			s1=setInterval(function() {
				num--;
				document.getElementsByClassName("inner")[n].style.fontSize=num+"px";
				document.getElementsByClassName("inner")[n].style.top="-15px";
				document.getElementsByClassName("inner")[n].style.opacity=1;
				
				if(num==11) {
					clearInterval(s1);
					if(n==0) { fs1=11; }
	     		    else { fs2=11; }
				}
			},10);
		}
	}
	
	function init(my,n) {
		if(my.value.trim().length==0) {
			if(n==0) { num=fs1; }
			else { num=fs2; }
			s2=setInterval(function() {
				num++;
				document.getElementsByClassName("inner")[n].style.fontSize=num+"px";
				document.getElementsByClassName("inner")[n].style.top="-5px";
				document.getElementsByClassName("inner")[n].style.opacity=0.6;
				
				if(num>=18) {
					console.log(num);
					clearInterval(s2);
					if(n==0) { fs1=18; }
					else{ fs2=18; }
				}
			},20);
		}
	}
	
	window.onload=function() { document.getElementById("txt").focus(); }
	
	function useridSearch() {
		son=open("usForm","","width=400,height=300");
		son.moveTo(200,200);
	}
	
	function pwdSearch() {
		son=open("psForm","","width=400,height=370");
		son.moveTo(200,200);
	}
	
</script>
</head>
<body>
	<div class="accountbox"> 
		<form method="post" action="loginAdmin" onsubmit="return check(this)">
			<h2> 관리자 로그인 </h2>
			<div> 
				<div class="inner">아이디</div>
				<input type="text" name="adminid" value="administrator" id="txt" onfocus="sizedown(0)" onblur="init(this,0)">
			</div>
			<div> 
				<div class="inner">비밀번호</div>
				<input type="password" name="pwd" value="123456" id="pwd" onfocus="sizedown(1)" onblur="init(this,1)"> 
			</div>
			<p align="center"> <input type="submit" value="로그인" id="sub"> </p>
			<p> 아이디찾기 | 비밀번호 찾기 </p>
		</form> 
	</div>
    
</body>
</html>