<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />   
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
<form action="">
		<c:forEach items="${categoryList }" var="category">
			<input type="checkbox" class="form-check-input" name="category"
				value="${category.categoryId}" id="category${category.categoryId }" />

			<label class="form-check-label" for="category${categoryId }">
				${category.categoryName } 
			</label>

		</c:forEach>

		<br />

		<input type="submit" value="조회" />


	</form>

	<table class="table">
		<thead>
			<tr>
				<th>카테고리</th>
				<th>상품명</th>
				<th>단위</th>
				<th>가격</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="prod">
				<tr>
					<td>${prod.categoryName }</td>
					<td>${prod.productName }</td>
					<td>${prod.unit }</td>
					<td>${prod.price }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>