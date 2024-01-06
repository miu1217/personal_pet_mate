<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경 페이지</title>

<style>
	
	.allHeader>p,.allHeader>div{
		 display: flex;
    	justify-content: center;	
	}
	
    .header{
        color: #4C4C4C;
        font-size: 40px;
        font-weight: bold;


    }

	.changePwdForm{
		margin: auto;
	}

    .changePwd{
        width: 1500px;
        height: 200px;
        margin: auto;
    }

    .coreName{
        width: 300px;
        height: 30px;
        text-align: center;
        background-color: #F0F0F0;
    }
    .content{
        width: 300px;
        height: 30px;
        margin-left: 20px;
        padding-left: 20px;
    }

    .warningText{
        background-color: #F0F0F0;
        width: 1460px;
        padding: 20px;
		margin: auto;
		margin-top: 80px;
		display: flex;
   		flex-direction: column;
   		align-items: flex-start;
    }
    .warningTextContent{
    	margin-left: 20px;
    }
    
    .tipText{
        background-color: #D9EECA;
        width: 1450px;
    }

    /*버튼 css영역*/
    .button{
        margin-top: 50px;
        margin-bottom: 50px;
    }
    
    .button button{
        width: 250px;
        height: 50px;
    }
    .okay{
        color: white;
        background-color: #323232;
         box-shadow: 1px 1px 1px 1px rgb(0, 0, 0, 0.4);
   		border: none;
   		border-radius: 8px;
    }
    .cancel{
        background-color: white;
        box-shadow: 1px 1px 1px 1px rgb(0, 0, 0, 0.4);
   		border: none;
   		border-radius: 8px;
    }
	
	.tipicon{
		display: flex;
    	align-items: flex-end;
    	margin-left: 50px;
	}
	
	.tipicon>h3{
		margin-left: 20px;
	}
	.tipText{
		padding: 30px;
	}
	.tipText>ul{
		margin-left: 20px;
	}
	
	 table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #D5D5D5;
    /*border-left: 1px solid #444444;*/
    padding: 10px;
  }
  th:first-child, td:first-child {
    border-left: none;
  }
	
	
</style>

</head>
<body>

	<!-- ㅡㅡㅡㅡㅡㅡㅡㅡ비밀번호 변경하는 view페이지ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
	<!--  ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡMemberChangePwdController로 이동ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->

	<%@include file="../common/menubar.jsp" %> <br>

		<div class="allHeader">
		<div class="header"> 비밀번호 변경</div> 
	  	<p>추가적인 비밀번호 변경을 통해 개인정보를 안전하게 보호하세요. </p> 
		</div>
	
    <br clear="both">
	<form action="<%=contextPath %>/pet.changePwd" method="post">
    <!--비밀번호 변경테이블 영역-->
    <div class="changePwdForm">
    <table class="changePwd"> 
        <tr>
            <td class="coreName">현재비밀번호 </td>
            <td><input type="password" class="content" name="nowPwd" placeholder="현재 비밀번호 입력" required></td>
        </tr>
        <tr>
            <td class="coreName">새 비밀번호</td>
            <td><input type="password" class="content"  name="newPwd" placeholder="새 비밀번호 입력" required></td>
        </tr>
        <tr>
            <td class="coreName">새 비밀번호 확인</td>
            <td><input type="password" class="content" name="newPwdChk" id="newPwdChk" placeholder="새 비밀번호 확인" required></td>
        </tr>
	</table>
	</div>
	
     <!--비밀번호 변경테이블 영역 끝-->
    
    <!--비밀번호 제한영역-->
	<div class="warningText" >
		
		<div class="warningTextContent">
	        <h3>비밀번호 변경 시 유의사항</h3>
	        <li>
	            비밀번호는 대/소문자, 숫자, 특수문자(!@#$%^&*), 8~15자리 입니다.
	        </li>
	        <li>
	            생년월일,전화번호 등 개인정보와 관련된 숫자, 연속된 숫자, 연속된 키보드배열과 같이 쉬운 비밀번호는 타인이 쉽게 알아낼 수 있으니 사용을 자제해주세요. 
	        </li>
	        <li>
	            이전에 사용했던 비밀번호나 타 사이트와 다른 비밀번호를 사용하고 비밀번호는 주기적으로 변경해주세요. 
	        </li>
	        <br>
       	</div>
    </div>
    <!--비밀번호 제한영역 끝-->
   
    <div class="button" align="center">
         <button onclick="location.href='<%=contextPath%>/pet.myPage'" class="cancel">나중에 하기</button>
         <button onclick="return changePwd();" class="okay">비밀번호 변경하기</button>
    </div>
 </form>	
    <!--비밀번호 주의사항 영역-->
    <div style="margin: auto;" class="tipText">
    	<div class="tipicon">
    		 <img src="./resources/icons/팁아이콘.png" alt="팁아이콘" width="70" height="70"> 
    		 <h3>꼭 읽어주세요</h3>
    	</div>
   
    <ul>
        <li>
            비밀번호는 도난방지, 보안설정을 위하여 3개월~6개월 사이에 주기적으로 변경하는 것이 안전합니다.
        </li>
        <li>
            8~15자의 영문 대/소문자, 숫자, 특수기호를 조합하여 사용할 수 있습니다.
        </li>
        <li>
            생년월일, 전화번호 등 개인정보와 관련된 숫자, 연속된 숫자, 연속된 키보드배열과 같이 쉬운 비밀번호는 자제바랍니다.
        </li>
        <li>
            현재 사용했던 비밀번호와 동일한 비밀번호로 변경할 수 없습니다.
        </li>
		 <br>
        ---------------------- 사용불가 비밀번호 ---------------------- <br> <br>
        <li>
            비밀번호 글자수가 8자 미만 또는 15자 초과인 경우
        </li>
        <li>
            사용자 ID를 그대로 비밀번호로 이용하는 경우
        </li>
        <li>
            개인정보(휴대전화번호, 생일)을 포함하는 비밀번호
        </li>
        <li>
            패턴이 존재하는 비밀번호(동일한 문자의 반복이 3회 이상인 경우, 키보드 상에서 연속한 위치에 존재하는 문자의 집합)
        </li>
        <li>
            가장 최근에 사용했던 비밀번호
        </li>
        <li>
            사용가능한 특수문자 이외의 문자열을 입력한 경우 (사용가능한 특수문자 28자 : ! " # $ % ' ( ) * - . / : < = > ? @ [ \ ] ^ _ ` { | } ~ )
        </li>
        <li>
            공백이 포함된 경우
        </li>
        
    </ul>
    </div>
    <!--비밀번호 주의사항 영역 끝-->
	
	<script>
	//새비밀번호와 새비밀번호가 같지않으면 return false하면서 alert창으로 같지않다하기
     			function changePwd() {
     				//변경할 비밀번호와 비밀번호 확인값이 같은지 확인후 
     				//다르면 기존 버튼에 걸려있는 기본이벤트인 submit작업을 막아주는 처리를 할 함수
     				
     				 //==================비밀번호 입력 정규표현식 
     				
    		         var newPwd = /^[a-zA-Z0-9!@#$%^&*]{8,15}$/g;
    		         
    		         if(! newPwd.test($("input[name=newPwd]").val())){

    		             showError("비밀번호 변경 오류","비밀번호는 대/소문자, 숫자, 특수문자(!@#$%^&*), 8~15자리 입니다.","확인");
    		                  
    		                  return false;
    		         }
 
     				
     				
    		         var newPwd = $("input[name=newPwd]").val();   //jquery 어쩌구 형식으로 뜸 그래서 .val()을 해줘야함
     				var newPwdChk = $("#newPwdChk").val();
     				
     				//console.log(newPwd);
     				//console.log(newPwdChk);
     				
     				//두 요소객체의 value값이 같지 않다면
     				if(newPwd!=newPwdChk) {
     	    		             showError("비밀번호 변경 오류","새 비밀번호와 새 비밀번호 확인이 같지 않습니다.","확인");
     					//newPwd.select();
     					
     					return false; 
     				}
     				
     				
     				
     				
     			}
     		
     		</script>



</body>
</html>