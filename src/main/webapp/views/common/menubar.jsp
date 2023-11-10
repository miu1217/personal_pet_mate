<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String contextPath = request.getContextPath();

Member loginUser = (Member) session.getAttribute("loginUser");
String message = (String) session.getAttribute("message");
%>
	<%@include file="../common/modal.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Caveat:wght@400;500&family=Montserrat+Alternates:wght@500&display=swap')
	;

.nav-bar {
	width: 100%;
	margin: auto;
}

nav {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px;
	background-color: #fff;
}

.nav-logo {
	display: flex;
	align-items: center;
	cursor: pointer;
	margin-left: 12px;
}

.nav-logo img {
	width: 80px;
	height: 80px;
}

.nav-logo span {
	font-family: 'Caveat', cursive;
	font-size: 28px;
}

.nav-menu {
	list-style-type: none; /* Remove default list bullets */
	margin: 0;
	padding: 0; /* Remove default padding */
	overflow: hidden; /* Clear floats */
	background-color: #ffffff;
	font-family: 'Montserrat', sans-serif; /* Font family */
	box-shadow: 0 2px 3px rgba(0, 0, 0, 0.1);
	margin: 0 auto;
	/* Subtle shadow to lift the nav off the page */
}

/* Style the links inside the list items */
.nav-menu li {
	display: inline-block; /* Use inline-block for proper spacing */
}

/* Style the anchor tags inside the list items */
.nav-menu li a {
	display: block; /* Make the links fill the container */
	color: #333;
	text-align: center; /* Center text inside the links */
	padding: 14px 36px; /* Add some padding */
	text-decoration: none; /* Remove underline from links */
	transition: background-color 0.3s;
}

/* Change the background color of links on hover and for active class */
.nav-menu li a:hover, .nav-menu li a.active {
	background-color: #b0cc99;
	/* Background color on hover and for active link */
	color: white; /* Change text color on hover for better readability */
}

.nav-menu:after {
	content: "";
	display: table;
	clear: both;
}

.sub-menu {
	display: none; /* 기본적으로 서브메뉴는 숨겨져 있어야 함 */
	position: fixed; /* nav 메뉴 아래에 위치 */
	background-color: #ffffff; /* 서브메뉴 배경색 */
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2); /* 서브메뉴에 그림자 효과 */
	z-index: 1; /* 다른 요소들 위에 노출 */
	padding-left: 0;
	min-width: 149px;
}

.nav-menu li:hover .sub-menu {
	display: block; /* 메뉴 항목에 마우스를 올리면 서브메뉴 표시 */
}

.sub-menu li {
	display: block; /* 서브 메뉴 항목은 세로로 표시 */
}

.sub-menu li a {
	padding: 12px 16px; /* 서브 메뉴 링크에 패딩 추가 */
	text-decoration: none; /* 밑줄 없애기 */
	white-space: nowrap; /* 서브 메뉴 텍스트가 줄바꿈 되지 않도록 처리 */
}

.sub-menu li a:hover {
	background-color: #b0cc99; /* 마우스 오버시 서브 메뉴 배경색 변경 */
	color: white; /* 마우스 오버시 서븉 메뉴 글자색 변경 */
}

/* 메인 메뉴 항목 중 하위 메뉴가 있는 항목 스타일링 */
.nav-menu li:hover {
	background-color: #b0cc99;
	color: white;
}

/* 메인 메뉴에 하위 메뉴가 있는 경우 화살표 표시 추가 */
.nav-menu li.dropdown {
	position: relative;
}

.nav-login {
	display: flex;
	align-items: center;
	width: 220px;
	justify-content: center;
	flex-direction: column;
}

.main-button {
	background-color: #b0cc99;
	width: 100px;
	color: white;
	border: none;
	padding: 10px 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	cursor: pointer;
	border-radius: 8px;
	transition: background-color 0.3s;
	color: white;
}

.main-button:hover {
	background-color: #677e52;
}
</style>
</head>
<body>
	<div class="nav-bar">
		<c:set var="contextPath" value="${pageContext.request.contextPath }" />
		<nav>
			<div class="nav-logo" onclick="home();">
				<img src="${contextPath }/resources/assets/logo/logo.png"> <span>personal-pet-mate</span>
			</div>
			<ul class="nav-menu">
				<li><a href="${contextPath}/pet.products?productCategory=all">Product</a></li>
				<li class="dropdown"><a href="${contextPath}/pet.boardMain?currentPage=1">Community</a>
					<ul class="sub-menu">
						<li><a href="${contextPath}/pet.boardMain?currentPage=1">전체 게시글</a></li>
						<li><a href="${contextPath}/pet.announcements?currentPage=1">공지사항</a></li>
						<li><a href="${contextPath}/pet.freeBoard?currentPage=1">자유게시판</a></li>
					</ul></li>
				<li><a href="${contextPath}/mate.qna?currentPage=1&category=all">QnA</a></li>
				<li><a>menu4</a></li>
			</ul>

			<div class="nav-login">
				<%
				if (loginUser != null) {
				%>
				<div class="login-text">
					<b><%=loginUser.getUserName()%>님 환영합니다</b>
				</div>
				<div class="button-div">
					<button class="main-button" onclick="location.href='<%=contextPath%>/pet.myPage'">마이페이지</button>
					<button class="main-button" onclick="location.href='<%=contextPath%>/pet.logout'">로그아웃</button>
				</div>

				<%
				} else {
				%>
				<button class="main-button" onclick="location.href='<%=contextPath%>/pet.login' ">로그인</button>
				<%
				}
				%>
			</div>
		</nav>
	</div>
	<script>
        document.addEventListener('DOMContentLoaded', function() {
            const currentLocation = location.href; // Get current URL
            const menuItem = document.querySelectorAll('.nav-menu a');
            const menuLength = menuItem.length;

            for (let i = 0; i < menuLength; i++) {
                if (menuItem[i].href === currentLocation) {
                    menuItem[i].className += " active"; // Add the 'active' class
                } else {
                    menuItem[i].className -= " active";
                }
            }
        });
    </script>
	<script>
        function home() {
            location.href = "${contextPath}";
        }
    </script>
</body>
</html>