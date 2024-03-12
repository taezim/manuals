<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>코치 등록</title>
</head>
<body>
	<h3>코치 등록 페이지</h3>
	<form:form modelAttribute="addCoach" enctype="multipart/form-data">
		<p> 이미지 업로드: <form:input type="file" path="coachImage"/>
		<p> 코치 아이디 : <form:input path="coachId" value="${param.id}"/>
		<p> 코치 이름 : <form:input path="coachName"/>
		<p> 자격증 : <form:input path="certificate"/>
		<p> 경력사항 : <form:textarea path="career" cols="50" rows="2"/>
		<p> 코치 소개 : <form:input path="description"/>
	<input type="submit" value="등록"/>
	</form:form>
</body>
</html>