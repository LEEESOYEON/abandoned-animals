<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="true" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<head>
	<title>mypage</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	<%@ include file="./includes/header.jsp" %>
	<style>
		.menu1 a,.menu2 a,.menu3 a{
      		color : rgb(162, 197, 121);
     	}
		section{
		 	text-align: center;
		}
		#me{
			position : relative;
		}
		#meimg{
			/*position : relative;*/
			width : 230px;
			height :230px;
			/*background : orange;*/
			margin :auto;
			border: solid 1px #ccc;
			padding-top: 15px;
		}
		#mod{
			width :70px;
			height:30px;
			/*text-align : center;*/
		}
		#addimg_btn{
			position : absolute;
			margin-top: -230px;
			margin-left: 110px;
		}
		
		#submit_btn{
			position : absolute;
			margin-top: -26px;
			margin-left: 115px;
			border: solid 1px #ccc;
		}
		#accordionExample{
			width : 800px;
			margin : auto;	
		}
		.userinfo{
			position : relative;
			text-align: center;
		}
		
		#animalImg{
			width : 300px;
			height : 250px;
			margin : 10px 0px 10px 0px;	/* 상 우 하 좌 */	
		}
		#adoptSpan , #likeSpan{
			margin : 5px 0px 5px 0px;
			width : 230px;
			height : 30px;
			text-align : center;
			font-size : 17px;
		}
		#likeSpan{
			width : 740px;
			height : 40px;
			margin : 0px 0px 10px 0px;
			padding : 10px 0px 10px 0px;
		}
		#memberNick{
			color : rgd(235, 182, 2);
			font-size : larger;
		}
	</style>
</head>
<body>

<article>
<section id="me">
	<c:if test="${login.member_img != null}">
		<div id="meimg">
		<img src = "download?filename=${login.member_img }" style ="width :200px; height : 200px;">
		</div>
	</c:if>
	<c:if test="${login.member_img == null}">
		<div id="meimg">
		<img src = "<%=request.getContextPath()%>/resources/img/logo.png" style ="width :200px; height : 200px;">
		</div>
	</c:if>
	<form id="addimg" action="addFile" method="post" encType ="multipart/form-data">
		<input type="file" id ="inputFile" name="file" style ="display:none"/>
		<button id="submit_btn" type="submit">제출</button>
	</form>
	<div>
		<label id="addimg_btn" for="inputFile">
		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-file-plus" viewBox="0 0 16 16">
		  <path d="M8.5 6a.5.5 0 0 0-1 0v1.5H6a.5.5 0 0 0 0 1h1.5V10a.5.5 0 0 0 1 0V8.5H10a.5.5 0 0 0 0-1H8.5V6z"/>
		  <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2zm10-1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1z"/>
		</svg>
		</label>
	</div>
</section>
<div class="userinfo">
	<h5>${login.member_name }</h5>
	<h5>${login.member_email }</h5>
</div>
<section id="adopt">
	<span id="adoptSpan" class="badge rounded-pill text-bg-info">입양 신청한 아이</span><br>
	
	<c:if test="${avo !=null }">
		<!--<div><img src = "<%=request.getContextPath()%>/resources/img/logo.png" alt width ="100px" height = "100px"></div>-->
		<img id="animalImg" src=https://${avo.animal_img}>
		<h5>${avo.animal_name }</h5>
		<h5>${avo.animal_age }</h5>
		<h5>${avo.animal_breed }</h5>
	</c:if>
	
	<c:if test ="${avo ==null }">
		<h5>아직 입양을 안하셨네요~!</h5>
	</c:if>
</section>
<section id="likeList">
	<span class="badge rounded-pill text-bg-info" id="likeSpan">관심아이들</span>
	<div class="accordion" id="accordionExample">
		<c:forEach items = "${likelist }" var = "likevo"  varStatus = "status">
			<c:if test="${status.count == 1}">
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse1" aria-expanded="true" aria-controls="collapse1">
			       ${status.count} 번째 아이
			      </button>
			    </h2>
			    
			  	<div id="collapse1" class="accordion-collapse collapse show" data-bs-parent="#accordionExample" >
			     
			      <div class="accordion-body">
			        <strong> 
			                   이름 : ${likevo.animal_name }<br>
			       	     나이 : ${likevo.animal_age } <br> 
			                   성별 : ${likevo.animal_sex } <br>
			                   품종 : ${likevo.animal_breed } <br>
			         <br>          
			        <img src= https://${likevo.photo_url}>
			        <br>
			        <br>
			        <button type="button" class="btn btn-danger" id="deleteButton" onclick=deleteLike(${likevo.like_no})>취소하기</button>
			        </strong> 
			      </div>
			    </div>
			  </div>
			</c:if>
		
		<c:if test="${status.count != 1}">
		  <div class="accordion-item">
		    <h2 class="accordion-header">
		     <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${status.count}" aria-expanded="false" aria-controls="collapse${status.count}">
		       ${status.count} 번째 아이
		      </button>
		    </h2>
		     <div id="collapse${status.count}" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		        <strong> 
		                   이름 : ${likevo.animal_name }<br>
		                   나이 : ${likevo.animal_age } <br> 
		                   성별 : ${likevo.animal_sex } <br>
		                   품종 : ${likevo.animal_breed } <br>
		         <br>          
		        <img src= https://${likevo.photo_url}>
		        <br>
		        <br>
		        <button type="button" class="btn btn-danger" id="deleteButton" onclick=deleteLike(${likevo.like_no})>취소하기</button>
		        </strong> 
		      </div>
		    </div>
		  </div>
		</c:if>
		
		</c:forEach>
	</div>
</section>
</article>

<%@ include file="./includes/footer.jsp" %>
</body>
<script>
	
	function deleteLike(likeNo){
		console.log("삭제 번호 : "+likeNo);
		fetch('<%=request.getContextPath()%>/like/delete/'+likeNo,{
			method : 'DELETE'
		})
		.then(response => {
			alert("관심등록이 취소 되었습니다.")
			window.location.href = '<%=request.getContextPath()%>/mypage';
		})
		.catch(error => {
			console.log("에러 : "+error)
		});
	};

</script>
</html>