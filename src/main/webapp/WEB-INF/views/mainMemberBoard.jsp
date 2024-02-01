<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		    <!-- jQuery 인식 -->
 	<%@ include file="./includes/header.jsp" %>
        <style>
        	.menu2 a{
      		color : rgb(66, 123, 1);
	
			}
			.menu1 a,.menu3 a{
	      		color : rgb(162, 197, 121);
	     	}
	        .menu1 a:hover,.menu3 a:hover{
	             color : rgb(194, 226, 157);
	         }
        	#viewDate{
        		text-align : center;
        	}
        	.join-logo h5,.join-logo{
        		text-align : center;
        	}
        	#insert-btn{
        		text-align : center;
        	}
        	#myboard-btn a{
        		color : white;
        	}
        	article {
                position: relative;
                margin: auto;
                margin-bottom: 100px;
            }

            .join {
                text-align: center;
                padding-top: 30px;
                padding-bottom: 30px;
            }

            .join h5 {
                color : rgb(66, 123, 1);
            }

            .join-box {
                width: 400px;
                margin-left: 435px;
                text-align: left;
            }

            .join-box button {
                width: 400px;


            }
            #memberButton{
            	margin-right:270px;
            }
        	#titleSearch{
        		display : inline-block;
        		width : 250px;
        		margin-right : 20px;
        	}
        </style>
	
</head>

<body>
    <article>
        <section class="join">
            <div class="join-logo">
                <img src="<%=request.getContextPath()%>/resources/img/logo.png">
                <h5>야옹아 멍멍해봐</h5><br>
                <div>
                    <h5>회원전용 자유게시판 입니다.</h5>
                    <!-- 게시글 작성하기 modal -->
                    <div class="modal fade" id="writeModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                            
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="writeModalLabel">게시글</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <!-- 로그인된 정보 존재 시  -->
                                <form id="writeModalForm" method="post" encType="multipart/form-data">
                                <div class="modal-body">
                                        <div class="mb-3">
                                            <label for="writeTitle" class="col-form-label">제목</label>
                                            <input type="text" class="form-control" id="writeTitle" name="board_title" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="writeName" class="col-form-label">작성자</label>
                                            <!-- 로그인된 아이디로 value 넣기 -->
                                            <input type="text" class="form-control" id="writeName" name="board_member_nickname" value="${login.member_nickname}" readonly>
                                        </div>
                                        <div class="mb-3">
                                            <label for="writeComment" class="col-form-label">내용</label>
                                            <textarea rows="5" cols="50" class="form-control" id="writeComment" name="board_comment"></textarea>
                                            <label for="writeComment"></label> 
                                        </div>
                                          <div class="mb-3" id="fileDiv">
                                           <label for="message-text" class="col-form-label">첨부파일</label>
                                           <input type="file" class="form-control" name="file">
                                           </div> 
                                           <button  type="button" id="addFile" class="btn btn-warning">첨부파일 올리기</button>                          
                                </div>
                                <div class="modal-footer">
                                    <button type="reset" class="btn btn-secondary"
                                        data-bs-dismiss="modal">닫기</button>
                                    <button type="submit" class="btn btn-primary" onclick="insert()">완료</button>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- 상세보기 modal -->
                    <div class="modal fade" id="viewModal" tabindex="-1" aria-labelledby="viewModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                            
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="viewModalLabel">게시글</h1>
                                    <button type="reset" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                		<div class="mb-3">
                                            <label for="viewTitle" class="col-form-label">글번호</label>
                                            <input type="text" class="form-control" id="viewNo" name="board_no" disabled>
                                        </div>
                                        <div class="mb-3">
                                            <label for="viewTitle" class="col-form-label">제목</label>
                                            <input type="text" class="form-control" id="viewTitle" name="board_title" disabled>
                                        </div>
                                        <div class="mb-3">
                                            <label for="viewName" class="col-form-label">작성자</label>
                                            <!-- 로그인된 아이디로 value 넣기 -->
                                            <input type="text" class="form-control" id="viewName" name="board_member_nickname" disabled>
                                        </div>
                                        <div class="mb-3">
                                            <label for="viewComment" class="col-form-label">내용</label>
                                            <textarea rows="5" cols="50" class="form-control" id="viewComment" name="board_comment" disabled>
                                            </textarea>
                                        </div>
                                        <div class="mb-3">
                                            <label for="viewTitle" class="col-form-label">작성날짜</label>
                                            <input type="text" class="form-control" id="viewDate" name="board_date" disabled>
                                        </div>
                                       		<span>첨부파일</span>
	                                        	<div class="mb-3" id="viewFile">
	                                        	</div>                             
                                </div>
                                <div class="modal-footer">
                                	<div id="memberButton"></div>
                                    <button type="reset" class="btn btn-secondary"
                                        data-bs-dismiss="modal">닫기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div>
            	<input id="titleSearch" type="text" class="form-control rounded-pill" placeholder="게시물 제목 검색" aria-label="Recipient's username" aria-describedby="button-addon2">
                <button id="searchButton" class="btn btn-warning">검색</button>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col">제목</th>
                            <th scope="col">작성자</th>
                            <th scope="col">조회수</th>
                        </tr>
                    </thead>
                    <tbody class="table-group-divider" id="boardTable">
                    	 <c:if test="${empty memberBoard}">
                        	<td colspan=4 style="color : red; margin-top : 20px;">* 작성된 글이 없습니다. *</td>
                        </c:if>
                        <c:if test="${memberBoard != null}">
                        <c:forEach items="${memberBoard}" var="memberBoard">
                        <c:set var="num" value="${num+1}"/>
                        <tr>
                            <th scope="row">
                            	${num}                            	
                            </th>
                            <td>
                            	<a href="#" class="viewBoard" data-url="memberBoardView?viewNum=${memberBoard.board_no}">
                            	${memberBoard.board_title}
                            	</a>
                            </td>
                            <td>${memberBoard.board_member_nickname}</td>
                            <td id="${memberBoard.board_no}">${memberBoard.board_cnt}</td>
                        </tr>                        	
                        </c:forEach>
                        </c:if>
                <!--  page info -->
                     <tr>
                     	<td colspan=4 align=center>
                     		<c:if test="${pageVo.prev}">
                     		<a class="link" data-idx="${pageVo.startPage -1 }">[이전페이지]</a>
                     		</c:if>
                     		<c:forEach begin="${pageVo.startPage}" end="${pageVo.endPage}" var="idx">
                     			<a class="link" data-idx="${idx}">
                     				<c:if test="${idx==pageVo.page }">[</c:if>
                     					${idx}
                     				<c:if test="${idx==pageVo.page }">]</c:if>
                     			</a>
                     		</c:forEach>
                     		<c:if test="${pageVo.next}">
                     		<a class="link" data-idx="${pageVo.endPage +1 }">[다음페이지]</a>
                     		</c:if>
                     	</td>
                     </tr>
                    </tbody>
                    
                </table>
                <div id="searchNextButton"></div><br>
                <!-- 로그인된 정보가 존재할 경우만 글 작성가능 -->              
                <button type="button" id="insert-btn" class="btn btn-primary" data-bs-toggle="modal"
                     data-bs-whatever="@mdo">게시글 작성하기</button>
                    <!-- data-bs-target="#exampleModal" --> 
                <c:if test="${login != null}">
                <button type="button" id="myboard-btn" class="btn btn-primary"
                     data-bs-whatever="@mdo">
                     <a href="board?page=1&show=나만보기">
                   	내가 작성한 글 보기
                   	</a>
                </button>
               	</c:if>
            </div>
        </section>
    </article>
	<%@ include file="./includes/footer.jsp" %>
</body>
<script>
	
	//페이지 로드 후 실행되는 함수
	//href 새로 생성
	document.addEventListener('DOMContentLoaded', function() {

		var cookieValue = getCookie("pageTitle");

		var links = document.querySelectorAll('.link');
		links.forEach(function(link){
			link.addEventListener('click', function(event){
				var idx = link.getAttribute('data-idx');
				
				//쿠키에 저장된 값으로 새로운 href 생성
				var newHref = 'board?page='+idx+'&show='+cookieValue;
				
				link.href = newHref;
			})
		});
	});
	
	//쿠키값 가져오기
	//쿠키는 모든 값을 스트링 형태로 저장하고 ;으로 구분한다.
	//따라서 스트링 형태를 따로 파싱하여 풀어 주어야한다.
	function getCookie(name) {
	    var nameEQ = name + "=";
	    var cookies = document.cookie.split(';');

	    for (var i = 0; i < cookies.length; i++) {
	        var cookie = cookies[i].trim();
	        if (cookie.indexOf(nameEQ) === 0) {
	            return cookie.substring(nameEQ.length, cookie.length);
	        }
	    }
	    return null;
	}
	
	//첨부파일 추가하기 
	$("#addFile").on('click',function(){

		/*
		var fileLabel = document.createElement("label");
		fileLabel.setAttribute("for","message-text");
		fileLabel.setAttribute("class","col-form-label");
		fileLabel.textContent = "첨부파일";
		*/
		var fileInput = document.createElement("input");
		fileInput.setAttribute("type","file");
		fileInput.setAttribute("class","form-control");
		fileInput.setAttribute("name","file");
		
		var fileDiv = document.getElementById("fileDiv");
		//fileDiv.appendChild(fileLabel);
		fileDiv.appendChild(fileInput);
	});

	//글 작성하기 시 모달
	$("#insert-btn").on('click',function(){
		
	    $(this).attr("data-bs-target","#writeModal");
	    //클릭 이벤트가 발생한 후 요소가 변경 되는 것을 방지
	    //클릭이벤트가 처리됨과 동시에 this = 현재 element에 attr 적용
	    $('#writeModalForm').attr('action','memberBoard');
	    $('#writeModal').modal('show');
	    //console.log(form.getAttribute('action'));
	});	
	
	//게시물 상세보기 모달
	//$(document).ready() 는 초기 문서 로딩 시에만 실행되기 때문에 동적으로 추가된 요소에는 적용X
	$(document).on('click','.viewBoard',function(){
		
			var url = $(this).attr('data-url');
			
			//게시물 정보를 가지고 상세보기 modal 형성
			$.ajax({
				async : true,
				type : 'GET',
				url : url,
				dataType : 'json',
				success : function(memberBoardVo){
					console.log("success");
					
					//실시간 조회수 업로드
					$('#'+memberBoardVo.board_no).html(memberBoardVo.board_cnt);
					
					//게시물 정보
					$('#viewNo').val(memberBoardVo.board_no);
					$('#viewTitle').val(memberBoardVo.board_title);
					$('#viewName').val(memberBoardVo.board_member_nickname);
					$('#viewComment').val(memberBoardVo.board_comment);
					$('#viewDate').val(memberBoardVo.board_date);
					
					//게시물 첨부파일 태그 비우기
					//중복 방지
					$('#viewFile').empty();
											
					for(let i=0; i<memberBoardVo.board_file.length; i++){
						$('#viewFile').append('<img src="download?filename='+memberBoardVo.board_file[i]+'" style="width:350px; height:200px;">')
						//fileTag += '<img src="download?filename='+memberBoardVo.memberBoard_files[i]+'">';
					}
					
					//수정 + 삭제 버튼
					var sessionNickname = '${login.member_nickname}';
				    
				    $('.modal-footer #modifyButton , .modal-footer #deleteButton').remove();//버튼이 중복생성되지 않도록 삭제
				    
				    var nickname = $('#viewName').val();
					
					if(sessionNickname == nickname){ //현재 로그인 정보와 작성자 일치 시
						
						var modifyButton = document.createElement('button');
						modifyButton.textContent = '수정';
						modifyButton.setAttribute('id','modifyButton');
						modifyButton.setAttribute('class','btn btn-primary');
						modifyButton.style.marginRight = '10px';
						
						var deleteButton = document.createElement('button');
						deleteButton.textContent = '삭제';
						deleteButton.setAttribute('id','deleteButton');
						deleteButton.setAttribute('class','btn btn-danger');
						
						document.getElementById('memberButton').appendChild(modifyButton); //수정 버튼 추가
						document.getElementById('memberButton').appendChild(deleteButton); //삭제 버튼 추가
						
						//게시물 삭제하기
						//비동기방식으로 생성한 태그는 페이지 내의 DOM에서 인식하지 못하기 때문에 분리X
						document.getElementById('deleteButton').addEventListener('click', () => {
							var result = confirm("게시물을 삭제 하시겠습니까?");
							if(result){
								var boardNo = $('#viewNo').val();
								
								$.ajax({
									async : true,
									type : 'GET',
									url : 'deleteBoard',
									data : {
										boardNo : boardNo
									},
									success : function(data){										
										alert("삭제되었습니다.");
										window.location.href = '<%= request.getContextPath() %>/board';									
									},
									error : function(error){
										alert("delete error");
									}
								});
							}else{
								alert("게시물 삭제를 취소하였습니다.");
							}
						});
						
						//게시물 수정하기
						document.getElementById('modifyButton').addEventListener('click', () => {
							//기존에 상세보기 모달을 닫고 게시물 작성하기 용 모달 이용
							 var noInput = document.createElement('input');
							 noInput.setAttribute('id','writeNo');
							 noInput.setAttribute('type','hidden');
							 noInput.setAttribute('name','board_no');
							 //$noInput.val($('#viewNo').val());
							 noInput.setAttribute('value',$('#viewNo').val());
							 
							$('#viewModal').modal('hide'); //수정하기 모달 닫기
							$('#writeModalForm').attr('action','memberBoardUpdate'); //모달에 action 부여
							//모달 내용 생성
							$('#writeTitle').val($('#viewTitle').val());
							$('#writeComment').val($('#viewComment').val());
							//모달에 번호 부여
							$('#writeModalForm').append(noInput);
							
						    $('#writeModal').modal('show');
						    
						});
					}
					
					$('#viewModal').modal('show');

				},error : function(error){
					alert(error);
				}
		 })
	});
   
	
	//글 작성완료
	function insert(){
		alert('글 작성 완료');
	}
	
	//비회원이 글 작성하기 클릭 시 로그인 페이지 이동
	$('#insert-btn').on('click',function(){
		var session = '${login.member_nickname}';
		console.log(session);
		if(session != ""){
			$('#writeModal').modal('show');
		}else{
			window.location.href = '<%= request.getContextPath() %>/memberlogin';
		}
	});
	
	//제목 검색하기
	$(document).ready(function(){
		$("#searchButton").on('click',function(){
			
			var title = $("#titleSearch").val();
			
			//var encodedTitle = encodeURIComponent(title);
			fetch('<%=request.getContextPath()%>/titleBoard/' + title)
				.then(response => response.json())
				.then(data => {
					//console.log(data)
					var table = document.getElementById('boardTable');
					table.textContent= '';
					
					$("#searchNextButton").empty();
					
					if(data.length == 0){ // 검색결과가 없을 경우
						
						let tableRow = document.createElement('tr');
						
						let tableData = document.createElement('td');
						tableData.textContent = "* 검색결과가 없습니다. *";
						tableData.style.color = 'red';
						tableData.colSpan = 4;
						tableData.style.marginTop = '20px';
						
						tableRow.appendChild(tableData);
						table.appendChild(tableRow);
						
					}else{ // 검색결과가 있을 경우
						   // 검색결과 수 만큼 반복하여 태그 생성
						var startIndex = 0;
					    var endIndex = 5;
					
					    //검색결과 페이징 '더보기' 버튼
						var nextButton = $("<button>",{text:"더보기"});
						nextButton.attr('id','nextButton');
						nextButton.attr('class','btn btn-info')
						$('#searchNextButton').append(nextButton);
						nextButton.click(function(){

							var currentIndex = table.childElementCount;
							//console.log("현재 게시글 갯수"+currentIndex);
							startIndex = currentIndex;
							endIndex = startIndex+5;
							
							searchIndex(startIndex,endIndex,data);							
						});
						
					   searchIndex(startIndex,endIndex,data);
					}
				})
				.catch(error => {
					console.log("error : ", error)
				});
		});
	});
	
	//검색 결과 페이징 계산
	function searchIndex(startIndex,endIndex,data){
		if(endIndex >= data.length){
			//alert("마지막 검색결과 페이지 입니다.");
			$("#nextButton").hide();
		   searchTable(data.slice(startIndex,data.length));
	   }else{
		   searchTable(data.slice(startIndex,endIndex));
	   }
	}
	
	//검색결과 태그 형성
	function searchTable(data){
		for(let i=0; i<data.length; i++){
			let tableRow = document.createElement('tr');
			
			let tableHeader = document.createElement('th');
			tableHeader.textContent = data[i].board_no;
			
			let tableData = document.createElement('td');
			 
			let anchor = document.createElement('a');
			anchor.href = "#";
			anchor.setAttribute('class','viewBoard');
			anchor.setAttribute('data-url', 'memberBoardView?viewNum='+data[i].board_no);
			anchor.textContent = data[i].board_title;
			
			tableData.appendChild(anchor);
			
			let tableData2 = document.createElement('td');
			tableData2.textContent = data[i].board_member_nickname;
			
			let tableData3 = document.createElement('td');
			tableData3.textContent = data[i].board_cnt;
			tableData3.setAttribute('id',data[i].board_no);
			
			tableRow.appendChild(tableHeader);
			tableRow.appendChild(tableData);
			tableRow.appendChild(tableData2);
			tableRow.appendChild(tableData3);
			
			$("#boardTable").append(tableRow);			
		}
	}
	

</script>
</html>