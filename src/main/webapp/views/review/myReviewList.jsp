<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 관리</title>
</head>
<body>
    <%@include file="../common/menubar.jsp"%>


    <div class="wrap">
        <h2>리뷰 관리</h2>

        <table class="MyreviewTable" align="center" border="1">
            <thead>
                <tr>
                    <th width="150">썸네일</th>
                    <th width="300">제품명</th>
                    <th width="100">작성자</th>
                    <th width="80">작성일</th>
                    <th width="40">조회수</th>
                </tr>
            </thead>
            <tbody>
            
            
                <tr>
                    <td>사진</td>
                    <td>슈퍼시카 데일리 퀵 마스크(비건)</td>
                    <td>wjdgus68</td>
                    <td>2023-11-06</td>
                    <td>106</td>
                </tr>


                 
                <c:choose>
                	<c:when test="${empty rlist }">
                		<tr>
                			<td colspan="5">작성하신 리뷰가 없습니다.</td> 
                		</tr>
                	</c:when>
                	
                	<c:otherwise>
                		<c:forEach items="${rlist }" var="rl">
		                    <tr>
		                        <td><img src="${contextPath }${rl.imgSrc}" width="100px" height="100px"></td>
		                        <td>${rl.productName } </td>
		                        <td>${rl.userId }</td>
		                        <td>${rl.createDate }</td>
		                        <td>${rl.count }</td>
		                    </tr>
	                    </c:forEach>
                    </c:otherwise>
              	</c:choose>
                
            </tbody>

        </table>

    </div>
    <!--글을 클릭하면 글번호로 상세페이지로 넘어가기-->
    <script>
        $(function(){
            //클릭하면 해당 글번호로 이동하는 함수 작성
            $(".MyreviewTable>tbody>tr").click(function(){
                location.href="pet.detail?bno="+$(this).children().eq(0).text();
            });

        });

    </script>


</body>
</html>