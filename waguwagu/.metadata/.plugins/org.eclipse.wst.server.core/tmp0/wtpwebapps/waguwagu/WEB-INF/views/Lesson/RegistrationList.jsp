<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"rel="stylesheet" />
<title>회원</title>
</head>
<body>
<div class="container">
	<c:forEach items="${list}" var="list">
		<div class="col-md-7">
			<p>수강 신청 번호 : ${list.registrationId}
			<p>클래스 이름 : ${list.lessonName}
			<p>코치 이름 : ${list.coachName}
			<p>결제 여부: ${list.paymentStatus}
			<p>수강 신청일: ${list.registDate}
			<a href="<c:url value='/lesson/${list.registrationId}'/>" class="btn btn-success">회원 상세보기</a>
		</div>
	</c:forEach>   
</div> 
</body>
</html>