<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>신청서페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <!-- jQuery 인식 -->
    <style>
		 .menu1 a,.menu2 a,.menu3 a{
			color : rgb(162, 197, 121);
		 }
	     .menu1 a:hover,.menu2 a:hover,.menu3 a:hover{
	          color : rgb(194, 226, 157);
	      }        			
	      .login span{
	      	color : rgb(255, 181, 52);
	      } 
	      .login span:hover{
	      	color : rgb(255, 181, 52,0.5);
	      } 		
  
        article{
            display: flex;
        }
        .sell{
            margin: auto;
            width: 800px;
            padding-top: 25px;
            margin-bottom: 30px;
        }
        .sell span{
            font-weight: bold;
        }
        .sell div{
            margin-bottom: 10px;
            margin-top: 10px;
        }
        .upload-btn button{
            width: 800px;
        }
        .upload-btn:active{
            background-color: aqua;
        }
        .sell input{
        font-size 20px;
        }

        .type{
        	color : red;
        }
    </style>
</head>
<body>

	<%@ include file="./includes/header.jsp" %>

	<!-- VO객체에 저장하여 DB로 전송해 관리할 데이터 -->
	<!-- 회원만 입양신청서 작성이 가능하며 회원의 기본정보는 세팅해주되 수정가능 -->
	<!-- 동물의 기본정보는 세팅해주되 수정불가능 -->
	<!-- form action하여 DB에 정보 저장 성공하면 안내창(alter) 보여주기  -->
	<!--  						->return값 부여하여 js에서 확인하기 -->
	<article>
		<div class="sell">
		    <form action="applyInsert" method="post">
		    <!-- form에 입력된 값들을 넘기기 위해서 name 속성부여 -->
		    <!-- disabled : 수정불가,값 전달X / readonly : 수정불가,값 전달O -->
		    	<!-- 동물 번호 -->
		    	<input id="animalNum" type="hidden" name="animal_num">
		    	<!-- 동물 사진 -->
		    	<input id="animalImg" type="hidden" name="animal_img">
		    	<span>이름</span><br>
		            <div class="form-floating mb-3">
		                <input type="text" class="form-control" id="animalName"  name="animal_name" readonly>
		            </div>
		        <span>품종</span><br>
		            <div class="form-floating mb-3">
		                <input type="text" class="form-control" id="animalBreed" name="animal_breed" readonly>
		            </div>
		    	<span>성별</span><br>
		            <div class="form-floating mb-3">
		                <input type="text" class="form-control" id="animalSex" name="animal_sex" readonly>
		            </div>
		    	<span>나이</span><br>
		            <div class="form-floating mb-3">
		                <input type="text" class="form-control" id="animalAge" name="animal_age" readonly>
		            </div>
		     
		        <span>닉네임</span><br>
		            <div class="form-floating mb-3">
		                <input type="text" class="form-control" id="humanNickname" name="member_nickname">
		            </div>
		        <span>성명</span><br>
		            <div class="form-floating mb-3">
		                <input type="text" class="form-control" id="humanName" name="member_name">
		            </div>
	            <span>이메일</span><br>
		            <div class="form-floating mb-3">
		                <input type="text" class="form-control" id="humanEmail" name="member_email">
		            </div>
		        <div class="chk-btn">
		        	<button type="button" class="btn btn-warning" id="searchAddress">주소검색</button>
		        </div>
		        <span>우편번호</span><br>
		            <div class="form-floating mb-3">
		                <input type="text" class="form-control" id="humanZipCode" name="member_zipcode" readonly>
		            </div>
	            <span>도로명주소</span><br>
		            <div class="form-floating mb-3">
		                <input type="text" class="form-control" id="humanAddress" name="member_address" readonly>
		            </div>
		        <span>상세주소</span><br>
		            <div class="form-floating mb-3">
		                <input type="text" class="form-control" id="humanAddressInfo" name="member_address_info">
		            </div>
		    	<span>자기소개서</span><br>
		            <div class="form-floating">
		                <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px" name="member_comment"></textarea>
		                <label for="floatingTextarea2">고객님이 올릴 입양신청서 간단한 자기소개 내용을 작성해 주세요. (적절한 입양이 제한될수 있어요.)</label>
		            </div>
		        <div class="upload-btn">
                	<button id="adopt" class="btn btn-primary" onclick="save()">신청서 제출하기</button>
            	</div>
		    </form>
		</div>
    </article>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	//로컬스토리지에 저장된 정보 가져오기
	var jsonFiles = JSON.parse(localStorage.getItem("jsonFile"));
	var num = jsonFiles['ANIMAL_NO'];
	var img = jsonFiles['PHOTO_LIST'][0];
	var name = jsonFiles['NM'];
	var breed = jsonFiles['BREEDS'];
	var sex = jsonFiles['SEXDSTN'];
	var age = jsonFiles['AGE'];
	
	
	document.getElementById("animalNum").value = num;
	document.getElementById("animalImg").value = img;
	document.getElementById("animalName").value = name;
	document.getElementById("animalBreed").value = breed;
	document.getElementById("animalSex").value = sex;
	document.getElementById("animalAge").value = age;
		
	//우편주소 api
	window.onload = function(){
	    document.getElementById("searchAddress").addEventListener("click", function(){ //주소입력칸을 클릭하면
	        //카카오 지도 발생
	        new daum.Postcode({
	            oncomplete: function(data) { //선택시 입력값 세팅
	            	document.getElementById("humanZipCode").value = data.zonecode;
	                document.getElementById("humanAddress").value = data.address; // 주소 넣기
	                document.getElementById("humanAddressInfo").focus(); //상세입력 포커싱
	            }
	        }).open();
	    });
	}
	
	//세션에 저장된 회원 정보
	document.getElementById("humanNickname").value = '${login.member_nickname}';
	document.getElementById("humanName").value = '${login.member_name}';
	document.getElementById("humanEmail").value = '${login.member_email}';
	
	//입양신청서 제출하기
	function save(){ //실제 데이터를 보내는 곳 
		
		let chk =confirm(name+' 잘키워 주실꺼죠??');
		if(chk){
			document.getElementById("adopt").submit();
		}
	}
	
</script>
</html>