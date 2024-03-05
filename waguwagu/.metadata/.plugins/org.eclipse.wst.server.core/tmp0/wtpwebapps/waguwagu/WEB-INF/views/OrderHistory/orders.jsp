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
					<p> 주문번호 : ${order.orderId}</p>
					<p> 구매자 이름 : ${order.customer.address.recipientName}
					<p> 수령자 이름 : ${order.shipping.address.recipientName}
					<p> 주문 날짜 : ${order.date}
					<p><a href="<c:url value="/order/history/one?id=${order.orderId}"/>"class="btn btn-secondary" role="button">상세정보 &raquo;</a><!-- 코드 추가됨 -->
				</div>
			</c:forEach>
</div>
</div>
</body>
</html>