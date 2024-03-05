<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�ֹ� �󼼺���</title>
</head>
<body>

<h3>�ֹ���ȣ : ${order.orderId}</h3>
<p> �ֹ� ��¥ : ${order.date}
<hr>
<p> ������ ���̵� : ${order.customer.customerId}
<p> ������ ��ȭ��ȣ : ${order.customer.phone}
<p> ������ �̸� : ${order.customer.address.recipientName}
<p> ������ �ּҸ� : ${order.customer.address.addressName}
<p> ������ �ּ� : ${order.customer.address.country}
<p> ������ �����ȣ : ${order.customer.address.zipCode}
<hr>
<p> ������ ��ȭ��ȣ : ${order.shipping.phone}
<p> ������ �̸� : ${order.shipping.address.recipientName}
<p> ������ �ּҸ� : ${order.shipping.address.addressName}
<p> ������ �ּ� : ${order.shipping.address.country}
<p> ������ �����ȣ : ${order.shipping.address.zipCode}

<hr>
<div>
	<h4>���� �ݾ�</h4>
	<p> �� �����ݾ� :${order.grandTotal}
</div>

<h4>�ֹ��� ��ǰ</h4>
<c:forEach items="${orderHistory}" var="oh"> 
	<div>
		<p> ��ǰ���̵�: ${oh.product.productId}
		<p> ��ǰ �̸� : ${oh.product.productName}
		<p> ���� : ${oh.product.unitPrice}
		<p> �з� : ${oh.product.category}
		<p> ��� : ${oh.product.unitsInStock}
		<p> ���� : ${oh.product.condition}
	</div>
</c:forEach>
		
</body>
</html>