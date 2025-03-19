<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>역 안내</title>
<link rel="stylesheet" href="/resources/css/style.css">
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
	width: 24px;
	height: 24px;
	cursor: pointer;
}

table {
	width: 100%;
	border-collapse: collapse;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

table th, table td {
	padding: 14px 12px;
	border-bottom: 1px solid #ddd;
	font-size: 15px;
}

table th {
	background: #f8f8f8;
	font-weight: 600;
}

table td:nth-child(1) {
	text-align: center;
}

table td:nth-child(2) {
	text-align: center;
}

table td:nth-child(3) {
	text-align: center;
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
					<li class="active"><a href="#ktx"
						onclick="changeTab(event, 'ktx')">ZTX역</a></li>
					<li><a href="#normal" onclick="changeTab(event, 'normal')">일반철도</a></li>
					<li><a href="#metro" onclick="changeTab(event, 'metro')">광역철도</a></li>
				</ul>
			</div>


			<div id="ktx" class="tab-content active">
				<div class="search-bar">
					<input type="text" id="search-ktx" placeholder="역이름 입력"
						onkeyup="filterStations('ktx')"><img
						src="../static/resources/search.png">
				</div>
				<table>
					<thead>
						<tr>
							<th>역명</th>
							<th>주소</th>
							<th>상세정보</th>
						</tr>
					</thead>
					<tbody id="station-list-ktx">
						<tr data-name="강릉">
							<td>강릉</td>
							<td>강원도 강릉시 용지로 176</td>
							<td class="btn-group"><button>상세보기</button>
								<button>지도보기</button></td>
						</tr>
					</tbody>
				</table>
			</div>


			<div id="normal" class="tab-content">
				<div class="search-bar">
					<input type="text" id="search-normal" placeholder="역이름 입력"
						onkeyup="filterStations('normal')"><img
						src="../static/resources/search.png">
				</div>
				<table>
					<thead>
						<tr>
							<th>역명</th>
							<th>주소</th>
							<th>상세정보</th>
						</tr>
					</thead>
					<tbody id="station-list-normal">
						<tr data-name="곡성">
							<td>곡성</td>
							<td>전남 곡성군 곡성읍 곡성로 920</td>
							<td class="btn-group"><button>상세보기</button>
								<button>지도보기</button></td>
						</tr>
					</tbody>
				</table>
			</div>


			<div id="metro" class="tab-content">
				<div class="search-bar">
					<input type="text" id="search-metro" placeholder="역이름 입력"
						onkeyup="filterStations('metro')"><img
						src="../static/resources/search.png">
				</div>
				<table>
					<thead>
						<tr>
							<th>역명</th>
							<th>주소</th>
							<th>상세정보</th>
						</tr>
					</thead>
					<tbody id="station-list-metro">
						<tr data-name="공주">
							<td>공주</td>
							<td>충남 공주시 이인면 새빛로 100</td>
							<td class="btn-group"><button>상세보기</button>
								<button>지도보기</button></td>
						</tr>
					</tbody>
				</table>
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

    function filterStations(tabId) {
        const keyword = $('#search-' + tabId).val().trim();
        $('#station-list-' + tabId + ' tr').each(function() {
            const name = $(this).data('name');
            if (!keyword || name.includes(keyword)) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    }
</script>
</body>
</html>
