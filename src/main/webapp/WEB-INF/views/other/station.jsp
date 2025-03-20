<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>ava"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>역 안내</title>
<style>
.container {
	width: 1100px;
	margin: 0 auto;
}

.tab ul {
	display: flex;
	gap: 10px;
	margin-bottom: 25px;
	margin-top: 30px;
	list-style: none;
	padding: 0;
}

.tab ul li {
	border: 1px solid #ccc;
	border-radius: 5px;
	background: #f1f1f1;
}

.tab ul li.active {
	background: #003b8b;
}

.tab ul li.active a {
	color: #fff;
}

.tab ul li a {
	display: block;
	padding: 12px 25px;
	color: #333;
	text-decoration: none;
	font-size: 16px;
}

.search-bar {
	display: flex;
	justify-content: flex-end;
	margin-bottom: 15px;
	align-items: center;
	gap: 8px;
}

.search-bar input {
	padding: 10px;
	width: 250px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.search-bar img {
	width: 30px;
	height: 30px;
	cursor: pointer;
}

table {
	width: 1100px;
	border-collapse: collapse;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

table th, table td {
	padding: 14px 12px;
	border-bottom: 1px solid #ddd;
	font-size: 15px;
	text-align: center;
}

table th {
	background: #f8f8f8;
	font-weight: 600;
}

.btn-group button {
	padding: 6px 12px;
	margin-right: 5px;
	border: 1px solid #333;
	background: #003b8b;
	cursor: pointer;
	border-radius: 4px;
	font-size: 14px;
	color: white;
}

.csc {
	background-color: #078EB9;
	color: white;
	padding: 20px;
	text-align: center;
	font-size: 24px;
	font-weight: 600;
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

.tab-content {
	display: none;
}

.tab-content.active {
	display: block;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<main>
		<div class="nullbox"></div>
		<div class="csc">철도역 안내</div>
		<div class="container">

			<div class="tab">
				<ul>
					<li class="active"><a href="#ztx" onclick="changeTab(event, 'ztx')">경부선</a></li>
					<li><a href="#train" onclick="changeTab(event, 'train')">강릉선</a></li>
					<li><a href="#train1" onclick="changeTab(event, 'train1')">호남선</a></li>
					<li><a href="#train2" onclick="changeTab(event, 'train2')">경전선</a></li>
					<li><a href="#train3" onclick="changeTab(event, 'train3')">경북선</a></li>
				</ul>
			</div>

			<div class="search-bar search-bar-global">
				<input type="text" id="search-all" placeholder="전체 역 검색" onkeyup="globalSearch()"> <img src="../static/resources/search.png">
			</div>

			<div id="ztx" class="tab-content active">
				<table>
					<thead>
						<tr>
							<th>역명</th>
							<th>주소</th>
							<th>상세정보</th>
						</tr>
					</thead>
					<tbody id="station-list-ztx">
						<tr data-name="서울역">
							<td>서울역</td>
							<td>서울시 용산구 한강대로 405 (동자동 43-205)</td>
							<td class="btn-group"><button>상세보기</button>
								<button>지도보기</button></td>
						</tr>
						<tr data-name="광명역">
							<td>광명역</td>
							<td>경기도 광명시 광명역로 21(일직동)</td>
							<td class="btn-group"><button>상세보기</button>
								<button>지도보기</button></td>
						</tr>
						<tr data-name="수원역">
							<td>수원역</td>
							<td>경기도 수원시 팔달구 덕영대로 924 수원역</td>
							<td class="btn-group"><button>상세보기</button>
								<button>지도보기</button></td>
						</tr>
						<tr data-name="천안아산역">
							<td>천안아산역</td>
							<td>충남 아산시 배방읍 희망로 100번지(장재리 364-4)</td>
							<td class="btn-group"><button>상세보기</button>
								<button>지도보기</button></td>
						</tr>
						<tr data-name="오송역">
							<td>오송역</td>
							<td>충북 청주시 흥덕구 오송읍 오송가락로 123</td>
							<td class="btn-group"><button>상세보기</button>
								<button>지도보기</button></td>
						</tr>
						<tr data-name="대전역">
							<td>대전역</td>
							<td>대전 동구 중앙로 218</td>
							<td class="btn-group"><button>상세보기</button>
								<button>지도보기</button></td>
						</tr>
						<tr data-name="울산역">
							<td>울산역</td>
							<td>울산광역시 울주군 삼남면 울산역로 177</td>
							<td class="btn-group"><button>상세보기</button>
								<button>지도보기</button></td>
						</tr>
						<tr data-name="부산역">
							<td>부산역</td>
							<td>부산 동구 중앙대로 206 (초량3동 1187-1번지) 부산역</td>
							<td class="btn-group"><button>상세보기</button>
								<button>지도보기</button></td>
						</tr>
						<tr data-name="동대구역">
							<td>동대구역</td>
							<td>대구광역시 동구 동대구로 550</td>
							<td class="btn-group"><button>상세보기</button>
								<button>지도보기</button></td>
						</tr>
					</tbody>
				</table>
			</div>


			<div id="train" class="tab-content">
				<table>
					<thead>
						<tr>
							<th>역명</th>
							<th>주소</th>
							<th>상세정보</th>
						</tr>
					</thead>
					<tbody id="station-list-train">
						<tr data-name="원주역">
							<td>원주역</td>
							<td>강원도 원주시 북원로 1860</td>
							<td class="btn-group"><button>상세보기</button>
								<button>지도보기</button></td>
						</tr>
						<tr data-name="춘천역">
							<td>춘천역</td>
							<td>강원특별자치도 춘천시 공지로 591 (근화동 190)</td>
							<td class="btn-group"><button>상세보기</button>
								<button>지도보기</button></td>
						</tr>
						<tr data-name="강릉역">
							<td>강릉역</td>
							<td>강원도 강릉시 용지로 176</td>
							<td class="btn-group"><button>상세보기</button>
								<button>지도보기</button></td>
						</tr>
					</tbody>
				</table>
			</div>

			<div id="train1" class="tab-content">
				<table>
					<thead>
						<tr>
							<th>역명</th>
							<th>주소</th>
							<th>상세정보</th>
						</tr>
					</thead>
					<tbody id="station-list-train1">
						<tr data-name="광주송정역">
							<td>광주송정역</td>
							<td>광주광역시 광산구 상무대로 201</td>
							<td class="btn-group"><button>상세보기</button>
								<button>지도보기</button></td>
						</tr>
						<tr data-name="목포역">
							<td>목포역</td>
							<td>전남 목포시 영산로 98(호남동1-1)</td>
							<td class="btn-group"><button>상세보기</button>
								<button>지도보기</button></td>
						</tr>
						<tr data-name="순천역">
							<td>순천역</td>
							<td>전라남도 순천시 팔마로 135</td>
							<td class="btn-group"><button>상세보기</button>
								<button>지도보기</button></td>
						</tr>
						<tr data-name="여수엑스포역">
							<td>여수엑스포역</td>
							<td>전라남도 여수시 망양로 2</td>
							<td class="btn-group"><button>상세보기</button>
								<button>지도보기</button></td>
						</tr>
					</tbody>
				</table>
			</div>

			<div id="train2" class="tab-content">
				<table>
					<thead>
						<tr>
							<th>역명</th>
							<th>주소</th>
							<th>상세정보</th>
						</tr>
					</thead>
					<tbody id="station-list-train2">
						<tr data-name="진주역">
							<td>진주역</td>
							<td>경상남도 진주시 진주역로 130</td>
							<td class="btn-group"><button>상세보기</button>
								<button>지도보기</button></td>
						</tr>
					</tbody>
				</table>
			</div>

			<div id="train3" class="tab-content">
				<table>
					<thead>
						<tr>
							<th>역명</th>
							<th>주소</th>
							<th>상세정보</th>
						</tr>
					</thead>
					<tbody id="station-list-train3">
						<tr data-name="김천역">
							<td>김천역</td>
							<td>경상북도 김천시 김천로 111(평화동 264-1)</td>
							<td class="btn-group"><button>상세보기</button>
								<button>지도보기</button></td>
						</tr>
					</tbody>
				</table>
			</div>

			<div id="search-result-container"
				style="display: none; width: 1100px; margin: 0 auto;">
				<table>
					<thead>
						<tr>
							<th>역명</th>
							<th>주소</th>
							<th>상세정보</th>
						</tr>
					</thead>
					<tbody id="search-result-body"></tbody>
				</table>
			</div>
		</div>
		</div>
	</main>
	<script>
function changeTab(e, id) {
    e.preventDefault();
    $('.tab li').removeClass('active');
    $(e.target).parent('li').addClass('active');
    $('.tab-content').removeClass('active');
    $('#' + id).addClass('active');
}

function globalSearch() {
    const keyword = $('#search-all').val().trim();
    $('#search-result-container').hide();
    $('#search-result-body').empty();
    $('.tab li').removeClass('active');

    let hasResult = false;
    let results = [];

    if (!keyword) {
        $('.tab-content').hide();
        $('#ztx').addClass('active').show();
        $('.tab li').first().addClass('active');
        return;
    }

    $('.tab-content tbody tr').each(function() {
        const name = $(this).data('name');
        if (name && name.includes(keyword)) {
            const cloned = $(this).clone();
            results.push(cloned);
            hasResult = true;
        }
    });

    $('.tab-content').hide();

    if (hasResult) {
        results.forEach(row => $('#search-result-body').append(row));
        $('#search-result-container').show();
    } else {
        $('#ztx').addClass('active').show();
        $('.tab li').first().addClass('active');
    }
}
</script>
</body>
</html>