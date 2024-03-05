<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value='/resources/css/bootstrap.min.css'/>"rel="stylesheet" />
<meta charset="EUC-KR">
<title>Order History List</title>
</head>
<body>
<div class="container">
		<div class="row">
			<c:forEach items="${orderList}" var="order">
				<div class="col-md-9">
					<p> �ֹ���ȣ : ${order.orderId}</p>
					<p> ������ �̸� : ${order.customer.address.recipientName}
					<p> ������ �̸� : ${order.shipping.address.recipientName}
					<p> �ֹ� ��¥ : ${order.date}
					<p><a href="<c:url value="/order/history/one?id=${order.orderId}"/>"class="btn btn-secondary" role="button">������ &raquo;</a><!-- �ڵ� �߰��� -->
				</div>
			</c:forEach>
</div>
</div>
</body>
</html>