<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css"
	integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	referrerpolicy="no-referrer"></script>
<meta charset="UTF-8">

<title>Insert title here</title>
<script>
	$(document).ready(function() {
		let idOk = false;
		let pwOk = false;
		let emailOk = false;
		let nickNameOk = false;

		$("#checkIdButton1").click(function(e) {
			e.preventDefault();
			$(this).attr("disabled", "");
			const data = {
				id : $("#form1").find("[name=id]").val()

			};
			idOk = false;
			$.ajax({
				url : "${appRoot}/member/check",
				type : "get",
				data : data,
				success : function(data) {
					switch (data) {
					case "ok":
						$("#idMessege1").text("사용 가능한 아이디입니다.");
						idOk = true;
						break;
					case "notOk":
						$("#idMessege1").text("사용 불가능한 아이디입니다.");
						break;
					}
				},
				error : function() {
					$("#idMessege1").text("중복 발생 중 문제 발생 다시 시도해 주세요");
				
				},
				complete : function() {
					$("#checkIdButton1").removeAttr("disabled");
					enableSubmit();
				}

			});
			
		});

		$("#checkIdButton2").click(function(e) {
			e.preventDefault();
			$("#checkIdButton2").attr("disabled", "");
			const data = {
				email : $("#form1").find("[name=email]").val()

			};
			emailOk = false;
			$.ajax({
				url : "${appRoot}/member/check",
				type : "get",
				data : data,
				success : function(data) {
					switch (data) {
					case "ok":
						
						$("#idMessege2").text("사용 가능한 이메일입니다.");
						emailOk = true;
						break;
					case "notOk":
						$("#idMessege2").text("사용 불가능한 이메일입니다.");
						break;
					}
				},
				error : function() {
					$("#idMessege2").text("중복 발생 중 문제 발생 다시 시도해 주세요");
				},
				complete : function() {
					$("#checkIdButton2").removeAttr("disabled");
					enableSubmit();
				}

			});
			

		});

		nickNameOk = false;
		$("#checkIdButton3").click(function(e) {
			e.preventDefault();
			$(this).attr("disabled", "");
			const data = {
				nickName : $("#form1").find("[name=nickName]").val()

			};
			nickNameOk = false;
			$.ajax({
				url : "${appRoot}/member/check",
				type : "get",
				data : data,
				success : function(data) {
					switch (data) {
					case "ok":
						
						$("#idMessege3").text("사용 가능한 닉네임입니다.");
						nickNameOk = true;
						break;
					case "notOk":
						$("#idMessege3").text("사용 불가능한 닉네임입니다.");
						break;
					}
				},
				error : function() {
					$("#idMessege3").text("중복 발생 중 문제 발생 다시 시도해 주세요");
				},
				complete : function() {
					$("#checkIdButton3").removeAttr("disabled");
					enableSubmit();
				}

			});

		});
		//패스워드 오타 확인
		$("#passwordInput1,#passwordInput2 ").keyup(function() {
			const pw1 = $("#passwordInput1").val();
			const pw2 = $("#passwordInput2").val();
			
			pwOk = false;
			if (pw1 == pw2) {
				$("#passwordMessege1").text("패스워드 일치함");
				pwOk = true;
			} else {
				$("#passwordMessege1").text("패스워드 일치하지않음");
			}
			enableSubmit();

		});
		// 회원가입 활성화 비활성화
		const enableSubmit = function() {
			if (idOk && pwOk && emailOk && nickNameOk) {
				$("#submitButton1").removeAttr("disabled");

			} else {
				$("#submitButton1").attr("disabled", "");
			}
		}

	});
</script>
</head>
<body>
	<my:navBar current="signup"></my:navBar>

	<form id="form1" action="${appRoot }/member/signup" method="post">
		아이디:
		<input type="text" name="id" />
		<button id="checkIdButton1" type="button">아이디 중복 확인</button>
		<p id="idMessege1"></p>
		<br />
		패스워드 :
		<input id="passwordInput1" type="password" name="password" />
		<br />
		패스워드 확인 :
		<input id="passwordInput2" type="text" name="passwordConfirm" />
		<p id="passwordMessege1"></p>
		이메일 :
		<input type="email" name="email" />
		<button id="checkIdButton2" type="button">이메일 중복 확인</button>
		<p id="idMessege2"></p>
		<br />
		닉네임:
		<input type="text" name="nickName" />
		<button id="checkIdButton3" type="button">닉네임 중복 확인</button>
		<p id="idMessege3"></p>
		<br />


		<button id="submitButton1" disabled>회원가입</button>
	
	</form>

</body>
</html>