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
<link href="./resources/assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
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

.table>tbody tr:hover{
	        	background-color: #F0F0F0;
	        	cursor : pointer; 
	        }
	
	.myBoard{
		width: 1000px;
	}


.pagingbar{
	    display: flex;
    justify-content: center;
}

.page-item.active .page-link {

    background-color: #B0CC99;
    border-color: #B0CC99;
}

.page-link {
    color: black;
}

.table-responsive {
    overflow: auto;
    width: 90%;
    margin: auto;
}
.card-title{
	width: 90%;
    margin: auto;
}



</style>
</head>
<body>
	<%@include file="../../views/common/menubar.jsp"%>
	<div class="wrapper">
		<div class="main-panel">
			<div class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">리뷰 관리</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table">
										<thead class=" text-primary">
											<th></th>
											<th>제품명</th>
											<th>작성자</th>
											<th>작성일${contextPath }</th>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${empty rList }">
													<tr>
														<td colspan="5">작성하신 리뷰가 없습니다.</td> 
													</tr>
												</c:when>
												<c:otherwise>
													<c:forEach items="${rList }" var="rl">
														<tr class="review-row">
															<td><img src="${contextPath }${rl.titleImg}" width="100px" height="100px"></td>
															<td>${rl.productName } </td>
															<td>${rl.userId }</td>
															<td>${rl.createDate }</td>
														</tr>
													</c:forEach>
												</c:otherwise>
											  </c:choose>				
										</tbody>
									</table>
									


									<script>
											$(function(){
												
												$(".review-row").click(function(){
													
													location.href="pet.detail.r?rno="+ $(this).children().eq(0).text();
												});       		
											});
									</script>


									
									
									<!-- 페이징바 -->
										<nav aria-label="Page navigation example" class="pagingbar">
									    <ul class="pagination">
									        <!-- 이전버튼 -->
									        <c:choose>
									            <c:when test="${pi.currentPage eq 1}">
									                <li class="page-item disabled">
									                    <span class="page-link">&laquo;</span>
									                </li>
									            </c:when>
									            <c:otherwise>
									                <li class="page-item">
									                    <a class="page-link" href="pet.myReview?currentPage=${pi.currentPage-1}" aria-label="Previous">
									                        <span aria-hidden="true">&laquo;</span>
									                    </a>
									                </li>
									            </c:otherwise>
									        </c:choose>
									
									        <!-- 페이지 번호 -->
									        <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
									            <li class="page-item ${pi.currentPage eq i ? 'active' : ''}">
									                <a class="page-link" href="pet.myReview?currentPage=${i}">${i}</a>
									            </li>
									        </c:forEach>
									
									        <!-- 다음버튼 -->
									        <c:choose>
									            <c:when test="${pi.currentPage eq pi.maxPage}">
									                <li class="page-item disabled">
									                    <span class="page-link">&raquo;</span>
									                </li>
									            </c:when>
									            <c:otherwise>
									                <li class="page-item">
									                    <a class="page-link" href="pet.myReview?currentPage=${pi.currentPage+1}" aria-label="Next">
									                        <span aria-hidden="true">&raquo;</span>
									                    </a>
									                </li>
									            </c:otherwise>
									        </c:choose>
									    </ul>
									</nav>
									
									
									
									
									
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