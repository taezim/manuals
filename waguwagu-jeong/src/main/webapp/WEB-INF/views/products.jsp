<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value='/resources/css/bootstrap.min.css'/>"rel="stylesheet" />
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="container">
		<div class="row" align="center">
			<c:forEach items="${productList}" var="product">
				<div class="col-md-4">
					<c:choose>
						<c:when test="${product.getProductImage() == null}">
							<img src="<c:url value='/resources/images/${product.fileName}'/>" style="width:60%"/>
						</c:when>
						<c:otherwise>
							<img src="<c:url value='/resources/images/${product.fileName}'/>" style="width: 60%"/>
						</c:otherwise>
					</c:choose>
					<h3>${product.productId}</h3>
					<p>${product.productName}
						<br>${product.unitPrice}원
					<p align="left">${fn:substring(product.description, 0, 100)}...
					<p>${product.category}
					<p>${product.unitsInStock}
					<p><a href="<c:url value="/products/product?id=${product.productId}"/>"class="btn btn-secondary" role="button">상세정보 &raquo;</a><!-- 코드 추가됨 -->
				</div>
			</c:forEach>
</div>
</div>
</body>
</html>