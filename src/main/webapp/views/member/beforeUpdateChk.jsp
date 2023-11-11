<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
     /* 가운데 내용 css영역 */
    .all{
      display: flex;  
      width: 320px;
      flex-direction: column;  
      
    }
    .content_1{
      width: 100%;
    }
    .content_1>input{
      width: 100%;
      height: 30px;
    }

    .content_2{
      width: 100%;
      display: flex;
      justify-content: space-between;
    }
    .content{
      border: 1px solid black;
      padding-top: 100px;
      padding-bottom: 100px;
      background-color: #F0F0F0;
    }
    /* 버튼 css영역 */
    .cancel{
      width: 155px;
      height: 30px;
      background-color: white;
    }
    .okay{
      width: 155px;
      height: 30px;
      color: white;
      background-color: #323232;
    }

  </style>


</head>
<body>
	  <%@include file="../common/menubar.jsp"%> <!-- 로그인유저의 정보가 담겨져있음 input hidden으로 숨겨서 로그인유저의 비밀번호를 보내주고 서블릿하나만들어서 입력한 비밀번호가 같으면 updateForm.jsp로 보내주는 작업하기  -->
	<!-- 만약 여기서 입력한 비밀번호가 loginUser의 비밀번호와 같으면 updateController로 이동해야함 or updateForm.jsp로 이동-->
     <form action="<%=contextPath %>/pet.beforeChk" method="post">   <!-- 비밀번호를 입력해서 만약 비밀번호가 로그인유저와 일치하면 수정서블릿으로 이동 -->
  		<input type ="hidden" name="userPwd" value="${loginUser.userPwd }"> <!-- 서블렛에서 파라미터영역에서 꺼내올수있음 -->
        <div class="wrap">
            <h1 align="center">회원정보 수정</h1>
            <p align="center">회원님의 소중한 정보를 안전하게 관리하세요.</p> <br><br>
            <div class="content" align="center">
            <img src="./resources/icons/회원정보수정 아이콘.png" alt="아이콘" width="80" height="80"> <br> <br>
            <h2>회원정보를 수정하시려면 비밀번호를 입력하셔야 합니다.</h2>
            회원님의 개인정보 보호를 위한 본인 확인 절차이오니, PersonalMate 회원 로그인 시 사용하시는 비밀번호를 입력해주세요. <br><br><br>
           
            <div class="all">
            	<div class="content_1">
            		  <input type="password" name="passwordChk"  placeholder="비밀번호를 입력해주세요." required> <br>
         		</div>  
           		 <br>
            
           		 <div class="content_2">
              		  <button type="submit" onclick="return passwordChk2();" class="okay" >확인</button>   <!--form태그내에서 input태그에 있는 name과 onclick의 이름이 같게하면 input태그에 있는 name을 먼저 찾아서 오류가 발생함-->
            		  <button onclick="location.href='<%=contextPath%>/pet.myPage'"  class="cancel">취소</button>
            	 </div>
            </div>

          </div>
        </div>
      </form>

      <script>
    
      	
       function passwordChk2() {
        
		
				var chkPwd = $("input[name='passwordChk']").val();
				//var nowPwd = $("loginUser.userPwd").val();
				var nowPwd = "${loginUser.userPwd}";
				
				console.log(chkPwd);
				console.log(nowPwd);
			
				if(chkPwd !=nowPwd) {
					alert("비밀번호가 틀립니다.");				
					return false; 
				}else {
				
					return true;
				}
				
       }
       
       

      </script>



</body>
</html>