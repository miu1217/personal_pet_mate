<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
   
 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- Latest compiled and minified CSS -->
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
 <!-- jQuery library -->
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
 <!-- Popper JS -->
 <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
 <!-- Latest compiled JavaScript -->
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
    body{
        background-color: #F3F6ED;
    }

    .title{
        font-size: 40px;
     
    }


  /*추가정보 css영역*/
  .addInfo{
     width: 1300px;
     margin: auto;
     background-color: white;
     border-radius: 30px;
  }
  .addInfo tr{
  	height: 70px;
  }
  #coreName{
    width: 300px;
    background-color: #F0F0F0;
  }
  .basicInfo>table>tr, .addInfo>table>tr{   /* 테이블 tr마다 구분지어주기 */
    border: 1px black;
  }

 /*회원탈퇴 버튼 위치*/
 	#deleteButton{
 	margin left: 600px;
 }

 .maleForm {
    transform: ;
 }

 /*ㅡㅡㅡㅡㅡㅡㅡㅡㅡradio 모양변경ㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
 .select {
    padding: 15px 10px;
}
.select input[type=radio]{
    display: none;
}
.select input[type=radio]+label{
    display: inline-block;
    cursor: pointer;
    height: 35px;
    width: 140px;
    border: 1px solid #C0C0C0;
    line-height: 24px;
    text-align: center;
    font-weight:bold;
    font-size:13px;
    border-radius: 20px;
}
.select input[type=radio]+label{
    background-color: #fff;
    color: #333;
    font-size: 15px;
}

.select input[type=radio]:checked+label{
    background-color: #B0CC99;
    color: #fff;
}
.select>input[type=radio]{
  border-radius: 5px;
}
.select label{
    padding: 4px;
}

/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡradio 모양변경 끝ㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/


/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ질문번호 스타일ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
.qNumber{
    color: white;
    font-weight: bold;
    font-size: 20px;
    background: #B7CA79;
    width: 580px;
    display: flex;
    justify-content: center;
}

    
 /*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ진단테스트 radio이미지 옆으로 띄우기ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
         .addInfo {
            text-align: left; /* 텍스트를 왼쪽으로 정렬 */
            padding: 20px;
            border: 1px solid #ccc;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
		
	
    .questionText{
        font-size: 20px;
        font-weight: 600;
    }
    .btn{
        background-color: #B0CC99
       
       
    }
   
</style>


</head>
<body>
      <%@include file="../common/menubar.jsp"%>
    
  <div class="wrap" > 
  <form action="<%=contextPath%>/pet.updateTest" method="post">  
    <fieldset id="update-form">
    <br><br><br><br>
      <div class="title" align="center">Product Type Management</div> <br>
       <div align="center">질문에 응해주셔서 감사합니다.</div> <br> <br> <br>

    <div class="addInfo" >
        <br><br>
        <div class="qNumber">1/5 </div> <br>
        <div class="questionText"> Q. 이름 </div><br><br>
        <input type="text" value="${loginUser.userName}">
        <br><br><br><br>
       

        <!--radio 모양변경-->

            <div class="qNumber">2/5</div> <br>
           <div class="questionText"> Q. 성별</div> <br>
            <div class="select">
                <input type="radio" id="male" name="gender"><label for="male">남자</label>
                <input type="radio" id="female" name="gender"><label for="female">여자</label>
            </div>
            <br><br><br><br>

        <div class="qNumber">3/5</div> <br>
      <div class="questionText"> Q. 평소 어떤 제품을 자주 구매하시나요?</div> <br><br>
        <div class="select">         
            <input type="radio" id="dry" name="foodInterest" value="건식"><label for="dry">건식</label>
            <input type="radio" id="wet" name="foodInterest" value="습식"><label for="wet">습식</label>
            <input type="radio" id="cooked" name="foodInterest" value="화식"><label for="cooked">화식</label> 
            <input type="radio" id="semiwet" name="foodInterest" value="반습식"><label for="semiwet">반습식</label>  <br>
            <input type="radio" id="allergy" name="foodInterest" value="알러지"><label for="allergy">알러지</label>
            <input type="radio" id="medicine" name="foodInterest" value="약품"><label for="medicine">약품</label>
            <input type="radio" id="nutrient" name="foodInterest" value="영양제"><label for="nutrient">영양제</label>
            <input type="radio" id="nothing1" name="foodInterest" value="선택안함"><label for="nothing1">선택안함</label>
        </div>
     <br><br><br><br>

     <div class="qNumber">4/5</div> <br>
     <div class="questionText">Q. 평소 어떤 헤어제품을 사용하시나요?</div>  <br><br>

        <div class="select">        
            <input type="radio" name="cleanInterest" id="long" value="장모용샴푸"><label for="long">장모용샴푸</label>
            <input type="radio" name="cleanInterest" id="short" value="단모용샴푸"><label for="short">단모용샴푸</label>
            <input type="radio" name="cleanInterest" id="impulse" value="저자극샴푸"><label for="impulse">저자극샴푸</label> 
            <input type="radio" name="cleanInterest" id="unscented" value="무향샴푸"><label for="unscented">무향샴푸</label>  <br>
            <input type="radio" name="cleanInterest" id="rinse" value="린스"><label for="rinse">린스</label>
            <input type="radio" name="cleanInterest" id="treatment" value="트리트먼트"><label for="treatment">트리트먼트</label>
            <input type="radio" name="cleanInterest" id="nothing2" value="선택안함"><label for="nothing2">선택안함</label>
        </div>
     <br><br><br><br>
 


     <div class="qNumber">5/5</div> <br>
     <div class="questionText"> Q. 이용하시는데 불편한 점을 작성해주세요.</div> <br><br>
         <textarea name="agree" id="agree" cols="75" rows="14" style="resize: none;" ></textarea>
        <br><br>

        <div>
            <button type="submit" class="btn" style="color: white;">수정하기</button>   
            <button type="button" onclick="cancelUpdate();" class="btn" style="color: white;">취소</button>
        </div>
      </div>
      <br><br><br><br>
  </div>
      
      
      
      
      <script> 
      	
      		$(function(){
      		
      			var chooseGender = "${loginUser.gender}"
          			
          			$("input[name=gender]").each(function(){   
          				var value1 = $(this).val();     
          				if(chooseGender.includes(value1)) {  
          					$(this).attr("checked",true);
          				}
          			});
      			
      			//반려견 음식 관심분야
      			var chooseFoodInterest = "${loginUser.foodInter}"   //'건식,습식,영양제' 나 '빈 문자열'로 저장됨
      			
      			
      			
      			$("input[name=foodInterest]").each(function(){
      				var value2 = $(this).val();
      				if(chooseFoodInterest.includes(value2)) {
      					$(this).attr("checked",true)
      				}
      			});
      			
      			
      			
      			
      			
      		 	//반려견 목욕 관심분야
      			var cleanInterest = "${loginUser.cleanInter}"  //'트린트먼트,샴푸' 나 '빈 문자열'로 저장됨
      			
      			$("input[name=cleanInterest]").each(function(){
      				var value3 = $(this).val();
      				if(cleanInterest.includes(value3)) {
      					$(this).attr("checked",true)
      				}
      			});
      			
      			
      			
      			
      			
      		});
 	
      
    
      
      </script>
      
      
      
      
    
      <br><br>
     
      
    
    
    </fieldset>
  </form>

</div>
   <script>
    function cancelUpdate() {
      // 여기에 취소 버튼을 눌렀을 때의 동작을 추가하면 됩니다.
      location.href = '<%=contextPath%>/pet.myPage';
    }
  </script>

  


</body>
</html>