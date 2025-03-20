<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>추천 여행 상품</title>
<style>
	body { 
		background: #f9f9f9; 
		margin: 0; 
		padding: 0; 
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
	.container { 
		width: 1200px; 
		margin: 0 auto; 
		padding: 30px 0; 
	}
	h2 { 
		font-size: 24px; 
		font-weight: bold; 
		margin-bottom: 30px; 
	}
	.grid { 
		display: grid; 
		grid-template-columns: repeat(4, 1fr); 
		gap: 20px; 
	}
	.card { 
		position: relative; 
		background: white;
		border-radius: 15px; 
		overflow: hidden; 
		box-shadow: 0 2px 10px rgba(0,0,0,0.1); 
		transition: 0.3s; 
	}
	.card:hover { 
		transform: translateY(-5px); 
	}
	.badge { 
		position: absolute; 
		top: 15px; 
		left: 15px; 
		background: #003b8b; 
		color: white; 
		padding: 5px 10px; 
		border-radius: 50px; 
		font-size: 12px; 
		z-index: 1; 
	}
	.card img { 
		width: 100%; 
		height: 220px; 
		object-fit: cover; 
	}
	.card-body { 
		padding: 15px; 
	}
	.card-body .desc { 
		font-size: 14px; 
		color: #555; 
		margin-bottom: 5px; 
	}
	.card-body .price { 
		font-size: 16px; 
		font-weight: bold; 
		color: #00aa66; 
		margin-bottom: 10px; 
	}
	.btn { 
		display: inline-block; 
		padding: 6px 14px; 
		background: #00aa66; 
		color: white; 
		text-decoration: none; 
		border-radius: 20px; 
		font-size: 13px; 
	}
	.heart { 
		position: absolute; 
		bottom: 15px; 
		right: 15px; 
		color: #ff6b6b; 
		font-size: 14px; 
		display: flex; 
		align-items: center; 
		gap: 3px; 
	}
	.csc {
		background-color: #078EB9;
		color: white;
		padding: 20px;
		text-align: center;
		font-size: 24px;
		font-weight: 600;
	}
</style>
</head>
<body>
<main>
	<div class="nullbox"></div>
	<div class="csc">테마 여행</div>
	<div class="container">
	    <div class="grid">
	       
	        <div class="card">
	            <div class="badge">전라권</div>
	            <img src="../static/resources/theme/ham.jpg">
	            <div class="card-body">
	                <div class="desc">[지역사랑-함평군] 당일-자유여행상품</div>
	                <div class="price">45,000원</div>
	                <a href="" class="btn">바로가기</a>
	            </div>
	            <div class="heart">❤ 0</div>
	        </div>
	        
	        <div class="card">
	            <div class="badge">강원권</div>
	            <img src="../static/resources/theme/sam.jpg">
	            <div class="card-body">
	                <div class="desc">[지역사랑-삼척시] 당일-자유여행상품</div>
	                <div class="price">32,200원</div>
	                <a href="" class="btn">바로가기</a>
	            </div>
	            <div class="heart">❤ 0</div>
	        </div>
	
	        <div class="card">
	            <div class="badge">전라권</div>
	            <img src="../static/resources/theme/mu.jpg">
	            <div class="card-body">
	                <div class="desc">[지역사랑-무주군] 당일-자유여행상품</div>
	                <div class="price">10,000원</div>
	                <a href="" class="btn">바로가기</a>
	            </div>
	            <div class="heart">❤ 0</div>
	        </div>
	
			<div class="card">
	            <div class="badge">강원권</div>
	            <img src="../static/resources/theme/jung.jpg">
	            <div class="card-body">
	                <div class="desc">[지역사랑-삼척시] 당일-자유여행상품</div>
	                <div class="price">30,200원</div>
	                <a href="" class="btn">바로가기</a>
	            </div>
	            <div class="heart">❤ 0</div>
	        </div>
	        
			<div class="card">
	            <div class="badge">전라권</div>
	            <img src="../static/resources/theme/kim.jpg">
	            <div class="card-body">
	                <div class="desc">[지역사랑-김제시] 당일-자유여행상품</div>
	                <div class="price">10,000원</div>
	                <a href="" class="btn">바로가기</a>
	            </div>
	            <div class="heart">❤ 0</div>
	        </div>
	        
	        <div class="card">
	            <div class="badge">충청권</div>
	            <img src="../static/resources/theme/bo.jpg">
	            <div class="card-body">
	                <div class="desc">[지역사랑-보령시] 당일-자유여행상품</div>
	                <div class="price">34,800원</div>
	                <a href="" class="btn">바로가기</a>
	            </div>
	            <div class="heart">❤ 0</div>
	        </div>
	        
	        <div class="card">
	            <div class="badge">충청권</div>
	            <img src="../static/resources/theme/gong.jpg">
	            <div class="card-body">
	                <div class="desc">[지역사랑-공주시] 당일-자유여행상품</div>
	                <div class="price">45,700원</div>
	                <a href="" class="btn">바로가기</a>
	            </div>
	            <div class="heart">❤ 0</div>
	        </div>
	        
	        <div class="card">
	            <div class="badge">경상권</div>
	            <img src="../static/resources/theme/young.jpg">
	            <div class="card-body">
	                <div class="desc">[지역사랑-영덕군] 당일-자유여행상품</div>
	                <div class="price">26,100원</div>
	                <a href="" class="btn">바로가기</a>
	            </div>
	            <div class="heart">❤ 0</div>
	        </div>
	        
	        <div class="card">
	            <div class="badge">충청권</div>
	            <img src="../static/resources/theme/san.jpg">
	            <div class="card-body">
	                <div class="desc">[지역사랑-괴산군] 당일-자유여행상품</div>
	                <div class="price">31,800원</div>
	                <a href="" class="btn">바로가기</a>
	            </div>
	            <div class="heart">❤ 0</div>
	        </div>
	        
	        <div class="card">
	            <div class="badge">충청권</div>
	            <img src="../static/resources/theme/non.jpg">
	            <div class="card-body">
	                <div class="desc">[지역사랑-논산시] 당일-자유여행상품</div>
	                <div class="price">56,200원</div>
	                <a href="" class="btn">바로가기</a>
	            </div>
	            <div class="heart">❤ 0</div>
	        </div>
	        
	        <div class="card">
	            <div class="badge">강원권</div>
	            <img src="../static/resources/theme/youngwall.jpg">
	            <div class="card-body">
	                <div class="desc">[지역사랑-영월군] 당일-자유여행상품</div>
	                <div class="price">33,300원</div>
	                <a href="" class="btn">바로가기</a>
	            </div>
	            <div class="heart">❤ 0</div>
	        </div>
	    </div>
	<br>
	<h2>인기 여행 상품</h2>
		<div class="grid">
		
			<div class="card">
	            <div class="badge">강원권</div>
	            <img src="../static/resources/theme/tae.jpg">
	            <div class="card-body">
	                <div class="desc">[지역사랑-태백시] 당일-자유여행상품</div>
	                <div class="price">27,400원</div>
	                <a href="" class="btn">바로가기</a>
	            </div>
	            <div class="heart">❤ 0</div>
	        </div>
	        
	        <div class="card">
	            <div class="badge">충청권</div>
	            <img src="../static/resources/theme/je.jpg">
	            <div class="card-body">
	                <div class="desc">[지역사랑-제천시] 당일-자유여행상품</div>
	                <div class="price">30,600원</div>
	                <a href="" class="btn">바로가기</a>
	            </div>
	            <div class="heart">❤ 0</div>
	        </div>
	        
	        <div class="card">
	            <div class="badge">충청권</div>
	            <img src="../static/resources/theme/okchun.jpg">
	            <div class="card-body">
	                <div class="desc">[지역사랑-옥천군] 당일-자유여행상품</div>
	                <div class="price">5,200원</div>
	                <a href="" class="btn">바로가기</a>
	            </div>
	            <div class="heart">❤ 0</div>
	        </div>
	        
	        <div class="card">
	            <div class="badge">경상권</div>
	            <img src="../static/resources/theme/mungyung.jpg">
	            <div class="card-body">
	                <div class="desc">[지역사랑-문경군] 당일-자유여행상품</div>
	                <div class="price">34,800원</div>
	                <a href="" class="btn">바로가기</a>
	            </div>
	            <div class="heart">❤ 0</div>
	        </div>
	        
	        <div class="card">
	            <div class="badge">경상권</div>
	            <img src="../static/resources/theme/chungdo.jpg">
	            <div class="card-body">
	                <div class="desc">[지역사랑-청도군] 당일-자유여행상품</div>
	                <div class="price">5,200원</div>
	                <a href="" class="btn">바로가기</a>
	            </div>
	            <div class="heart">❤ 0</div>
	        </div>
	        
	        <div class="card">
	            <div class="badge">전라권</div>
	            <img src="../static/resources/theme/juneupg.jpg">
	            <div class="card-body">
	                <div class="desc">[지역사랑-정읍시] 당일-자유여행상품</div>
	                <div class="price">10,000원</div>
	                <a href="" class="btn">바로가기</a>
	            </div>
	            <div class="heart">❤ 0</div>
	        </div>
	        
	        <div class="card">
	            <div class="badge">충청권</div>
	            <img src="../static/resources/theme/dan.jpg">
	            <div class="card-body">
	                <div class="desc">[지역사랑-단양군] 당일-자유여행상품</div>
	                <div class="price">36,000원</div>
	                <a href="" class="btn">바로가기</a>
	            </div>
	            <div class="heart">❤ 0</div>
	        </div>
	        
		</div>
	<br>
	<h2>전연령대 상품 추천</h2>
		<div class="grid">
		
			<div class="card">
	            <div class="badge">경상권</div>
	            <img src="../static/resources/theme/milyang.jpg">
	            <div class="card-body">
	                <div class="desc">[지역사랑-밀양시] 1박2일-자유여행상품(ZTX)</div>
	                <div class="price">86,600원</div>
	                <a href="" class="btn">바로가기</a>
	            </div>
	            <div class="heart">❤ 0</div>
	        </div>
	        
	        <div class="card">
	            <div class="badge">경상권</div>
	            <img src="../static/resources/theme/chungdo2.jpg">
	            <div class="card-body">
	                <div class="desc">[지역사랑-청도군] 당일 자유여행(ZTX)</div>
	                <div class="price">22,000원</div>
	                <a href="" class="btn">바로가기</a>
	            </div>
	            <div class="heart">❤ 0</div>
	        </div>
	        
		</div>
	</div>
</main>
</body>
</html>