<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>          
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"rel="stylesheet" />
<title>클래스 등록</title>
</head>
<body>
	<h3>클래스 등록 페이지</h3>
	<form:form modelAttribute="addLesson">
		<p> 코치 아이디 : <form:input path="coachId"/>
		<p> 클래스 아이디 : <form:input path="classId"/> <!-- path 는 DTO 객체의 변수 -->
		<p> 클래스 이름 : <form:input path="className"/>
		<p> 클래스 종류 : <form:input path="subject"/>
		<p> 개최 장소 : <form:input path="venue"/>
		<p> 담당자 이름 : <form:input path="managerName"/>
		<p> 연락처 : <form:input path="tel"/>
		<p> 청강 가능 인원 : <form:input path="auditors"/>
		<p> 수강료 : <form:input path="fees"/>
		<p> 클래스 설명 : <form:textarea path="description" cols="50" rows="2"/>
			<input type="submit" value="등록"/>
	</form:form>
</body>
</html>