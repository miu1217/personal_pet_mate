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
.card-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    background-color: #87a56c;
    padding: 0.5rem 1.25rem;
}
h4 {
    margin: 8px 0 0 12px;
}
.main-panel {
    width: 100%;
}
.table>tbody>tr {
    cursor: pointer;
}
table {
    text-align: center;
    margin-top: 4%;
}
thead {
    background-color: #87a56c;
}
tbody {
    font-size: small;
}
table tr td {
    border-bottom: 1px solid #cce4b9;
}
#bNo {
    width: 100px
}
#title {
    width: 600px
}
#writer {
    width: 200px
}
#count {
    width: 100px
}
tbody #title {
    text-align: left
}
.btn-two {
    width: 80px;
    height: 40px;
    margin-top: -4%;
    float: right;
    background-color: #87a56c;
    color: #ffff;
    text-align: center;
    padding-top: 8px;
    border-bottom-color: rgba(0,0,0,0.34);
    text-shadow: 0 1px 0 rgba(0,0,0,0.15);
    box-shadow: 0 1px 0 rgba(255,255,255,0.34) inset, 0 2px 0 -1px rgba(0,0,0,0.13), 0 3px 0 -1px rgba(0,0,0,0.08), 0 3px 13px -1px rgba(0,0,0,0.21);
}
.btn-two:hover {
    top: 1px;
    text-decoration: none;
    color: rgb(36, 28, 28);
    outline: none;
}
.btn-two:active {
    top: 1px;
    border-color: rgba(0, 0, 0, 0.34) rgba(0, 0, 0, 0.21)
        rgba(0, 0, 0, 0.21);
    box-shadow: 0 1px 0 rgba(255, 255, 255, 0.89), 0 1px rgba(0, 0, 0, 0.05)
        inset;
    outline: none;
}
.pagingbar {
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
select {
    width: 150px;
    padding: 12px;
    border: 0 !important;
    background-color: white;
    /* needed */
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    background-image:
        url("data:image/svg+xml;charset=UTF-8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2212%22%20height%3D%2212%22%20viewBox%3D%220%200%2012%2012%22%3E%3Ctitle%3Edown-arrow%3C%2Ftitle%3E%3Cg%20fill%3D%22%23000000%22%3E%3Cpath%20d%3D%22M10.293%2C3.293%2C6%2C7.586%2C1.707%2C3.293A1%2C1%2C0%2C0%2C0%2C.293%2C4.707l5%2C5a1%2C1%2C0%2C0%2C0%2C1.414%2C0l5-5a1%2C1%2C0%2C1%2C0-1.414-1.414Z%22%20fill%3D%22%23000000%22%3E%3C%2Fpath%3E%3C%2Fg%3E%3C%2Fsvg%3E");
    background-size: .6em;
    background-position: calc(100% - 1.3em) center;
    background-repeat: no-repeat;
}
select::-ms-expand {
    display: none;
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
                                <h4 class="card-title" style="color:white;">Q n A</h4>
                                <select id="categoryFilter" class="float-right">
                                    <option value="0">전체 글</option>
                                    <option value="1">상품 추가</option>
                                    <option value="2">기타 문의</option>
                                </select>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead class="table table-hover">
                                            <th style="width: 100px; color:white;" >번호</th>
                                            <th style="width: 150px; color:white;">카테고리</th>
                                            <th style="color:white;">제목</th>
                                            <th style="width: 150px; color:white;">작성자</th>
                                            <th style="width: 100px; color:white;">작성일</th>
                                            <th style="width: 100px; color:white;">조회수</th>
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
                                    <nav aria-label="Page navigation example" class="pagingbar">
                                        <ul class="pagination">
                                            <!-- 이전버튼 -->
                                            <c:choose>
                                                <c:when test="${pi.currentPage eq 1}">
                                                    <li class="page-item disabled"><span class="page-link">&laquo;</span></li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li class="page-item"><a class="page-link" href="mate.qna?currentPage=${pi.currentPage-1}&category=${cno }" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                                                    </a></li>
                                                </c:otherwise>
                                            </c:choose>
                                            <!-- 페이지 번호 -->
                                            <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
                                                <li class="page-item ${pi.currentPage eq i ? 'active' : ''}"><a class="page-link" href="mate.qna?currentPage=${i}&category=${cno }">${i}</a></li>
                                            </c:forEach>
                                            <!-- 다음버튼 -->
                                            <c:choose>
                                                <c:when test="${pi.currentPage eq pi.maxPage}">
                                                    <li class="page-item disabled"><span class="page-link">&raquo;</span></li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li class="page-item"><a class="page-link" href="mate.qna?currentPage=${pi.currentPage+1}&category=${cno }" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                                                    </a></li>
                                                </c:otherwise>
                                            </c:choose>
                                        </ul>
                                    </nav>
                                </div>
                                <div id="insert" style="margin: end; display: flex; justify-content: flex-end;">
                                    <c:choose>
                                        <c:when test="${not empty loginUser }">
                                            <a href="${contextPath }/mate.insertQna" class="btn-two">글작성</a>
                                        </c:when>
                                    </c:choose>
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