<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"rel="stylesheet" />
<title>구단 등록</title>
</head>
<body>
	<nav class="navbar navbar-expand navbar-dark bg-dark">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="./home">Home</a>
			</div>
		</div>
	</nav>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">구단 등록</h1>
		</div>
	</div>
	
	<div class="container">
		<form:form modelAttribute="addTeam" enctype="multipart/form-data" class="form-horizontal">
		<fieldset>
			<div class="form-group row">
				<label class="col-sm-2 control-label">구단ID</label>
				<div class="col-sm-3">
					<form:input path="teamId" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">구단명</label>
				<div class="col-sm-3">
					<form:input path="teamName" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">인원수</label>
				<div class="col-sm-3">
					<form:input path="memberNumber" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">대표번호</label>
				<div class="col-sm-3">
					<form:input path="phoneNumber" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">구단장명</label>
				<div class="col-sm-7">
					<form:input path="leaderName" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
			    <label class="col-sm-2 control-label">선호지역</label>
			    <div class="col-sm-3">
			        <form:checkbox path="prefArea" value="서울특별시" class="form-control" />서울특별시
			        <form:checkbox path="prefArea" value="인천광역시" class="form-control" />인천광역시
			        <form:checkbox path="prefArea" value="경상남도" class="form-control" />경상남도
			    </div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">구단사진</label>
				<div class="col-sm-7">
					<form:input path="teamImage" type="file" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" class="btn btn-primary" value="등록하기" />
				<input type="reset" class="btn btn-primary" value="다시쓰기" />
				</div>
			</div>
		</fieldset>
		</form:form>
		<hr>
	<footer>
		<p>&copy; Member</p>
	</footer>	
	</div>
</body>
</html>