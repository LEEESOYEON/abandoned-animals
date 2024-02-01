<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
	<title>Home</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- jQuery 인식 -->
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<button>
	<a href="boardListView">상품문의</a>
</button><br>
<button type="button" data-bs-toggle="modal" data-bs-target="#exModal">
	로그인
</button>
<button id="demoButton">demo</button><br>
<div id="demoText"></div>
<div>
<!-- 
	<c:forEach var="index" begin="1" end="10" step="1">
		<a href=
	</c:forEach>
 -->
</div>
</body>
</html>
<script>
	/*
	동물사진 API만 가져온 경우
	$(document).ready(function(){
		//$('#demoButton').click(function(){
			$.ajax({
				async : true,
				type : 'GET',
				//data : JSON.stringify(),
				url : 'demo',
				//dataType : 'json',
				contentType : "application/json; charset=UTF-8",
				success : function(data){
					
					$.ajax({
						
					})
					
					console.log("success");
					console.log(data);
					console.log(typeof(data));

					var parsedData = JSON.parse(data);
					console.log(parsedData);
					console.log(parsedData.length);
					
					var a=parsedData['TbAdpWaitAnimalPhotoView'];
					console.log(a);
					for(key in a){
						console.log(key);
					}
					
					var arrList = [];
					
					var process = "<table>"; 
					
					//parsedData의 TbAdpWaitAnimalPhotoView의 row
					var rows = parsedData.TbAdpWaitAnimalPhotoView.row;
					// 'row' 배열의 각 객체 정보 확인하기
					for (var i = 0; i < rows.length; i++) {
						
					    var animalNo = rows[i].ANIMAL_NO;
					    var photoKind = rows[i].PHOTO_KND;
					    var photoNo = rows[i].PHOTO_NO;
					    var photoUrl = rows[i].PHOTO_URL;
					    
					    var arr = [animalNo,photoKind,photoNo,photoUrl];
					    arrList.push(arr);
					    
					    console.log("동물번호:", animalNo);
					    console.log("사진 종류:", photoKind);
					    console.log("사진 번호:", photoNo);
					    console.log("사진 주소:", photoUrl);		
						
					}
					
					for(var i=0; i<arrList.length; i++){
						process += "<tr>";
						for(var j=0; j<arrList[i].length; j++){
							if(j == arrList[i].length-1){
								//var lastList = (arrList[i].length-1);
								process += "<td><img src = https://"+arrList[i][j]+" style='width:150px; height:100px'></td>"
								console.log(arrList[i][j]);
							}else{
								process += "<td>"+arrList[i][j]+"</td>";	
							}
						}
						process +="</tr>";
					}
					
					process += "</table>";
					
					$('#demoText').html(process);

				},

				error : function(error){
					alert("error");
				}
			})
		//})
	})
	*/

	/*
	동물사진+정보 API
	$(document).ready(function(){
		//$('#demoButton').click(function(){
			$.ajax({
				async : true,
				type : 'GET',
				//data : JSON.stringify(),
				url : 'demo',
				//dataType : 'json',
				contentType : "application/json; charset=UTF-8",
                //유기동물 사진 API
				success : function(data){
                    console.log("success");

                    var parsedData = JSON.parse(data);
                    
					$.ajax({
						async : true,
                        type : 'GET',
                        url : 'demo2',
                        contentType : "application/json; charset=UTF-8",
                        //유기동물 정보 API
                        success : function(data2){
                            console.log("success2");

                            var parsedData2 = JSON.parse(data2);
                            var arrList = [];
                            
                            var imageArr = [];
                            
                            var process = "<table>"; 

                            //유기동물 사진 API
                            //parsedData의 TbAdpWaitAnimalPhotoView의 row
                            var rows = parsedData.TbAdpWaitAnimalPhotoView.row;

                            //유기동물 정보 API
                            var rows2 = parsedData2.TbAdpWaitAnimalView.row;

                            // 'row' 배열의 각 객체 정보 확인하기
                            for (var i = 0; i < rows.length; i++) {
                                
                                var animalNo = rows[i].ANIMAL_NO;
                                //var photoKind = rows[i].PHOTO_KND;
                                //var photoNo = rows[i].PHOTO_NO;
                                var photoUrl = rows[i].PHOTO_URL;

                                for(var j = 0; j < rows2.length; j++){
                                    var animalNo2 = rows2[j].ANIMAL_NO;
                                    //사진API와 정보 API의 동물번호를 기준으로 매칭하기
                                    if(animalNo == animalNo2){
                                        var name = rows2[j].NM;
                                        var date = rows2[j].ENTRNC_DATE;
                                        var spcs = rows2[j].SPCS;
                                        var intro = rows2[j].INTRCN_CN;
                                        var intro_com = rows2[j].TMPR_PRTC_CN;
                                    
                                        var arr = [animalNo,name,date,intro,intro_com,photoUrl];
                                        arrList.push(arr);

		                                console.log("동물번호:", animalNo);
                                        console.log("동물번호2 : ",animalNo2);
                                        break;
                                    }

                                }
                                
                                
                                //console.log("사진 종류:", photoKind);
                                //console.log("사진 번호:", photoNo);
                                //console.log("사진 주소:", photoUrl);		
                                
                            }
                            
                            for(var i=0; i<arrList.length; i++){
                                process += "<tr>";
                                for(var j=0; j<arrList[i].length; j++){
                                	//마지막인덱스에 사진 저장
                                    if(j == arrList[i].length-1){
                                        //var lastList = (arrList[i].length-1);
                                        process += "<td><img src = https://"+arrList[i][j]+" style='width:150px; height:100px'></td>"
                                        //console.log(arrList[i][j]);
                                    }else{
                                        process += "<td>"+arrList[i][j]+"</td>";	
                                    }
                                }
                                process +="</tr>";
                            }
                            
                            process += "</table>";
                            
                            $('#demoText').html(process);
                        },
                        error : function(error){
                            alert("error");
                        }
					})					

				},

				error : function(error){
					alert("error");
				}
			})
		//})
	})
	*/
	
	 $(document).ready(function(){
			//$('#demoButton').click(function(){
				$.ajax({
					async : true,
					type : 'GET',
					url : 'animalPhotoAPI',
					//dataType : 'json',
					contentType : "application/json; charset=UTF-8",
	                //첫번째 사진 API
					success : function(data){
	                    console.log("success");	                   

	                    var parsedData = JSON.parse(data);
	                    
						$.ajax({
							async : true,
	                        type : 'GET',
	                        url : 'animalInfoAPI',
	                        contentType : "application/json; charset=UTF-8",
	                        //두번째 정보 API
	                        success : function(data2){
	                            console.log("success2");

	                            var parsedData2 = JSON.parse(data2);
	                            var arrList = [];
	                                                        
	                            var process; 

	                            //첫번째
	                            //parsedData의 TbAdpWaitAnimalPhotoView의 row
	                            var rows = parsedData.TbAdpWaitAnimalPhotoView.row;

	                            //두번째
	                            var rows2 = parsedData2.TbAdpWaitAnimalView.row;
	                            console.log(typeof(rows2));

	                            // 'row' 배열의 각 객체 정보 확인하기
	                            for(var i=0; i<rows2.length; i++){
	                                var animalNo2 = rows2[i].ANIMAL_NO;
		                            let imageArr = [];
	                                for(var j=0; j<rows.length-1; j++){
	                                    var animalNo = rows[j].ANIMAL_NO;
	                                    if(animalNo2 == animalNo){
	                                        imageArr.push(rows[j].PHOTO_URL);
	                                        if(animalNo2 != rows[j+1].ANIMAL_NO){ //다음번호랑 같지 않을 경우
	                                            var name = rows2[i].NM;
	                                            var date = rows2[i].ENTRNC_DATE;
	                                            var spcs = rows2[i].SPCS;
	                                            var intro = rows2[i].INTRCN_CN;
	                                            var intro_com = rows2[i].TMPR_PRTC_CN;

	                                            var arr = [animalNo,name,date,intro,intro_com,imageArr];
	                                            arrList.push(arr);
	                                        }
	                                    }
	                                }
	                            }
	                            
	                            for(var i=0; i<arrList.length; i++){
	                            	var name = arrList[i][1];
	                        
	                                process += "<form action='viewDemo' method='post'>";
	                                /*
	                                for(var j=0; j<arrList[i].length; j++){
	                                    //마지막인덱스에 사진 저장
	                                    if(j == arrList[i].length-1){
	                                    	for(var k=0; k<arrList[i][j].length; k++){
	                                        	process += "<span><img src = https://"+arrList[i][j][k]+" style='width:150px; height:100px' name="image"></span>"                                    	
	                                    	}
	                                    }else if(j == 0){
	                                    	process += "<p><button type="submit" name="num">"+arrList[i][j]+"</button></p>";
	                                    }else{
	                                        process += "<p>"+arrList[i][j]+"</p>";	
	                                    }
	                                    
	                                }
	                                */
	                                process +=
	                                	"<button type='submit' onclick=storage('"+name+"')>"+(i+1)+"</button>"
	                                	+
	                                	"<p><input name='num' value='"+arrList[i][0]+"'></p>"
	                                	+
	                                	"<input value='"+arrList[i][1]+"' disabled>"
	                                	+
	                                	"<input type='hidden' name='name' value='"+arrList[i][1]+"'>"
	                                	+
	                                	"<input name='date' value='"+arrList[i][2]+"'>"
	                                	+
	                                	"<input type='hidden' name='intro' value='"+arrList[i][3]+"'>"
	                                	+
	                                	"<input type='hidden' name='intro_comment' value='"+arrList[i][4]+"'>"
	                                	+
	                                	"<span><img src = https://"+arrList[i][5][0]+" style='width:150px; height:100px' name='image'></span>";
	                                	for(var j=0; j<arrList[i][5].length; j++){
	                                        process += "<input type='hidden' name='image["+[j]+"]' value='https://"+arrList[i][5][j]+"'>"
	                                    }
	                                process +="</form>";
	                            }
	                            
	                            $('#demoText').html(process);
	                        },
	                        error : function(error){
	                            alert("error");
	                        }
						})				

					},

					error : function(error){
						alert("error");
					}
				})
			//})
		})
		
		function storage(test){
			console.log("function 진ㅇ입")
		 	localStorage.setItem("testName",test)
		 	console.log(test)
		 	console.log("서브 : "+localStorage.getItem("testName"));
		}
		
</script>
