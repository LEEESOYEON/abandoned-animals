<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입 페이지</title>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
		crossorigin="anonymous">
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- jQuery 인식 -->

	<style>
	.menu1 a,.menu2 a,.menu3 a{
		color : rgb(162, 197, 121);
	}
    .menu1 a:hover,.menu2 a:hover,.menu3 a:hover{
         color : rgb(194, 226, 157);
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
	

	</style>

</head>
<body>

	<%@ include file="./includes/header.jsp" %>
	
	<article>
		<section class="join">
			<div class="join-logo">
				<img src="<%=request.getContextPath()%>/resources/img/logo.png">
				<h5>야옹아 멍멍해봐</h5>
			</div>
			<div>
				<h5>야옹아 멍멍해봐에 가입하세요.</h5><br>

				<div class="join-box">
					<form action="join" method="post" onsubmit="return submi()">
						<div class="form-floating mb-3">
							<input type="email" class="form-control" id="mid" name="member_email"
								placeholder="name@example.com" required> 
								<label for="idInput">이메일</label>
							<div>
								<font id="id_font" size="2"> </font>
							</div>

						</div>

						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="nameInput"
								name="member_name" placeholder="name@example.com" required> 
								<label for="nameInput">성명</label>
							<div>
								<font id="name_font" size="2"> </font>
							</div>

						</div>
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="nicknameInput"
								name="member_nickname" placeholder="name@example.com" required>
							<label for="nicknameInput">닉네임</label>
							<div>
								<font id="nick_font" size="2"> </font>
							</div>

						</div>
						<div class="form-floating">
							<input type="password" class="form-control" id="floatingPassword"
								name="member_pw" placeholder="name@example.com" required> 
								<label for="floatingPassword">비밀번호</label>
								
							<div>
								<font id="pass_font" size="2"> </font>
							</div>

						</div>
						<div>
							<br>
							<h6>저희 서비스를 이용하는 사람이 회원님의 연락처 정보를 야옹아 멍멍해봐에 업로드 했을 수도 있습니다.</h6>

							<button type="submit" class="btn btn-primary" id="submitbtn">가입하기</button>

						</div>
					</form>
					<script type="text/javascript">
						var idchk;
						var nickchk;
						$('#mid').keyup(function() {
							let mid = $('#mid').val();
							let mname = $('#nameInput').val();
							let mpass = $('#floatingPassword').val();
							$.ajax({
								url : "idchk",
								type : "post",
								data : {
									memberId : mid
								},
								dataType : "json",
								success : function(result) {
									console.log(result)
									if (result == 1 || mid == '') {
										$("#id_font").html('아이디를 확인해주세요.');
										$("#id_font").attr('color', '#dc3545');
										idchk = 0;
									} else {
										$("#id_font").html('사용 가능한 아이디입니다.');
										$("#id_font").attr('color', '#2fb380');
										idchk = 1;

									}
									/*                                 				if(mname==""||mname==null){
									                                                    joinchk=0;                                					
									                                                }
									                                                if(mnickname==""||mnickname==null){
									                                                    joinchk=0;                                					
									                                                }
									                                                if(mpass==""||mpass==null){
									                                                    joinchk=0;                                					
									                                                }        */
								},
								error : function() {
									$("#id_font").html('서버요청실패');
								}
							})
						})
						$('#nicknameInput').keyup(
								function() {
									let mnickname = $('#nicknameInput').val();
									$.ajax({
										url : "nickchk",
										type : "post",
										data : {
											memberNick : mnickname
										},
										dataType : "json",
										success : function(result) {
											console.log(result)
											if (result >= 1) {
												$("#nick_font").html(
														'중복되는 닉네임이 있습니다.');
												$("#nick_font").attr('color',
														'#dc3545');
												nickchk = 0;

											} else {
												$("#nick_font").html(
														'사용 가능한 닉네임입니다.');
												$("#nick_font").attr('color',
														'#2fb380');
												nickchk = 1;

											}
											if (mnickname == '') {
												$("#nick_font").html(
														'닉네임을 제대로 입력해주세요.');
												$("#nick_font").attr('color',
														'#dc3545');
												nickchk = 0;

											}
										},
										error : function() {
											alert("에러")
										}

									})

								})

						function submi() {
							var mid = document.getElementById('mid').value;
							var mname = document.getElementById('nameInput').value;
							var mnickname = document
									.getElementById('nicknameInput').value;
							var mpass = document
									.getElementById('floatingPassword').value;

							if (mid.trim() === '' || mname.trim() === ''
									|| mnickname.trim() === ''
									|| mpass.trim() === '' || idchk === 0
									|| nickchk === 0) {
								alert("회원가입이 불가능합니다. 입력란을 확인해주세요.")
								return false;
							}
							alert("회원가입 완료")
							return true;
						}
					</script>




				</div>

			</div>


		</section>
	</article>
	
	<%@ include file="./includes/footer.jsp" %>

</body>
</html>