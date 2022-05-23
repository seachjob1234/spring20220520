<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
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

<script>
	$(document).ready(function() {

		$("#button1").click(function() {

			$.ajax({
				url : "/spr2/ex03/sub03"
			});
		});

		$("#button2").click(function() {
			$.ajax({
				url : "/spr2/ex03/sub04"
			});
		});

		$("#button3").click(function() {
			$.ajax({
				url : "/spr2/ex03/sub05",
				type : "get"
			});
		});

		$("#button4").click(function() {
			$.ajax({
				url : "/spr2/ex03/sub06",
				type : "post"
			//method : "post" 이거도 가능하다.
			});
		});

		$("#button5").click(function() {
			$.ajax({
				url : "/spr2/ex03/sub07",
				type : "delete"

			});
		});

		$("#button6").click(function() {
			$.ajax({
				url : "/spr2/ex03/sub08",
				type : "put"

			});
		});
		$("#button7").click(function() {
			$.ajax({
				url : "/spr2/ex03/sub09",
				//	type : "get" 타입의 기본값은 get이므로 생략 가능
				data : {
					title : "epl",
					writer : "son"
				}
			});
		});
		$("#button8").click(function() {
			$.ajax({
				url : "/spr2/ex03/sub10",
				type : "post",
				data : {
					name : "son",
					address : "london"
				}
			});
		});
		$("#button9").click(function() {
			$.ajax({
				url : "/spr2/ex03/sub11",
				type : "post",
				data : {
					title : "득점왕되기",
					writer : "son"
				}
			});
		});
		$("#button10").click(function() {
			$.ajax({
				url : "/spr2/ex03/sub10",
				type : "post",
				data : "name=donald&address=newyork"
			});
		});
		$("#button11").click(function() {
			$.ajax({
				url : "/spr2/ex03/sub11",
				type : "post",
				data : "title=골든부츠&writer=son"

			});
		});
		$("#button12").click(function(e) {

			e.preventDefault();
			const dataString = $("#form1").serialize();

			$.ajax({
				url : "/spr2/ex03/sub10",
				type : "post",
				data : dataString

			});
		});
		$("#button13").click(function(e) {
			e.preventDefault();
			const data = $("#form2").serialize();

			$.ajax({
				url : "/spr2/ex03/sub11",
				type : "post",
				data : data
			});
		});
		$("#button14").click(function() {
			$.ajax({
				url : "/spr2/ex03/sub12",
				type : "post",
				success : function(data) {
					console.log("요청성공!@#@!#");
					console.log("받은 데이터", data);
				}
			});
		});
		$("#button15").click(function() {
			$.ajax({
				url : "/spr2/ex03/sub13",
				type : "get",
				success : function(data) {
					//console.log(data);
					$("#result1").text(data);
				}
			});
		});
		$("#button16").click(function() {
			$.ajax({
				url : "/spr2/ex03/sub14",
				type : "get",
				success : function(book) {
					//console.log(book);
					//console.log(book.title);
					//console.log(book.writer);
					$("#result2").text(book.title);
					$("#result3").text(book.writer);
				}
			});
		});
		$("#button17").click(function() {
			$.ajax({
				url : "/spr2/ex03/sub15",
				success : function(data) {
					console.log(data);
				}
			});
		});

	});
</script>
<title>Insert title here</title>
</head>
<body>

	<button id="button1">ajax 요청 보내기</button>
	<br />
	<button id="button2">ajax 요청 보내기2</button>
	<br />


	<button id="button3">get 방식 요청 보내기</button>
	<br />
	<button id="button4">post 방식 요청 보내기</button>
	<br />
	<button id="button5">delete 방식 요청 메소드</button>
	<br />
	<button id="button6">put 방식 요청 메소드</button>
	<br />
	<p>서버로 데이터 보내기</p>
	<button id="button7">get방식으로 데이터 보내기</button>
	<p>포스트 방식으로 데이터 보내기</p>
	<br />
	<button id="button8">post방식으로 데이터 보내기</button>

	<br />
	<button id="button9">post방식으로 데이터 보내기</button>
	<br />
	<button id="button10">post방식으로 데이터 보내기(encoded string)</button>
	<br />
	<button id="button11">post방식으로 데이터 보내기 인코딩 스트링</button>

	<hr />

	<p>폼 데이터 보내기</p>
	<form id="form1" action="/spr2/ex03/sub10" method="post">
		name :
		<input type="text" name="name" />
		<br />
		address :
		<input type="text" name="address" />
		<br />
		<input id="button12" type="submit" value="전송" />


	</form>
	<%--/spr2/ex03/sub11로 포스트 방식 ajax 요청 전송 --%>
	<p>폼 하나 더 만들어</p>
	<form id="form2">
		title :
		<input type="text" name="title" />
		<br />
		writer :
		<input type="text" name="writer" />
		<br />
		<input type="submit" value="전송" id="button13" />
	</form>
	<hr />
	<p>응답 처리하기</p>
	<%--요청경로는 /spr2/ex03/sub12 type:"post" --%>
	<button id="button14">응답하라</button>
	<hr />
	<button id="button15">로또번호다.</button>
	<p>
		받은 번호 :
		<span id="result1"></span>
	</p>
	<hr />
	<button id="button16">json 데이터 받기</button>
	<p>
		책 제목 :
		<span id="result2"></span>
	</p>
	<p>
		책 저자 :
		<span id="result3"></span>
	</p>

	<button id="button17">json 데이터 받기 2(hashmap)</button>

</body>
</html>