<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
	<head>
		<title>보호소지도페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	    <!-- jQuery 인식 -->
	<%@ include file="./includes/header.jsp" %>
	<style> 	
		.menu3 a{
      		color : rgb(66, 123, 1);
	
		}
		.menu1 a,.menu2 a{
      		color : rgb(162, 197, 121);
     	}
        .menu1 a:hover,.menu2 a:hover{
             color : rgb(194, 226, 157);
         }
		#map{
			border: none;
			border-radius: 10px;
			width:80%;
			height:500px;
			margin: 100px auto;
		}
		.storeName{
			color : blue;
		}
		.storeArr{
			font-size : smaller;
		}
	</style>
	</head>
	<body>
		
		<div id="map"></div>
		
		<%@ include file = "./includes/footer.jsp" %>
		
	</body>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c868c14a4bc2596aeefd4cb6e73087ed">
	</script>
	<script>
		const API_KEY = 'c57ad986552f4cb9b789dab93d1cbe1f';
		
		//await을 하기 위해 async function으로 선언한다.
		async function getData(){
			const url = 'https://openapi.gg.go.kr/OrganicAnimalProtectionFacilit?Key='+API_KEY+'&Type=json';
			const response = await fetch(url);
									//url을 호출한다.
							//호출된 url을 대기하라는 의미로 await을 한다.		
			const JsonData = await response.json();
			//그 중 json형식으로 받아와라.
			
			const data = JsonData.OrganicAnimalProtectionFacilit[1]; //원하는 key로 value에 접근
			console.log("data",data);
			
			//api를 호출하는 기본적인 루트(url형성->await fetch->await .json())
			//return JsonData;

			var locations = data.row.map((spot) => [
				spot.ENTRPS_NM ,
				spot.REFINE_ROADNM_ADDR ,
				spot.ENTRPS_TELNO ,
				spot.REFINE_WGS84_LAT ,
				spot.REFINE_WGS84_LOGT
			]); //배열의 형태로 return 해주는 배열함수 map()
			//console.log(locations);
						
			drawMap(locations);
		}
		
		function drawMap(locations){
			var mapContainer = document.getElementById('map');
			var mapOptions = {
				center : new kakao.maps.LatLng(37.277260, 127.027991), //지도의 중심좌표. => 수원시 휴먼교육센터의 위도와 경도
				level: 9 //지도의 레벨(확대, 축소 정도)
				//숫자가 높아질 수록 멀어진다.
			}
			var map = new kakao.maps.Map(mapContainer, mapOptions); //지도 생성 및 객체 리턴
		
			var positions = [];
			for(let i=0; i<locations.length; i++){
				console.log(locations[i][2]);
				positions.push({
					title : '<span class="storeName">'+locations[i][0]+'</span><br><span class="storeArr">'+locations[i][1]+'</span><br><span class="storeTel">'+locations[i][2]+'</span>',
					latlng : new kakao.maps.LatLng(locations[i][3],locations[i][4])
				})
			}
			//console.log(positions)
			
			for(let i=0; i<positions.length; i++){
				var marker = new kakao.maps.Marker({
					map : map, //마커를 표시할 지도
					position : positions[i].latlng //마커의 위치
				});
				
				var infoWindow = new kakao.maps.InfoWindow({
					content : '<div style="height:90px";>'+positions[i].title+'</div>' ,  //인포윈도우에 표시할 내용
					removable : true //닫기 버튼 추가
				});
				
				//마커에 이벤트를 등록하는 함수를 만들고 즉시 호출하여 클로저를 만든다.
				//즉시 실행 함수(IIFE)
				(function(markerChk,infoWindowTitle){
					//마커에 mouseover 이벤트를 등록하고 마우스 클릭 시 infoWindow 표시
					kakao.maps.event.addListener(marker,'click',function(){
						infoWindowTitle.open(map,markerChk);
					})
					//맵에 mouseout 이벤트를 등록하고 마우스 클릭 시 infoWindow 닫기
					kakao.maps.event.addListener(map,'click',function(){
						infoWindowTitle.close();
					})
				})
				(marker,infoWindow);
				//함수를 정의하자마자 호출하여 즉시 실행
				//이름이 없는 익명 함수 표현식 사용
				
				/*
				var overlay = new kakao.maps.CustomOverlay({
					content : positions[i].title //인포윈도우에 표시할 내용
				});
				
				//마커에 이벤트를 등록하는 함수를 만들고 즉시 호출하여 클로저를 만든다.
				//즉시 실행 함수(IIFE)
				(function(markerChk,overlayTitle){
					//마커에 mouseover 이벤트를 등록하고 마우스 클릭 시 infoWindow 표시
					kakao.maps.event.addListener(marker,'click',function(){
						overlayTitle.setMap(map,markerChk);
					})
					//맵에 mouseout 이벤트를 등록하고 마우스 클릭 시 infoWindow 닫기
					kakao.maps.event.addListener(map,'click',function(){
						overlayTitle.setMap(null);
					})
				})
				(marker,overlay);
				*/
			}
		}
		
		getData();
		
		//console.log(getData().OrganicAnimalProtectionFacilit[1])
		//비동기 함수는 실행시간이 다르다.
		//await가 존재하는 getData()를 호출하고 바로 인덱스로 접근하려 하기 때문에
		//함수가 완료되기전 접근하려고 하면 데이터가 아직 도착하지 않았기 때문에 오류
		//-> 1. 함수의 응답이 끝나 데이터를 받아온 상태에서 접근
		//-> 2. then()를 사용하여 데이터에 접근
		
		//참고블로그
		//https://iftraveler.tistory.com/entry/5-%EC%B9%B4%EC%B9%B4%EC%98%A4-%EC%A7%80%EB%8F%84-API-%EC%BB%A4%EC%8A%A4%ED%85%80-%EC%A0%95%EB%B3%B4%EC%B0%BD-%ED%91%9C%EC%8B%9C%ED%95%98%EA%B8%B0
	</script>
</html>