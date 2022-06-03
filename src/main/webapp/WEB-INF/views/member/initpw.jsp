<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
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

<title>Insert title here</title>
</head>
<body>
	<my:navBar current="memberList"></my:navBar>

	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-lg-6">
				<h1>암호 초기화</h1>
				<form method="post">
					<label for="idInput1" class="form-label"> 초기화할 아이디 </label>
					
					<input id="idInput1" class="form-control" type="text" name="id" /><br />
					
					<div class="form-text mb-3">암호는 아이디로 초기화 됩니다.</div>
					
					<input class="btn btn-primary" type="submit" value="초기화" />
				</form>
			</div>
	   </div>
   </div>
		
</body>
</html>