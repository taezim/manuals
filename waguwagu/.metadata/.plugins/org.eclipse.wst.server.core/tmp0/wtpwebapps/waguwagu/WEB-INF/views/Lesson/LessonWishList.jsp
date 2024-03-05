<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" href="<c:url value='/resources/css/bootstrap.min.css'/>"rel='stylesheet' />
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/controllers.js"></script>
<meta charset="EUC-KR">
<title>Lesson Wish List</title>
</head>
<body>
<div class="container">
	<h3>♡레슨 관심 목록♡</h3>
	<div class="row" align="center">
			<c:forEach items="${listOfWish}" var="wish">
				<div class="col-md-4">	
					<p>${wish.id}
					<p>${wish.category}
					<br>${wish.wishDate}원
				</div>
		</c:forEach>
	</div>
</div>
</body>
</html>