<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

	String contextPath = request.getContextPath();

	Member loginUser = (Member)session.getAttribute("loginUser");
	String message = (String)session.getAttribute("message");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<style>
.nav-bar {
	width: 70%;
	min-width: 1000px;
	margin: auto;
}

nav {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px;
	background-color: #f4f4f4;
}

nav-logo {
	font-size: 1.5em;
}

.nav-menu {
	list-style: none;
	padding: 0;
	display: flex;
	gap: 20px;
}



.nav-login {
	display: flex;
	align-items: center;
	width: 100px;
	justify-content: center;
}
</style>
</head>

<body>

	<!-- alertMsg띄우는 창 -->
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
			<div class="nav-logo">LOGO</div>
			<ul class="nav-menu">
				<li><a href="${contextPath }/pet.products">Product</a></li>
				<li><a href="">Community</a>
					
				</li>
				<li>Menu 3</li>
				<li>Menu 4</li>
			</ul>
			
					<div class="nav-login">
				<%if(loginUser != null) {%>
					<b><%= loginUser.getUserName() %>님 환영합니다.</b> <br>
					<button onclick="location.href='<%=contextPath%>/pet.logout'">로그아웃</button>
					<button onclick="location.href='<%=contextPath%>/pet.myPage'">마이페이지</button>
					
				<%} else{ %>
					<button onclick="location.href='<%=contextPath%>/pet.login' ">로그인</button>
				<%} %>
					</div>
			
		</nav>
	</div>
</body>
</html>