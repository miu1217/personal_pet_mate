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
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #ffffff;
	font-family: 'Montserrat', sans-serif;
	margin: 0 auto;
	position: relative;
}

.nav-menu li {
	display: inline-block;
	transition: color 0.3s ease;
	border:none;
}

.nav-menu li a {
	display: block;
	color: #333;
	text-align: center;
	padding: 14px 36px;
	text-decoration: none;
	overflow: hidden;
}

.nav-menu li a:after {
  content: '';
  position: absolute;
  left: 0;
  bottom: 0;
  height: 2px;
  width: 100%;
  background-color: #7fad39;
  transform: scaleX(0);
  transform-origin: right;
  transition: transform 0.5s ease;
}

.nav-menu li a:hover,.nav-menu li a.active{
	color: #7fad39;
}

.sub-menu {
	display: none;
	position: fixed;
	background-color: #ffffff;
	z-index: 1;
	padding-left: 0;
	min-width: 149px;
}

.nav-menu li:hover .sub-menu {
	display: block;
}

.sub-menu li {
	display: block;
}

.sub-menu li a {
	padding: 12px 16px;
	text-decoration: none;
	white-space: nowrap;
}

/* 클릭강조 */
.nav-menu li.clicked a {
  color: #7fad39;
}


/* 메인 메뉴 항목 중 하위 메뉴가 있는 항목 스타일링 */
.nav-menu li:hover {
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
	transition: background-color 0.3s;
	color: white;
}

.main-button:hover {
	background-color: #677e52;
}

.sub-menu li.clicked a{
	border-bottom: 2px solid #7fad39;
}

</style>
</head>
<body>

	<script>
		var message = "<%=message%>";
		if(message != 'null') {
			alert(message);
			<%session.removeAttribute("message");%>
		}
	</script>
	



	<div class="nav-bar">
		<c:set var="contextPath" value="${pageContext.request.contextPath }" />
		<nav>
			<div class="nav-logo" onclick="home();">
				<img src="${contextPath }/resources/assets/logo/logo.png"> <span>personal-pet-mate</span>
			</div>
			<ul class="nav-menu">
				<li><a href="${contextPath}/pet.products?productCategory=all&currentPage=1">Product</a></li>
				<li class="dropdown"><a href="${contextPath}/pet.boardMain?currentPage=1">Community</a>
					<ul class="sub-menu">
						<li><a href="${contextPath}/pet.boardMain?currentPage=1">전체 게시글</a></li>
						<li><a href="${contextPath}/pet.announcements?currentPage=1">공지사항</a></li>
						<li><a href="${contextPath}/pet.freeBoard?currentPage=1">자유게시판</a></li>
					</ul></li>
				<li><a href="${contextPath}/mate.qna?currentPage=1&category=all">QnA</a></li>
			</ul>

			<div class="nav-login">
				<%
				if (loginUser != null) {
				%>
				<div class="login-text">
					<b><%=loginUser.getUserName()%>님 환영합니다</b>
				</div>
				<div class="button-div">
					<%if (loginUser.getUserNo() == 1) {%>
					 	<button class="main-button" onclick="location.href='<%=contextPath%>/pet.admin.list.m'">어드민페이지</button>
					<%}else { %>
						<button class="main-button" onclick="location.href='<%=contextPath%>/pet.myPage'">마이페이지</button>
					 <%} %>
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