<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>유기동물 상세페이지</title>
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
            font-weight: 400;
        }
        .sell div{
            margin-bottom: 10px;
            margin-top: 10px;
        }
        .upload-btn button{
        	width : 800px;
        	color : white;
        }
        .upload-btn a{
        	color : white;
        }
        .upload-btn:active{
            background-color: aqua;
        }
    
    	.type{
    		text-align : center;
    		margin-bottom : 40px;
    	}
    	span.animalName{    	
    		color : rgb(255, 181, 52);
    	}
    	#animalInfo{
    		border : solid 2px;
    		padding : 50px;
    	}
    	.title{
    		background: rgb(155, 184, 205);
    		color: rgb(255, 247, 212);
    		text-align : center;
    		padding-top : 20px;
    		padding-bottom : 20px;
    	}
    	table.type05 {
    	  width: 800px;
		  border-spacing: 1px;
		  /*text-align: left;*/
		  line-height: 1.5;
		  border: 2px solid #ccc;
		  margin: 20px auto;
		}
		table.type05 th {
		  width: 150px;
		  padding: 10px;
		  font-weight: 400;
		  vertical-align: top;
		  border-bottom: 2px solid #ccc;
		  background: rgb(155, 184, 205);
		  color: rgb(255, 247, 212);
		}
		table.type05 td {
		  width: 350px;
		  padding: 10px;
		  vertical-align: top;
		  border-bottom: 1px solid #ccc;
		  text-align : center;
		}
		.photoview{
            border-radius: 10px;

        }
        .photoview img{
        	width:800px;
        	height: 500px;
        	border-radius: 30px;
        	border: solid 3px #ccc;
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
		    
		    <!-- form에 입력된 값들을 넘기기 위해서 name 속성부여 -->
		    <!-- disabled : 수정불가,값 전달X / readonly : 수정불가,값 전달O -->
		    <div id="animalTitle">
		    	<h2 class="type">안녕하세요<span class="animalName"></span> 입니다!</h2>
		    </div>
		    	<section>
                   <div>
                       <div class="photoview">
                           <div id="carouselExample" class="carousel slide">
                               <div class="carousel-inner" id="photoviewid">

                               </div>
                               <button class="carousel-control-prev" type="button"
                                   data-bs-target="#carouselExample" data-bs-slide="prev">
                                   <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                   <span class="visually-hidden">Previous</span>
                               </button>
                               <button class="carousel-control-next" type="button"
                                   data-bs-target="#carouselExample" data-bs-slide="next">
                                   <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                   <span class="visually-hidden">Next</span>
                               </button>


                               <div id="carouselExample" class="carousel slide"></div>
                              </div>
                             </div>
                         </div>
                      </section>
		    	<table border="1" class="type05">
		    	<tr>
		    	<th class="title" colspan="2">이름 ( 보호센터 )</th>
		            <td class="animalName" colspan="2">
		                
		            </td>
		        </tr>
		        <tr>
		        <th class="title">종</th>
		            <td class="form-floating mb-3" id="animalSpcs">
		                
		            </td>
		        <th class="title">품종</th>
		            <td class="form-floating mb-3" id="animalBreed">
		                
		            </td>
		        </tr>
		    	<tr>
		    	<th class="title">성별</th>
		            <td class="form-floating mb-3" id="animalSex">
		                
		            </td>
		    	<th class="title">나이</th>
		            <td class="form-floating mb-3" id="animalAge">
		                
		            </td>
		    	</tr>
		        <tr>
		    	<th class="title" scope="row">입소날짜</th>
		            <td class="form-floating mb-3" id="animalDate">
		                <!-- <input type="text" class="form-control" id="animalDate" readonly> -->
		            </td>
		        <th class="title">체중</th>
		            <td class="form-floating mb-3" id="animalBdwgh">
		                
		            </td>
		        </tr>
		        <tr>
		        <th class="title">입양상태</th>
		            <td class="form-floating mb-3" id="animalAdoptSttus">
		                
		            </td>
		        <th class="title">입양보호상태</th>
		            <td class="form-floating mb-3" id="animalProtectSttus">
		                
		            </td>
		        </tr>
		        </table>
		        <p class="title">유기동물 소개서</p>
		            <div class="form-floating mb-3" id="animalInfo">
		                
		            </div>
		         <div class="upload-btn">
		         <!-- <a href ="apply"> <button class="btn btn-warning">입양 신청하기</button></a> -->
                 <button id="adoptButton" class="btn btn-warning" onclick="adoptChk()">입양 신청하기</button>
            	</div>
		    <div class = "upload-btn">
			<c:if test = "${login !=null }">
                <button class ="btn btn-warning" onclick="likeChk()">관심 등록하기</button>
			</c:if>
			<c:if test ="${login ==null }">
				<a href = "memberlogin"><button class ="btn btn-warning">관심 등록하기</button></a>
			</c:if>
                
		    </div>
		</div>
    </article>
    <%@ include file = "./includes/footer.jsp" %>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	//로컬스토리지에 저장된 선택됭 동물의 정보를 json으로 parsing
	var jsonFiles = JSON.parse(localStorage.getItem("jsonFile"));
	
	/*
	for(let j=0; j<jsonFiles.PHOTO_LIST.length; j++){
		var image = document.createElement('img');
		image.src = 'https://'+jsonFiles.PHOTO_LIST[j];
		image.style.width = '150px';
		image.style.height = '100px';
		
		var classIamgeDivElement = document.querySelector('.imageDiv'); //클래스가 imageDiv인 첫번째 요소 선택
		if(classIamgeDivElement){
			classIamgeDivElement.appendChild(image);
		}
		
		//document.getElementsByClassName('sell').appendChild(image);
	}
	*/
	
	//사진 리스트 크기만큼 태그 생성
	for(let j=0; j<jsonFiles.PHOTO_LIST.length; j++){
		let div = document.createElement('div');
        if (j == 0) {
            $(div).addClass("carousel-item active");
        } else {
            $(div).addClass("carousel-item");
        }
        let img = document.createElement('img');
        img.src = "https://" + jsonFiles.PHOTO_LIST[j];
        $(img).addClass("d-block w-100");

        div.appendChild(img);

        document.getElementById('photoviewid').appendChild(div);
	}
	
	/*
	// 페이지 로드 시 load 함수를 호출하여 이미지를 표시합니다.
    window.onload = function () {
        load();
    }
	*/
	
	var name = jsonFiles['NM'];
	var date = jsonFiles['ENTRNC_DATE'];
	var spcs = jsonFiles['SPCS'];
	var breed = jsonFiles['BREEDS'];
	var sex = jsonFiles['SEXDSTN'];
	var age = jsonFiles['AGE'];
	var bdwgh = jsonFiles['BDWGH'];
	var adopt = jsonFiles['ADP_STTUS'];
	var protect = jsonFiles['TMPR_PRTC_STTUS'];
	var info = jsonFiles['INTRCN_CN'];
	
	//document.getElementsByClassName("animalName").textContent = ' " '+name+' " ';
	//class는 HTMLCollection을 반환하기 때문에 배열과 유사하게 동작하여 바로 설정 불가능
	//-> 반복문이나 각 요소에 개별적으로 접근하여 값을 설정해야 한다.
	var nameElements = document.getElementsByClassName("animalName");
	for(let i=0; i<nameElements.length; i++){
		nameElements[i].textContent = ' " '+name+' " ';
	}
	//document.getElementById("animalName").value = name;
	document.getElementById("animalDate").textContent = date;
	document.getElementById("animalSpcs").textContent = spcs;
	document.getElementById("animalBreed").textContent = breed;
	document.getElementById("animalSex").textContent = sex;
	document.getElementById("animalAge").textContent = age;
	document.getElementById("animalBdwgh").textContent = bdwgh;
	document.getElementById("animalAdoptSttus").textContent = adopt;
	document.getElementById("animalProtectSttus").textContent = protect;
	document.getElementById("animalInfo").innerHTML += info;
		
	//console.log(document.getElementById("animalNum").value);
	
	function like(){

			let chk =confirm('관심 등록했습니다. 나의 페이지를 확인하겠습니까?');
				
			if(chk){
				var link = 'mypage';
					insert();	
					location.href = link;
			}else{
				insert();
				window.scrollTo(0,0);
			}

	};
	
	function insert(){
		var mid = '${login.member_email}';
		var animal_no = jsonFiles['ANIMAL_NO'];
		var photo_url = jsonFiles['PHOTO_LIST'][0];

		//관심등록한 정보 서버에 전달
		$.ajax({
			async: true,
			type : 'POST',
			url : 'like',
			data :{
				animal_num : animal_no,
				animal_name : name,
				animal_breed : breed,
				animal_sex : sex,
				animal_age : age,
				member_email : mid,
				photo_url : photo_url	
			},
			contenstType : "application/json; charset=UTF-8",
			success : function(){
				console.log('성공');
			},
			error: function(){
				console.log('실패');
			}
		})
	};
	
	//관심등록버튼
	function likeChk(){
			console.log("관심등록 버튼 클릭");
			var mid = '${login.member_email}';
			var animal_no = jsonFiles['ANIMAL_NO'];
			//관심등록된 동물 재등록 불가
			$.ajax({
				async : true,
				type : 'GET',
				url : 'likeChk', //입양신청제출 여부 확인
				data : {
					animal_num : animal_no,
					member_email : mid,
				},
				contentType : "application/json; charset=UTF-8",
				success : function(cont){
					if(cont == 1){
						alert("이미 관심등록 된 아이입니다.")
						window.scrollTo(0,0);
					}else{
						like();
					}
				},
				error : function(error){
					console.log("에러 : "+error);
				}
			})
		};
		
	
	
	//입양 신청 버튼 클릭
	function adoptChk(){
		console.log("입양신청하기 버튼 클릭");
		var member_nick = '${login.member_nickname}';
		//입양 신청 한 번만 가능하기 하기
		$.ajax({
			async : true,
			type : 'GET',
			url : 'adoptChk', //입양신청제출 여부 확인
			data : {
				type : "회원",
				info : member_nick
			},
			contentType : "application/json; charset=UTF-8",
			success : function(adoptCount){
				if(adoptCount == 1){
					alert("입양신청서 제출은 한 번만 가능합니다.")
				}else{
					location.href = 'apply';
				}
			},
			error : function(error){
				console.log("에러 : "+error);
			}
		})
	};
	
	//입양신청 진행 여부
	$(document).ready(function(){
		var animal_no = jsonFiles['ANIMAL_NO']; 
		$.ajax({
			async : true,
			type : 'GET',
			url : 'adoptChk',
			data : {
				type : "동물",
				info : animal_no
			},
			contentType : "application/json; charset=UTF-8",
			success : function(adoptAnimalCount){
				if(adoptAnimalCount == 1){
					var animalH2 = document.createElement('h2');
					animalH2.textContent = "※ 입양 신청 진행중입니다. ※";
					animalH2.setAttribute("class","type");
					animalH2.style.color = 'red';
					//animalH2.style.border = 'solid 2px red';
					document.getElementById('animalTitle').appendChild(animalH2);
					$('#adoptButton').hide();
				}
			},
			error : function(error){
				console.log("에러 : "+error);
			}
		});
	})

	
</script>
</html>