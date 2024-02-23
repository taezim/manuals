<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"rel="stylesheet" />
<title>결과 등록</title>
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
			<h1 class="display-3">결과 등록</h1>
		</div>
	</div>
	
	<div class="container">
		<form:form modelAttribute="addWinning" enctype="multipart/form-data" class="form-horizontal">
		<fieldset>
			<div class="form-group row">
				<label class="col-sm-2 control-label">결과ID</label>
				<div class="col-sm-3">
					<form:input path="winningId" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">구단ID</label>
				<div class="col-sm-3">
					<form:input path="teamId" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">경기날짜</label>
				<div class="col-sm-7">
					<form:input path="date" type="date" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">경기수</label>
				<div class="col-sm-3">
					<form:input path="matches" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">결과</label>
				<div class="col-sm-3">
					<form:radiobutton path="result" value="Win" class="form-control" />승리
					<form:radiobutton path="result" value="Tie" class="form-control" />무승부
					<form:radiobutton path="result" value="Lose" class="form-control" />패배
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
		<p>&copy; Result</p>
	</footer>	
	</div>
</body>
</html>