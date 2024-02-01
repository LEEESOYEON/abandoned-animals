<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kor">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>상세페이지</title>
		
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
			crossorigin="anonymous">
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
			crossorigin="anonymous"></script>
	</head>
	<style>
		.animalImages{
			width : 200px;
			height : 100px;
		}
		.title{
			color : red;
		}
	</style>
	<style>
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "KBO 다이아고딕 medium";
            max-width: 1280px;
        }
        a{
            text-decoration: none;
        }
        header{
            display: flex;
            height: 100px;
            max-width: 1280px;
        }
        .logo{
            margin-top: 20px;
            margin-left: 10px;
        }
        .logo-btn a{
            color: brown;
        }
        .logo-btn{
            padding: 1px;
            border-radius: 5px;
            background-color: white;
            outline: none;
            border: none;
            color:  brown;
        }
        .logo-btn h5{
            font-size: 1.5em;
            font-weight: bold;

        }
        .header-menu{
            margin-left: 30px;
            margin-top: 40px;
        }
        .menu1, .menu2{
            border: none;
            border-radius: 5px;
            background-color: white;
            width: 130px;
            font-size: 1.2em;
            font-weight: bold;

        }
        .menu1 a{
            color: maroon;
        }
        .menu2 a{
            color: chocolate
        }
        .menu2 a:hover{
            color: rgba(222, 184, 135, 1);
        }
        .login{
            font-size: 1.1em;
            margin-left: 150px;
            margin-top: 40px;
        }
        .login span{
            font-weight: bold;
            color: maroon;
        }
        .member-btn{
            width: 100px;
            border-radius: 5px;
            background-color: white;
            border: none;
        }
        .member-btn span:hover{
            color: rgba(222, 184, 135, 1);
        }
        .login-bar{
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;
            
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
        

    
        footer{
            display: flex;
            margin-bottom: 30px;
            
        }
        .footer-content{
            font-size: 0.85em;
            margin-left: 270px;
        }
        .footer-content span{
            font-weight: 600;
        }
        .sns-btn{
            padding-left: 100px;
            padding-top: 30px;
        }
        .sns-btn button{
            background-color: white;
            border: none;
            padding-left: 20px;
            
        }
        .sns-btn button a{
            color: gray;
            
        }
        
        .type{
        	color : red;
        }
    </style>
	<body>
	<div id="carouselExampleDark" class="carousel carousel-dark slide">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="10000">
      <img src="..." class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>First slide label</h5>
        <p>Some representative placeholder content for the first slide.</p>
      </div>
    </div>
    <div class="carousel-item" data-bs-interval="2000">
      <img src="..." class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Second slide label</h5>
        <p>Some representative placeholder content for the second slide.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="..." class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Third slide label</h5>
        <p>Some representative placeholder content for the third slide.</p>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>	
		<header>
        <div class="logo">
            <button class="logo-btn">
                <a href="<%=request.getContextPath()%>">
                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-emoji-heart-eyes" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path d="M11.315 10.014a.5.5 0 0 1 .548.736A4.498 4.498 0 0 1 7.965 13a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .548-.736h.005l.017.005.067.015.252.055c.215.046.515.108.857.169.693.124 1.522.242 2.152.242.63 0 1.46-.118 2.152-.242a26.58 26.58 0 0 0 1.109-.224l.067-.015.017-.004.005-.002zM4.756 4.566c.763-1.424 4.02-.12.952 3.434-4.496-1.596-2.35-4.298-.952-3.434zm6.488 0c1.398-.864 3.544 1.838-.952 3.434-3.067-3.554.19-4.858.952-3.434z"/>
                      </svg>
                      <h5>고구마 마켓</h5>
                </a>
            </button>
        </div>
        <div class="header-menu">
            <button class="menu1"><a href="board">자유게시판</a></button>
            <button class="menu2"><a href="<%=request.getContextPath()%>">보호소게시판</a></button>
            <button class="menu2"><a href="map">보호소지도</a></button>
        </div>
        <div class="login">
            <span>아이디 </span>
            <input class="login-bar" type="text" size="15">
            <span>비밀번호 </span>
            <input class="login-bar" type="password" size="15">
            <button class="member-btn"><span>로그인</span></button>
            <button class="member-btn"><a href="#"><span>회원가입</span></a></button>
        </div>
    </header>
		<div id="localStore">
			<form></form>			
		</div>
	</body>
	<script>
	
		var jsonFiles = JSON.parse(localStorage.getItem("jsonFile"));
		
		//특정 key 삭제하기
		//json 파일을 직접 수정하는 것은 불가능하나
		//json은 js 객체의 형태를 따르기 때문에 가능
		delete jsonFiles['INTRCN_MVP_URL'];
		delete jsonFiles['TMPR_PRTC_CN'];
		
		var titleArr = ["번호","이름","입소날짜","종","품종","성별","나이","체중","입양상태","입시보호상태","소개내용"];		
		
		var htmlProcess = "<form action='apply' method='post'>";
		
		/*
		for(var key in jsonFiles){
			console.log(key+"/"+jsonFiles[key])
			if(key == "PHOTO_LIST"){
				for(var j=0; j<jsonFiles.PHOTO_LIST.length; j++){				
					htmlProcess += "<p><img src=https://"+jsonFiles[key][j]+" style='width:150px; height:100px'></p>"
				}
			}else{
				htmlProcess += "<p>"+key+" : "+jsonFiles[key]+"</p>"				
			}
		}
		*/
		
		for(var i=0; i<Object.keys(jsonFiles).length; i++){
			var key = Object.keys(jsonFiles)[i];
			console.log(titleArr[i]+"-------"+jsonFiles[key])
			if(key == "PHOTO_LIST"){

				for(var j=0; j<jsonFiles.PHOTO_LIST.length; j++){				
					htmlProcess += "<p><img src=https://"+jsonFiles[key][j]+" style='width:150px; height:100px'></p>"
					
				}
				
			}else{
				htmlProcess += "<p><span class='title'>"+titleArr[i]+"</span> : "+jsonFiles[key]+"</p>"				
			}
		}
		htmlProcess += "<button type='submit'>입양신청</button><button type='submit'>관심등록</button></form>";
		document.getElementById('localStore').innerHTML += htmlProcess
		

	</script>
</html>




