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
	<c:forEach items="${memberList}" var="member">
		<div class="col-md-7">
			<img src="<c:url value='/resources/images/${member.fileName}'/>" style="width: 10%"/>
			<p>아이디 : ${member.memberId}
			<p>비밀번호 : ${member.password}
			<p>생년월일 : ${member.birth}
			<p>성별 : ${member.sex}
			<a href="<c:url value='/manager/${member.memberId}'/>" class="btn btn-success">회원 상세보기</a>
		</div>
	</c:forEach>   
</div>  
</body>
</html>