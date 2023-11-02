<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>

      body{
        text-align: center;
      }

    .interest{
      margin: auto;

    }
      

/* 버튼 */
    button {
    display: inline-block;
    padding: 12px 24px;
    background: rgb(220,220,220);
    font-weight: bold;
    color: rgb(120,120,120);
    border: none;
    outline: none;
    border-radius: 3px;
    cursor: pointer;
    transition: ease .3s;
    }

    button:hover {
    background: #8BC34A;
    color: #ffffff;
    }
   
 #idTest{
   	  width : 70px;
      height: 21px;
   	  padding : 3px 10px;	
   	  cursor : pointer;
      font-size: 11px;;
   }


</style>
</head>
<body>
		<%@include file="../common/menubar.jsp"%>

  <form action="<%=contextPath%>/pet.enrollPage"  method="post">
    <fieldset id="enroll-form">
      <h2>PERSONAL PET-MATE</h2>
      <br>
    <div>
      <label for="enrollId">* 아이디</label> 
      <input type="text" class="input-area" id="enrollId" name="enrollId" placeholder="아이디를 입력하세요." required> 
      <button type="button" id="idTest" onclick="idCheck();">중복확인</button>
      <br>
      <label id="result">대/소문자,숫자,5-30자</label>
      
    </div>
    <div>
      <label for="userPwd">* 비밀번호</label> 
      <input type="password" class="input-area" id="userPwd" name="userPwd" onChange="pwdTest();"  placeholder="비밀번호를 입력하세요" required> <br>
      <label id="pwdTest1">비밀번호 정규표현검사</label> <br>
       <label for="userPwd2">* 비밀번호 확인</label> 
      <input type="password" class="input-area" id="userPwd2" name="userPwd2" oninput="pwdTest();"  placeholder="비밀번호 확인" required> <br>
       <label id="pwdPass">비밀번호 확인 검사</label> <br>
    </div>
    <input type="text" class="input-area" id="userName" name="userName" placeholder="이름을 입력하세요." required> <br><br>
    <label for="gen">성별</label>
    <input type="radio" name="gender" id="gen"><label for="gen">남</label> 
    <input type="radio" name="gender" id="gen"><label for="">여</label>  <br><br>
    <input type="text" class="input-area" id="phone" name="phone" placeholder="전화번호를 입력하세요."> <br><br>
    <input type="text" class="input-area" id="email" name="email" placeholder="이메일을 입력하세요."> <br><br>
    <input type="text" class="input-area" id="address" name="address" placeholder="집주소를 입력하세요."> <br><br>



    <div>

    
    <p>반려견 음식 관심분야</p>
      <div class="interest" id="food">
        <input type="checkbox" name="foodInterest" id="dry" value="건식">
        <label for="dry">건식</label>
        
        <input type="checkbox" name="foodInterest" id="wet" value="습식">
        <label for="wet">습식</label>
        
        <input type="checkbox" name="foodInterest" id="cooked" value="화식">
        <label for="cooked">화식</label>
        
        <input type="checkbox" name="foodInterest" id="semiwet" value="반습식">
        <label for="semiwet">반습식</label>
        
        <br>
        
        <input type="checkbox" name="foodInterest" id="allergy" value="알러지">
        <label for="allergy">알러지</label>
        
        <input type="checkbox" name="foodInterest" id="medicine" value="약품">
        <label for="medicine">약품</label>
        
        <input type="checkbox" name="foodInterest" id="nutrient" value="영양제">
        <label for="nutrient">영양제</label>
        
        <input type="checkbox" name="foodInterest" id="nothing" value="선택안함">
        <label for="nothing">선택안함</label>
      </div>

     
    <p>반려견 목욕 관심분야</p>
    <div class="interest" id="clean">
      <input type="checkbox" name="cleanInterest" id="long" value="장모용샴푸">
      <label for="sports">장모용샴푸</label>

      <input type="checkbox" name="cleanInterest" id="short" value="단모용샴푸">
      <label for="hiking">단모용샴푸</label>

      <input type="checkbox" name="cleanInterest" id="impulse" value="저자극샴푸">
      <label for="impulse">저자극샴푸</label>

      <br>

      <input type="checkbox" name="cleanInterest" id="unscented" value="무향샴푸">
      <label for="unscented">무향샴푸</label>

      <input type="checkbox" name="cleanInterest" id="rinse" value="린스">
      <label for="rinse">린스</label>

      <input type="checkbox" name="cleanInterest" id="treatment" value="트리트먼트">
      <label for="treatment">트리트먼트</label>

      <input type="checkbox" name="cleanInterest" id="nothing" value="선택안함">
      <label for="nothing">선택안함</label>
    </div>
  
  </div>
      
    
      <br><br>
      <label for="signup"></label>
      <div>
        <button  id="signup" name="signup" onclick="return joinPet();'" class="btn btn-success">Sign Up</button>
      </div>
    
    
    </fieldset>
  </form>
  
  <script>
  /*  아이디 중복확인 하기 !!  */
 	function idCheck(){
		var userId = $("#enrollId").val();
		var idReg = /^[a-zA-z0-9]{5,30}$/ig;
		
		if(userId == '') {
			$("#result").text("아이디를 입력해주세요.").css("color", "red");
			return false;
		}
		
		$.ajax({
			url : "pet.idCheck",
			data : { checkId : userId },
			type : "post",
			success : function(result){
					//console.log(result);
		  				 if(result == "NNNNN"){
		  					$("#result").text("사용할 수 없는 아이디 입니다. 다른 아이디를 입력해주세요.").css("color", "red");
		  					$("#enrollId").select();
		  				}else{
		  			        $("#result").text("사용가능한 아이디 입니다.").css("color", "green");
		  			     }
			},
			error : function(){
				console.log("아이디 중복확인 통신실패");
			}
			
		});
	} 
		    
		    

	//비밀번호 입력+확인 
	function pwdTest(){
		 var pwdReg = /^[a-zA-Z0-9!@#$%^&*]{8,15}$/g;
		 
		 if(pwdReg.test($("#userPwd").val())){ 
				 $("#pwdTest1").text("유효한 비밀번호입니다.").css("color", "green");
				
	          }else{ //비밀번호 테스트 실패
	        	  $("#pwdTest1").text("유효한 비밀번호를 입력해주세요.").css("color", "red");
	          		return false;
	          }
		
	         if(($("#userPwd").val()) == ($("#userPwd2").val())){ //비번, 비번확인 일치하면
	         	$("#pwdPass").text("비밀번호가 일치합니다.").css("color", "green");
	         }else{ //비밀번호 확인 틀렸을시
	         	$("#pwdPass").text("비밀번호가 일치하지 않습니다.").css("color", "red");
	       			$("#userPwd2").focus();
	       			return false;
	       	   
	         }

	}
	
	
	function joinPet(){
			     var idReg = /^[a-zA-z0-9]{5,30}$/ig;
			     var pwdReg = /^[a-zA-Z0-9!@#$%^&*]{8,15}$/ig;
			     var nameReg = /^[가-힣]{2,10}$/g;
	
			     
		      $("#signup").click(function(){

		    	 //아이디 조건 테스트
		        if(idReg.test($("#userId").val())){
		          
		        }else{ //아이디 테스트 실패
		        	$("#result").text("유효한 아이디를 입력해주세요.");
			        return false;
				}	
		    	 
		      //비밀번호 조건 테스트	
				if(pwdReg.test($("#userPwd").val())){ 
					
		            if(($("#userPwd").val()) === ($("#userPwd2").val())){ //비번, 비번확인 일치하면

		            }else{ //비밀번호 확인 틀렸을시
		            	$("#pwdPass").text("비밀번호가 일치하지 않습니다.").css("color", "red");
		           	 	$("#userPwd").focus();
		          		$("#userPwd2").focus();
		          	    return false;
		            }
					
		          }else{ //비밀번호 테스트 실패
		        	  $("#pwdPass").text("유효한 비밀번호를 입력해주세요.").css("color", "red");
		          	 return false;
		          }
	

				//이름 조건 테스트
		        if(nameReg.test($("#userName").val())){
					alert("회원가입 성공");
		                
		        }else{ // 이름 테스트 실패
		    	   alert("유효한 이름을 입력해주세요.");
		                return false;
		        }
				
			});
	
		}	
	  
	
  </script>

</body>
</html>