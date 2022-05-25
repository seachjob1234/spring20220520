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

	<table class="table">
		<thead>
			<tr>
				<th>ID</th>
				<th>PW</th>
				<th>EMALL</th>
				<th>NICKNAME</th>
				<th>DATE</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${memberList}" var="member">
				<tr>
					<td>
						<c:url value="/member/get" var="getMemberUrl">
							<c:param name="id" value="${member.id}"></c:param>
						</c:url>
						<a href="${getMemberUrl }"> ${member.id } </a>
					</td>
					<td>${member.password }</td>
					<td>${member.email }</td>
					<td>${member.nickName }</td>
					<td>${member.inserted }</td>
				</tr>

			</c:forEach>

		</tbody>
	</table>
</body>
</html>