<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"rel="stylesheet" />
<title>병원 예약 목록</title>
</head>
<body>
<div class="container">
	<c:forEach items="${list}" var="list">
		<div class="col-md-4">
	     <c:choose>
	         <c:when test="${list.hospitalFileName == null}">
	            <img src="<c:url value='/resources/images/${list.hospitalFileName}'/>" style="width: 30%"/>
	         </c:when>
	         <c:otherwise>
	            <img src="<c:url value='/resources/images/${list.hospitalFileName}'/>" style="width: 30%"/>
	         </c:otherwise>
	      </c:choose>
	   </div>
		<div class="col-md-7">
			<p>예약번호 : ${list.reservationId}
			<p>병원 이름 : ${list.hospitalName}
			<p>병원 예약일 : ${list.reservationDate}
			<p>예약자명 : ${list.reserverName}
			<p>부상 부위 : ${list.injuryType }
			<a href="<c:url value='/hospital/${list.reservationId}'/>" class="btn btn-success">예약정보 상세보기</a>
		</div>
	</c:forEach>   
</div> 
</body>
</html>