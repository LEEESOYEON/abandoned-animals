<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>메인페이지</title>

	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	    <!-- jQuery 인식 -->

	<style>
	
				.menu1 a{
        			color : rgb(66, 123, 1);

				}
				.menu2 a,.menu3 a{
        			color : rgb(162, 197, 121);
       			}
               .menu2 a:hover,.menu3 a:hover{
                    color : rgb(194, 226, 157);
                } 
                .btn1,.login span{
                	color : rgb(255, 181, 52);
                } 
                .btn1:hover{
                	color : rgb(255, 181, 52,0.5);
                } 
                    			
                article {
                    margin-bottom: 50px;
                }

                .cover {
                    display: flex;
                    background: url(./img/mainlogo.png);
                    height: 200px;
                }
                .carousel-inner img{
                	height:420px;
                	border:none;
                	border-radius: 20px;
                	
                }

                .cover-content {
                	width:1150px;
                    margin: 30px auto;
                    font-size: 1.2em;
                }

                .cover-content h3 {
                    font-size: 3em;
                }

                .goods-top {
                    text-align: center;
                    padding-top: 30px;
                }

                .upload-btn {
                    margin-left: 1150px;
                    margin-bottom: 5px;
                    padding: 3px;
                    background-color: white;
                    color: maroon;
                    font-weight: bold;
                    border-radius: 5px;
                    border: none;
                }

                .upload-btn:hover {
                    color: rgba(222, 184, 135, 1);
                }

                .ser-bar {
                    margin-top: 5px;
                    margin-left: 390px;
                    width: 500px;
                }

                .animalphoto {
                    margin-left: auto;
                    margin-right: auto;
                }

                .animalphoto tr td {
                    padding: 5px;
                    outline: 1px;
                }

                .animalNM {
            		font-weight: 400;                
                    text-align: center;
                    font-size: 1.2em;
        			color : rgb(66, 123, 1);
        			margin-top:5px;
                    
                }

                .animalimg {
                    width: 280px;
                    height: 280px;
                    border-radius: 20px;
                    border: none;
                }
                .animalimg:hover{
                	background-color: rgba(0,0,0,0.5);
                }

                .upload-btn a {
                    color: maroon;
                }
	</style>
</head>
<body>
	<%@ include file="./includes/header.jsp" %>
	 <article>
<!--         <section class="cover"> -->
            <div class="cover-content">
         <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="<%=request.getContextPath()%>/resources/img/aaa.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="<%=request.getContextPath()%>/resources/img/sss.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="<%=request.getContextPath()%>/resources/img/ddd.jpg" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
        <section class="goods">
            <div class="goods-top">
                <h2>☆★유기동물 친구들★☆   </h2>
 
        </section>

    </article>

    <div >
    	<table id="photoInfo" class="animalphoto"></table>
    </div>
	<table id="demoText">
	</table>
	
	<%@ include file="./includes/footer.jsp" %>
	
</body>

<script>
	$(document).ready(function(){
		//이미지 API 가져오기
		$.ajax({
			async : true,
			type : 'GET',
			url : 'animalPhotoAPI',
			contentType : "application/json; charset=UTF-8",
			success : function(photoData){
				console.log("photo success");
				//console.log(photoData);
				//정보API 가져오기
				$.ajax({
					async : true,
	                type : 'GET',
	                url : 'animalInfoAPI',
	                contentType : "application/json, charset=UTF-8",
	                success : function(infoData){
	                    console.log("info success");
	                    //console.log(infoData);
						var parsedPhotoData = JSON.parse(photoData); //이미지 API json parsing
	                    var parsedInfoData = JSON.parse(infoData); //정보 API json parsing
	
	                   // var htmlProcess;
	
	                    var photoRows = parsedPhotoData.TbAdpWaitAnimalPhotoView.row; //이미지 API key find
	                    var infoRows = parsedInfoData.TbAdpWaitAnimalView.row; //정보 API key find
	
	                    //이미지 API와 정보 API 동물번호를 기준으로 매칭하여 
	                    //정보 API에 이미지 정보들을 저장하는 key 생성
	                    for(var i=0; i<infoRows.length; i++){
	                        var animalInfoNo = infoRows[i].ANIMAL_NO;
	                        let imageArr = [];
	                        for(var j=0; j<photoRows.length; j++){
	                            var animalPhotoNo = photoRows[j].ANIMAL_NO;
	                            if(animalInfoNo == animalPhotoNo){
	                                imageArr.push(photoRows[j].PHOTO_URL);
	                                //break;
	                            }
	                        }
	                        infoRows[i].PHOTO_LIST = imageArr;
	                    }
	                    
	                    var jsonFile = JSON.stringify(infoRows);
	                   
	                    //브라우저 로컬스토리지 내 api 모든 정보 저장
	                    localStorage.setItem('jsonFileAll',jsonFile);
	                    
	                    //-로직 비교
	                    //testHome에서는 api 매칭 후 배열에 저장하여 필요한 사진을 따로 가져오기 때문에
	                    //속도가 좀 더 빠르지만 서버로 데이터 전송하기 복잡
	                    //mainHome에서는 api를 매칭하며 새로운 key에 이미지 사진 배열 저장 후
	                    //다시 배열에서 이미지를 가져오기 때문에 속소가 느리지만
	                    //서버로 json 형태로 전송이 간편
						
	                 	//매칭된  api를 이용하여 html 태그 생성
	                    for(let i=0; i<infoRows.length; i++){
	                        //var submitRows = infoRows[i];
	                        
	                        if(i==0 || i % 4==0){
	                        	var tableRow = document.createElement('tr');
	                        }
	                        
	                        var tableData = document.createElement('td')
	                        
	                        var link = document.createElement('a');
	                        link.href = 'viewDemo';
	                        link.onclick = function(){
	                            storage(infoRows[i]);
	                        }
	                        
	                        var image = document.createElement('img');
	                        image.src = 'https://'+infoRows[i].PHOTO_LIST[0];
	                        $(image).addClass('animalimg');
	                        
	                        var paragraph = document.createElement('p');
	                        paragraph.textContent = infoRows[i].NM;
	                        $(paragraph).addClass('animalNM');
	                        
	                        var breakTag = document.createElement('br');
	                        var breakTag2 = document.createElement('br');
	                        
	                        link.appendChild(image);
	                        link.appendChild(breakTag);	           
	                        link.appendChild(paragraph);
	                        
	                        tableData.appendChild(link);
	                        tableRow.appendChild(tableData);
	                        
	                        if(i != 0 || i % 4 !=0){	                        	
			                   document.getElementById('photoInfo').appendChild(tableRow);
	                        }
	                        
	                    }
	                   
	                },
	                error : function(error){
	                    alert("info error");
	                }
				})
			},
	        error : function(error){
	            alert("photo error");
	        }
		})
	})
	
	//선택된 api의 정보 로컬스토리지에 저장
	function storage(jsonFile){	
		/*
		자바스크립트에서 매개변수로 객체를 보내지 못한다.
		하지만 json은 객체(object)이다.
		따라서, function에 매개변수를 넣을 때 JSON.stringify()를 해주어야 한다.
		하지만 function으로 매개변수 json을 string으로 형변환을 하여 전달했지만 object로 인식한다.
		따라서, function내에서 한번 더 stringify()를 진행하여 로컬스토리지에 저장해주어야 한다.
		로컬스토리지에 저장할 수 있는 데이터 형태는 string만 가능하기 때문이다.
		*/
		//console.log(jsonFile)
		var jsonString = JSON.stringify(jsonFile);
		localStorage.setItem('jsonFile',jsonString);
	}
</script>


