<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>주문 상세보기</title>
</head>
<body>

<h3>주문번호 : ${order.orderId}</h3>
<p> 주문 날짜 : ${order.date}
<hr>
<p> 구매자 아이디 : ${order.customer.customerId}
<p> 구매자 전화번호 : ${order.customer.phone}
<p> 구매자 이름 : ${order.customer.address.recipientName}
<p> 구매자 주소명 : ${order.customer.address.addressName}
<p> 구매자 주소 : ${order.customer.address.country}
<p> 구매자 우편번호 : ${order.customer.address.zipCode}
<hr>
<p> 수령자 전화번호 : ${order.shipping.phone}
<p> 수령자 이름 : ${order.shipping.address.recipientName}
<p> 수령자 주소명 : ${order.shipping.address.addressName}
<p> 수령자 주소 : ${order.shipping.address.country}
<p> 수령자 우편번호 : ${order.shipping.address.zipCode}

<hr>
<div>
	<h4>결제 금액</h4>
	<p> 총 결제금액 :${order.grandTotal}
</div>

<h4>주문한 상품</h4>
<c:forEach items="${orderHistory}" var="oh"> 
	<div>
		<p> 상품아이디: ${oh.product.productId}
		<p> 상품 이름 : ${oh.product.productName}
		<p> 가격 : ${oh.product.unitPrice}
		<p> 분류 : ${oh.product.category}
		<p> 재고 : ${oh.product.unitsInStock}
		<p> 상태 : ${oh.product.condition}
	</div>
</c:forEach>
		
</body>
</html>