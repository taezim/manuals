<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<h3>야구 상품 등록 페이지</h3>
	<div class="col-md-4">
		<img src="<c:url value='/resources/images/${pd.fileName}'/>" alt="image" style="width: 100%"/>
	</div>
	<form:form modelAttribute="updateProduct" action="./update?id=${pd.productId}" class="form-horizontal" enctype="multipart/form-data">
		<p> 상품 아이디 : <form:input path="productId" value="${pd.productId}"/> <!-- path 는 DTO 객체의 변수 -->
		<p> 상품 이름 : <form:input path="productName" value="${pd.productName}"/>
		<p> 상품 재고 : <form:input path="unitPrice" value="${pd.unitPrice}"/>
		<p> 상품 설명 : <form:textarea path="description" cols="50" rows="2" value="${pd.description}"/>
		<p> 상품 분류 : <form:input path="category" value="${pd.category}"/>
		<p> 상품 재고 : <form:input path="unitsInStock" value="${pd.unitsInStock}"/>
		<p> 상품 상태 : <form:input path="condition" value="${pd.condition}"/>
		<p> 누적 주문수 : <form:input path="accumulatedOrders" value="${pd.accumulatedOrders}"/>
		<p> 평균 별점 : <form:input path="rating" value="${pd.rating}"/>
		<div class="col-sm-10">
			이미지<form:input path="productImage" type="file" class="form-control"/>
		</div>
		<div class="form-group row">
			<input type="submit" class="btn btn-primary" value="수정"/>
			<a href="<c:url value="/products"/>" class="btn btn-primary">취소</a>
		</div>
	</form:form>
</div>
</body>
</html>