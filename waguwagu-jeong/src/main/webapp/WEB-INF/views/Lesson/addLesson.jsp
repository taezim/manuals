<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>          
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"rel="stylesheet" />
<title>Ŭ���� ���</title>
</head>
<body>
	<h3>Ŭ���� ��� ������</h3>
	<form:form modelAttribute="addLesson">
		<p> ��ġ ���̵� : <form:input path="coachId"/>
		<p> Ŭ���� ���̵� : <form:input path="classId"/> <!-- path �� DTO ��ü�� ���� -->
		<p> Ŭ���� �̸� : <form:input path="className"/>
		<p> Ŭ���� ���� : <form:input path="subject"/>
		<p> ���� ��� : <form:input path="venue"/>
		<p> ����� �̸� : <form:input path="managerName"/>
		<p> ����ó : <form:input path="tel"/>
		<p> û�� ���� �ο� : <form:input path="auditors"/>
		<p> ������ : <form:input path="fees"/>
		<p> Ŭ���� ���� : <form:textarea path="description" cols="50" rows="2"/>
			<input type="submit" value="���"/>
	</form:form>
</body>
</html>