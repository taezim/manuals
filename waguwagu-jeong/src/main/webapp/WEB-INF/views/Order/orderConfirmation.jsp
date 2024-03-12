<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"rel="stylesheet" />
<meta charset="utf-8">
<title>Order</title>
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
		<h1 class="display-3">주문정보</h1>
	</div>
</div>
<div class="container">
	<form:form modelAttribute="order" action="./order/complete" class="form-horizontal" >
		<div class="well col-md-9 col-md-offset-2" style="background:#fafafe; padding:20px">
			<div class="text-center">
				<h1>영수증</h1>
			</div>
			<div class="row">
			<div class="col-md-6">
				<address> 받는 사람
					<strong>배송 주소</strong>
					성명 : ${order.shipping.address.recipientName}<br>
					우편번호 : ${order.shipping.address.zipCode}<br>
					주소 : ${order.shipping.address.addressName}  (${order.shipping.address.country})<br>
				</address>
			</div>
			</div>
			<div class="row">
				<div class="col-md-9">
					<address> 보내는 사람
						<strong>청구주소</strong>
						성명 : ${order.customer.name}<br>
						우편번호 : ${order.customer.address.zipCode}<br>
						배송지명 : ${order.customer.address.addressName} 
						목적지 : (${order.shipping.address.country})<br>
						HP : ${order.customer.phone}<br>
					</address>
				</div>
			</div>
			<div class="row">
		<table class="table table-hover">
					<thead>
					<tr><th>도서</th>
					<th>#</th>
					<th class="text-center">가격</th>
					<th class="text-center">소계</th>
					</tr>
					</thead>
					<tbody>
						<c:forEach var="cartItem" items="${cartItems}">
							<tr>
							<td><em>${cartItem.value.product.productName}</em></td>
							<td style="text-align: center">${cartItem.value.quantity}</td>
							<td class="text-center">${cartItem.value.product.unitPrice}원</td>
							<td class="text-center">${cartItem.value.totalPrice}원</td>
							</tr>
						</c:forEach>
						<tr>
						<td> </td>
						<td> </td>
						<td class="text-right"><h5><strong>총액:</strong></h5></td>
						<td class="text-center text-danger"><h4><strong>${cart.grandTotal}</strong></h4></td>
						</tr>					
					</tbody>
				</table>
		
				<button class="btn btn-default" >이전</button>
				<button type="submit" class="btn btn-success">주문완료</button>
				<button class="btn btn-default">취소</button>
			</div>
		</div>
	</form:form>
</div>
</body>
</html>