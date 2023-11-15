<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>PERSONAL-PET-MATE</title>
<!-- jquery 구문 -->
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
<!--     Fonts and icons     -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
<link href="/personal/resources/assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
<style>
.wrapper {
	display: flex;
	justify-content: center;
}

.main-panel {
	width: 100%;
}

.table>tbody>tr {
	cursor: pointer;
}
</style>
</head>
<body>
	<%@include file="../../views/common/menubar.jsp"%>
	<c:set var="contextPath" value="${pageContext.request.contextPath }" />
	<div class="wrapper">
		<div class="main-panel">
			<div class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">Q n A</h4>
								<select id="categoryFilter" class="float-right">
									<option value="all">전체 글</option>
									<option value="1">상품 추가</option>
									<option value="2">기타 문의</option>
								</select>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table">
										<thead class=" text-primary">
											<th>번호</th>
											<th>카테고리</th>
											<th>제목</th>
											<th>작성자</th>
											<th>작성일</th>
											<th>조회수</th>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${empty qlist }">
													<tr>
														<td colspan="6" align="center">공지사항이 없습니다</td>
													</tr>
												</c:when>
												<c:otherwise>
													<c:forEach items="${qlist}" var="q">
														<tr>
															<td>${q.qnaNo }</td>
															<td>${q.category }</td>
															<td>${q.qnaTitle }</td>
															<td>${q.userId }</td>
															<td>${q.createDate }</td>
															<td>${q.count }</td>
														</tr>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
									<script>
										document.addEventListener('DOMContentLoaded', function() {
										        // 가정: 'selectedCategory' 변수가 서버로부터 전달받은 현재 카테고리 값을 저장하고 있음
										        var selectedCategory = '<%=request.getParameter("category")%>' || 'all';
	
										        // Select box에서 해당 값을 선택하도록 설정
										        var selectBox = document.getElementById('categoryFilter');
										        selectBox.value = selectedCategory;
										        
											    document.getElementById('categoryFilter').addEventListener('change', function() {
											        var selectedCategory = this.value;
											        if(selectedCategory === 'all') {
											            location.href = 'mate.qna?currentPage=1&category=all'; // Update this URL as per your routing structure
											        } else {
											            location.href = 'mate.qna?currentPage=1&category=' + selectedCategory; // Update as per your routing
											        }
											    });
										});
									</script>
									<script>
											var rows = document.querySelectorAll("tbody>tr");
										    rows.forEach((e) => {
										      e.addEventListener("click", function () {
										        const qno = e.children[0].innerText;
										        if(!isNaN(Number(qno))){
										            location.href = "mate.qnaDetail?qno="+qno;
										        }
										      });
										    });
									</script>
									<div align="center" class="pagin-area">
										<c:choose>
											<c:when test="${pi.currentPage eq 1 }">
												<button disabled>prev</button>
											</c:when>
											<c:otherwise>
												<button onclick="location.href='mate.qna?currentPage=${pi.currentPage-1}'">prev</button>
											</c:otherwise>
										</c:choose>
										<c:forEach var="i" begin="${pi.startPage }" end="${pi.endPage }">
											<button onclick="location.href='mate.qna?currentPage=${i}'">${i }</button>
										</c:forEach>
										<c:choose>
											<c:when test="${pi.currentPage eq pi.maxPage }">
												<button disabled>next</button>
											</c:when>
											<c:otherwise>
												<button onclick="location.href='mate.qna?currentPage=${pi.currentPage+1}'">next</button>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--   Core JS Files   -->
	<script src="../assets/js/core/jquery.min.js"></script>
	<script src="../assets/js/core/popper.min.js"></script>
	<script src="../assets/js/core/bootstrap.min.js"></script>
	<script src="../assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
	<!--  Google Maps Plugin    -->
	<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
	<!-- Chart JS -->
	<script src="../assets/js/plugins/chartjs.min.js"></script>
	<!--  Notifications Plugin    -->
	<script src="../assets/js/plugins/bootstrap-notify.js"></script>
	<!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="../assets/js/paper-dashboard.min.js?v=2.0.1" type="text/javascript"></script>
	<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="../assets/demo/demo.js"></script>
</body>

</html>