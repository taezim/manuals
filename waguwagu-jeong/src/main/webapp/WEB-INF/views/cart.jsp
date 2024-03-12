<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value='/resources/css/bootstrap.min.css'/>"rel="stylesheet" />
<script src="<c:url value='/resources/js/controllers.js'/>"></script>
<meta charset="utf-8">
<title>Cart</title>
</head>
<body>
<div class="container">
		<form:form name="clearForm" method="delete">
			<a href="javascript:clearCart()" class="btn btn-danger pull-left">삭제하기</a>
		</form:form>
		<a href="<c:url value="/order?cartId=${cartId}"/>" class="btn btn-success float-right">주문하기</a> 
		<!-- 세션(=현재의 카트)아이디가 있으면 주문 가능하도록 : 이 코드 상으로는 항상 주문 가능함-->
	</div>
	<div style="padding-top : 50px">
		<table class="table table-hover">
			<tr>
				<th>도서</th>
				<th>가격</th>
				<th>수량</th>
				<th>소계</th>
				<th>비고</th>
			</tr>
			<form:form name="removeForm" method="put">
				<c:forEach items="${cart.cartItems}" var="item">
					<tr>
						<td>${item.product.productId}-${item.product.productName}</td>
						<td>${item.product.unitPrice}</td>
						<td>${item.quantity}</td>
						<td>${item.totalPrice}</td>
						<td><a href="javascript:removeFromCart('../cart/remove/${item.product.productId}')" class="btn btn-danger">삭제</a></td>
					
					</tr>
				</c:forEach>
			</form:form>
			<tr>
				<th></th>
				<th></th>
				<th>총액</th>
				<th>${cart.grandTotal}</th>
				<th></th>
			</tr>
		</table>
		<a href="<c:url value='/products'/>" class="btn btn-secondary">&laquo; 쇼핑 계속하기</a>
	</div>
</div>	
</body>
</html>