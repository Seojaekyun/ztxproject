<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이벤트 안내</title>
<style>
    /* 스타일 정의 */
    body {
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
    }
    main header {
        background-color: #00467F;
        padding: 20px;
        text-align: center;
        color: white;
    }
    main header h1 {
        margin: 0;
        font-size: 24px;
    }
    main nav {
        background-color: #0059A3;
        padding: 10px;
        text-align: center;
    }
    main nav a {
        color: white;
        margin: 0 15px;
        text-decoration: none;
        font-size: 16px;
    }
    main nav a:hover {
        color: white;
        font-weight: 600;
    }
    main .container {
        max-width: 900px;
        margin: 20px auto;
        background-color: white;
        padding: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        text-align: center;
    }
    main .content h2 {
        font-size: 22px;
        color: #00467F;
        margin-bottom: 20px;
    }
    main .content p {
        font-size: 16px;
        line-height: 1.6;
        margin-bottom: 20px;
    }
    main .content ul {
        list-style-type: disc;
        margin-left: 20px;
    }
    main .content ul li {
        margin-bottom: 10px;
    }
    main .event-list {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
    }
    main .event-item {
    	height: 520px;
        flex: 1 1 calc(50% - 20px);
        background-color: #f9f9f9;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        display: none; /* 초기에는 숨김 처리 */
    }
    main .event-item div {
    	height: 350px;
    	overflow: hidden;
    }
    main .event-item div img {
        width: 400px;
    }
    main .event-item .event-content {
        padding: 15px;
    }
    main .event-item h3 {
        font-size: 20px;
        color: #00467F;
        margin-bottom: 10px;
    }
    main .event-item p {
        font-size: 14px;
        color: #555;
        margin-bottom: 15px;
    }
    main .event-item a {
        display: inline-block;
        padding: 8px 12px;
        background-color: #00467F;
        color: white;
        text-decoration: none;
        border-radius: 4px;
    }
    main .event-item a:hover {
        background-color: #003A66;
    }
    main .more-button {
        text-align: center;
        margin-top: 30px;
    }
    main .more-button button {
        padding: 10px 20px;
        background-color: #00467F;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    main .more-button button:hover {
        background-color: #003A66;
    }
    .event-item:hover {
	    transform: translateY(-5px);
	    transition: transform 0.3s ease;
	}

    /* 반응형 디자인 */
    @media screen and (max-width: 768px) {
        main .event-item {
            flex: 1 1 calc(50% - 20px);
        }
    }
    @media screen and (max-width: 480px) {
        main .event-item {
            flex: 1 1 100%;
        }
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
    
</style>
<script>
    // 페이지 로드 시 첫 4개의 이벤트만 표시
    document.addEventListener('DOMContentLoaded', function() {
        let eventItems = document.querySelectorAll('.event-item');
        let itemsToShow = 4; // 처음에 보여줄 이벤트 개수
        let currentItems = 0;

        // 처음에 4개 이벤트 보여주기
        for (let i = 0; i < itemsToShow && i < eventItems.length; i++) {
            eventItems[i].style.display = 'block';
            currentItems++;
        }

        // 더보기 버튼 클릭 시 추가로 4개의 이벤트 보여주기
        document.getElementById('moreBtn').addEventListener('click', function() {
            let itemsToLoad = 4;
            let itemsLoaded = 0;

            for (let i = currentItems; i < eventItems.length && itemsLoaded < itemsToLoad; i++) {
                eventItems[i].style.display = 'block';
                currentItems++;
                itemsLoaded++;
            }

            // 모든 이벤트를 다 보여주면 더보기 버튼 숨기기
            if (currentItems >= eventItems.length) {
                document.getElementById('moreBtn').style.display = 'none';
            }
        });
    });
    
    
</script>
</head>
<body>

<main>
	<div class="nullbox"></div>
	<div class="csc">이벤트</div>
	<div class="cscmc">
		<div class="cscmenu">
		    <a href="../gongji/list">공지 사항</a>
		    <a href="../inquiry/inquiryList">Q＆A</a>
		    <a href="../promot/list">이벤트</a>
		    <a href="../review/list">여행 후기</a>
		</div>
	</div>
	<nav>
		<a href="eventList">전체 이벤트</a>
        <a href="ongoingEvents">진행 중인 이벤트</a>
        <a href="pastEvents">지난 이벤트</a>
        <a href="faq">FAQ</a>
	</nav>
    <div class="container">
        <div class="content">
            <h2>진행 중인 이벤트</h2>
            <div class="event-list">
                <!-- 이벤트 아이템 -->
                <c:forEach items="${plist}" var="pdto">
                <div class="event-item">
                	<div id="imgbox">
                    	<img src="../static/resources/${pdto.fname }" alt="이벤트 이미지">
                    </div>
                    <div class="event-content">
                        <h3>${pdto.title}</h3>
                        <p>${pdto.subtitle}</p>
                        <a href="readnum?id=${pdto.id }">자세히 보기</a>
                    </div>
                </div>
                </c:forEach>
            </div>
            <!-- 더보기 버튼 -->
            <div class="more-button">
                <button id="moreBtn">더 보기</button>
            </div>
        </div>
    </div>
</main>

</body>
</html>