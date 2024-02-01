<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제목검색 테스트중</title>
 	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		    <!-- jQuery 인식 -->
	<style>
		#memberButton{
           	margin-right:270px;
        }
       	#titleSearch{
       		display : inline-block;
       		width : 250px;
       	}
	</style>
</head>
<body>
 	 <input id="titleSearch" type="text" class="form-control rounded-pill" placeholder="게시물 제목 검색" aria-label="Recipient's username" aria-describedby="button-addon2">
     <button id="searchButton" class="btn btn-warning">검색</button>
</body>
<script>
/*
 *  JSP 파일에서 "titleSearch"와 "searchButton"이라는 요소들을 참조하는데, 해당 요소들이 실제로는 HTML에서 존재하지 않고 JSP에서 생성되는 요소들이라면, 해당 요소들을 참조하는 스크립트는 DOM이 로드된 이후에 실행되어야 합니다.
 *  JSP 파일에서 JavaScript를 작성하는 경우, DOM이 로드된 이후에 실행되도록 $(document).ready() 함수를 사용하거나, defer 속성을 이용하여 스크립트를 지연시키는 것이 좋습니다.
 */
	//제목 검색하기
	$(document).ready(function(){
		$("#searchButton").on('click',function(){
			console.log("제목 검색하기 클릭");
			var title = $("#titleSearch").val();
			console.log("검색 : "+title);
			var encodedTitle = encodeURIComponent(title);
			fetch('<%=request.getContextPath()%>/titleBoard/' + encodedTitle)
				.then(response => response.json())
				.then(data => {
					console.log(data)
					var tableBody = document.querySelector('table-group-divider');
					tableBody.empty();
					if(data == null){ // 검색결과가 없을 경우
						var paragraph = document.createElement('p');
						paragraph.textContent = "검색결과가 없습니다.";
						tableBody.appendChild(paragraph);
					}else{ // 검색결과가 있을 경우
						for(let i=0; i<data.length; i++){
							
						}
					}
				})
				.catch(error => {
					console.log("error : ", error)
				});
		});
	});
	
</script>
</html>