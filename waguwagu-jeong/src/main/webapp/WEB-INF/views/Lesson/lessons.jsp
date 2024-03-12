<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value='/resources/css/bootstrap.min.css'/>"rel="stylesheet" />
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<c:forEach items="${list}" var="ls">
		<div class="col-md-7">
			<p>클래스 이름 : ${ls.className}
			<p>클래스 종류: ${ls.subject}
				<p align="left">${fn:substring(ls.description, 0, 100)}...
			<a href="<c:url value='/lessons/${ls.classId}'/>" class="btn btn-success">클래스 상세보기</a>
		</div>
	</c:forEach>   
</div>  
</body>
</html>