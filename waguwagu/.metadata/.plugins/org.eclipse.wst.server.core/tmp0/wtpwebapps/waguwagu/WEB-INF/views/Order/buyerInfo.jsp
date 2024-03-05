<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"rel="stylesheet" />
<meta charset="utf-8">
<title>Customer</title>
</head>
<body>
<nav class="navbar navbar-expand navbar-dark bg-dark">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="./home">Home</a>
			</div>
		</div>
	</nav>
	<div class="jumbotron">
		<div class="container">				
			<h1 class="display-3">고객정보</h1>
		</div>
	</div>
	
	<div class="container">
	<form:form modelAttribute="order" class="form-horizontal">
		
		<legend>고객 세부 사항</legend>
		<div class="form-group row">
			<label class="col-sm-2 control-label">고객 ID</label>
			<div class="col-sm-3">
				<form:input path="customer.customerId" class="form-control"/>
			</div>		
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label">성명</label>
			<div class="col-sm-3">
				<form:input path="customer.address.recipientName" class="form-control"/>
			</div>		
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label">전화번호</label>
			<div class="col-sm-3">
				<form:input path="customer.phone" class="form-control"/>
			</div>		
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label">주소지 이름</label>
			<div class="col-sm-5">
				<form:input path="customer.address.addressName" class="form-control"/>
			</div>		
		</div>		
		<div class="form-group row">
			<label class="col-sm-2 control-label">주소</label>
			<div class="col-sm-3">
				<form:input path="customer.address.country" class="form-control"/>
			</div>		
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label">우편번호</label>
			<div class="col-sm-3">
				<form:input path="customer.address.zipCode" class="form-control"/>
			</div>		
		</div>
		<hr>
		<legend>배송 세부 사항</legend>
		<div class="form-group row">
			<label class="col-sm-2 control-label">성명</label>
			<div class="col-sm-3">
				<form:input path="shipping.address.recipientName" class="form-control"/>
			</div>		
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label">전화번호</label>
			<div class="col-sm-3">
				<form:input path="shipping.phone" class="form-control"/>
			</div>		
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label">주소</label>
			<div class="col-sm-3">
				<form:input path="shipping.address.country" class="form-control"/>
			</div>		
		</div>
			<div class="form-group row">
			<label class="col-sm-2 control-label">우편번호</label>
			<div class="col-sm-3">
				<form:input path="shipping.address.zipCode" class="form-control"/>
			</div>		
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label">주소명</label>
			<div class="col-sm-5">
				<form:input path="shipping.address.addressName" class="form-control"/>
			</div>		
		</div>		
		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" class="btn btn-primary" value="등록" />
				<button class="btn btn-default">취소</button>
			</div>		
		</div>
	</form:form>
	</div>
</body>
</html>