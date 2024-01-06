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
 <!-- CSS Files -->
  <link href="${contextPath }resources/assets/AdminCss/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${contextPath }resources/assets/AdminCss/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="${contextPath }resources/assets/AdminCss/demo/demo.css" rel="stylesheet" />
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
	<c:set var="contextPath" value="${pageContext.request.contextPath }" />
	<div class="wrapper">
		<div class="main-panel">
			<div class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">게시글 관리</h4>								
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
												<c:when test="${empty bList }">
													<tr>
														<td colspan="6" align="center">작성하신 게시글이 없습니다.</td>
													</tr>
												</c:when>
												<c:otherwise>
													<c:forEach items="${bList }" var="bl">
														<tr class="board-row">
															<td>${bl.boardNo }</td>
		                        							<!-- 여기서 boardType이 1이면 자유게시판 2이면 고민게시판 만들기 -->
															<c:choose>
																<c:when test="${bl.boardType eq 2 }">
																	<td>자유게시판</td>
																</c:when>
																<c:when test="${bl.boardType eq 3 }">
																	<td>고민게시판</td>
																</c:when>
																<c:otherwise>
																	<td>기타</td>
																</c:otherwise>
															</c:choose>		                      		                  
															<td>${bl.boardTitle } </td>
															<td>${bl.userId }</td> 
															<td>${bl.createDate }</td>
															<td>${bl.count }</td>
														</tr>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
								

							<script>
							     $(function(){ 
							            $(".board-row").click(function(){
							               var bno = $(this).children().eq(0).text();
							               
							               location.href="<%=contextPath%>/pet.boardDetail?bno="+bno;
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
									                    <a class="page-link" href="pet.myBoardList?currentPage=${pi.currentPage-1}" aria-label="Previous">
									                        <span aria-hidden="true">&laquo;</span>
									                    </a>
									                </li>
									            </c:otherwise>
									        </c:choose>
									
									        <!-- 페이지 번호 -->
									        <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
									            <li class="page-item ${pi.currentPage eq i ? 'active' : ''}">
									                <a class="page-link" href="pet.myBoardList?currentPage=${i}">${i}</a>
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
									                    <a class="page-link" href="pet.myBoardList?currentPage=${pi.currentPage+1}" aria-label="Next">
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
	<script src="${contextPath }resources/assets/AdminCss/js/core/jquery.min.js"></script>
  <script src="${contextPath }resources/assets/AdminCss/js/core/popper.min.js"></script>
  <script src="${contextPath }resources/assets/AdminCss/js/core/bootstrap.min.js"></script>
  <script src="${contextPath }resources/assets/AdminCss/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chart JS -->
  <script src="${contextPath }resources/assets/AdminCss/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="${contextPath }resources/assets/AdminCss/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="${contextPath }resources/assets/AdminCss/js/paper-dashboard.min.js?v=2.0.1" type="text/javascript"></script><!-- Paper Dashboard DEMO methods, don't include it in your project! -->
  <script src="${contextPath }resources/assets/AdminCss/demo/demo.js"></script>
</body>

</html>