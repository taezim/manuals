<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>          
<%@ page import="java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"rel="stylesheet" />
<title>Reservation Form</title>
</head>
<body>
	<h3>병원 예약 페이지</h3>
<div class="container">
	<form:form modelAttribute="reservation">
		<h1>예약할 병원 정보</h1>
		<div class="col-md-4">
	     <c:choose>
	         <c:when test="${hospital.getHospitalImage() == null}">
	            <img src="<c:url value='/resources/images/${hospital.fileName}'/>" style="width: 50%"/>
	         	<form:input type="hidden" path="hospitalFileName" value="${hospital.fileName}"/>
	         </c:when>
	         <c:otherwise>
	            <img src="<c:url value='/resources/images/${hospital.fileName}'/>" style="width: 50%"/>
	         	<form:input type="hidden" path="hospitalFileName" value="${hospital.fileName}"/>
	         </c:otherwise>
	      </c:choose>
	   </div>

		<h3>병원 이름:<form:input path="hospitalName" value="${hospital.hospitalName}"/></h3>
		<p>병원 예약일 : <form:input type="text" path="reservationDate" id="datepicker" />
		
		<p>예약자 id: hidden <form:input path="reserverId" value="${id}"/>
		
		<h4>예약자 이름 :<form:input path="reserverName"/></h4>
		<p> 예약자 전화번호: <form:input path="reserverPhone"/>
		<p> 부상자 이름 : <form:input path="patientName"/>
		<p> 부상자 나이 : <form:input path="patientAge"/>
		<p> 부상자 전화번호: <form:input path="patientPhone"/>
		<p> 부상 부위 <form:input path="injuryType" placeholder="부상 부위를 입력하세요"/>
		<p> 비고란/ 요청사항: <form:textarea path="notes" cols="50" rows="2"/>
			<input type="submit" value="등록"/>
	</form:form>
</div>
 <script>
 $(function() {
	    $("#datepicker").datepicker({
	        dateFormat: 'yy-mm-dd'
	    });
	});
 </script>
</body>
</html>
