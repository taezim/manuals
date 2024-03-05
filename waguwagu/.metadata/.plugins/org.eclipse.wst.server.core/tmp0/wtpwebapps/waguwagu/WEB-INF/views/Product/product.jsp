<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" href="<c:url value='/resources/css/bootstrap.min.css'/>"rel='stylesheet' />
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/controllers.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>

</head>
<body>
<div class="container">
		<div class="row">
			<div class="col-md-4">
				<c:choose>
					<c:when test="${pd.getProductImage() == null}">
						<img src="<c:url value='/resources/images/${pd.fileName}'/>" style="width: 100%"/>
					</c:when>
					<c:otherwise>
						<img src="<c:url value='/resources/images/${pd.fileName}'/>" style="width: 100%"/>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="col-md-8">
				<h3>${pd.productName}</h3>
				<p>가격 : ${pd.unitPrice}원</p>
				<br>
				<p><b>상품코드</b> : <span class="badge badge-info">${pd.productId}</span>
				<p><b>상품 설명</b> : ${pd.description}
				<p><b>분류</b> : ${pd.category}
				<p><b>재고수</b> : ${pd.unitsInStock}
				<p><b>상태</b> : ${pd.condition}
				<p><b>누적 주문수</b> : ${pd.accumulatedOrders}
				<h4>평균 별점 : ${pd.rating}점</h4>
				<br>
				<form:form name="addForm" method="put">
					<p><a href="javascript:addToCart('../cart/add/${pd.productId}')" class="btn btn-primary">도서주문 &raquo;</a>
					<a href="<c:url value="/cart"/>"class="btn btn-warning">장바구니 &raquo;</a>
					<a href="<c:url value="/products"/>"class="btn btn-secondary">도서 목록 &raquo;</a>
					<a href='<c:url value="/products/update?id=${pd.productId}"/>' class="btn btn-success">수정&raquo;</a>
					<a href="<c:url value="javascript:deleteConfirm('${pd.productId}')"/>" class="btn btn-danger">삭제 &raquo;</a>
				</form:form>
				<form:form name="addWish" method="put">
					<p><a href="javascript:addToWish('../wish/add/${pd.productId}')" class="btn btn-outline-primary">관심 등록 &raquo;</a>
					<input type="hidden" name="category" value="product">
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>