<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<h3>구단 등록 페이지</h3>
	<div class="col-md-4">
		<img src="<c:url value='/resources/images/${team.fileName}'/>" alt="image" style="width: 100%"/>
	</div>
	<form:form modelAttribute="updateTeam" action="./update?id=${team.teamId}" class="form-horizontal" enctype="multipart/form-data">
		<p> 구단 아이디 : <form:input path="teamId" value="${team.teamId}"/> <!-- path 는 DTO 객체의 변수 -->
		<p> 구단 이름 : <form:input path="teamName" value="${team.teamName}"/>
		<p> 구단 	인원 : <form:input path="memberNumber" value="${team.memberNumber}"/>
		<p> 구단 대표번호 : <form:input path="phoneNumber" value="${team.phoneNumber}"/>
		<p> 구단장 : <form:input path="leaderName" value="${team.leaderName}"/>
		<p> 선호지역 : <form:input path="prefArea" value="${team.prefArea}"/>
		<div class="col-sm-10">
			이미지<form:input path="teamImage" type="file" class="form-control"/>
		</div>
		<div class="form-group row">
			<input type="submit" class="btn btn-primary" value="수정"/>
			<a href="<c:url value="/teams"/>" class="btn btn-primary">취소</a>
		</div>
	</form:form>
</div>
</body>
</html>