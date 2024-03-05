<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>상품 등록</title>
</head>
<body>
	<h3>야구 상품 등록 페이지</h3>
	<form:form modelAttribute="addProduct" enctype="multipart/form-data">
		<p> 이미지 업로드: <form:input type="file" path="productImage"/>
		<p> 상품 아이디 : <form:input path="productId"/> <!-- path 는 DTO 객체의 변수 -->
		<p> 상품 이름 : <form:input path="productName"/>
		<p> 상품 재고 : <form:input path="unitPrice"/>
		<p> 상품 설명 : <form:textarea path="description" cols="50" rows="2"/>
		<p> 상품 분류 : <form:input path="category"/>
		<p> 상품 재고 : <form:input path="unitsInStock"/>
		<p> 상품 상태 : <form:input path="condition"/>
		<p> 누적 주문수 : <form:input path="accumulatedOrders"/>
		<p> 평균 별점 : <form:input path="rating"/>
			<input type="submit" value="등록"/>
	</form:form>
</body>
</html>