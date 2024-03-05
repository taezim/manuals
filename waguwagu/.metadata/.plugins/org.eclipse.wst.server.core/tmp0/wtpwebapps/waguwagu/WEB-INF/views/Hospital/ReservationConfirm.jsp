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
	<form:form modelAttribute="reservation" action="./confirm">
		<h1>예약할 병원 정보</h1>
	   <form:input type="hidden" path="hospitalId" value="${hr.hospitalId}"/>
		<h3>병원 이름:<form:input path="hospitalName" value="${hr.hospitalName}"/></h3>
		<p>병원 예약일 : <form:input type="text" path="reservationDate" id="datepicker" />
		
		<p>예약자 id: hidden <form:input path="reserverId" value="${hr.reserverId}"/>
		
		<h4>예약자 이름 :<form:input path="reserverName" value="${hr.reserverName}"/></h4>
		<p> 예약자 전화번호: <form:input path="reserverPhone" value="${hr.reserverPhone}"/>
		<p> 부상자 이름 : <form:input path="patientName" value="${hr.patientName}"/>
		<p> 부상자 나이 : <form:input path="patientAge" value="${hr.patientAge}"/>
		<p> 부상자 전화번호: <form:input path="patientPhone" value="${hr.patientPhone}"/>
		<p> 부상 부위 <form:input path="injuryType" value="${hr.injuryType}"/>
		<p> 비고란/ 요청사항: <form:textarea path="notes" value="${hr.notes}" cols="50" rows="2"/>
			<input type="submit" value="등록"/>
	</form:form>
</div>
 <script>
 $(function() {
     $("#datepicker").datepicker({
         dateFormat: 'yy-mm-dd'  // yyyy-MM-dd 형식으로 표시
         // 기존의 코드도 필요하다면 여기에 추가하세요.
     });
 });
 </script>
</body>
</html>
