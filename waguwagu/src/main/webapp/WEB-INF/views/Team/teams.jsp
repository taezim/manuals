<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- form 사용을 위한 선언 -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"rel="stylesheet" />
<script src="${pageContext.request.contextPath }/resources/js/controllers.js"></script>
<!-- 스크립트 사용을 위해 선언 -->
<title>팀 정보</title>
</head>
<body>
<h2>팀 목록</h2>

<c:forEach var="team" items="${teamList}">
    <div>
        <p>팀 ID: ${team.teamId}</p>
        <p>팀 이름: ${team.teamName}</p>
        <p>인원수 : ${team.memberNumber}</p>
		<p>구단장 : ${team.leaderName}</p>
		<p>대표번호 : ${team.phoneNumber}</p>		
		<p>선호지역 : ${team.prefArea}</p>
		<p><a href="<c:url value="/team/team?id=${team.teamId}"/>"class="btn btn-secondary" role="button">상세정보 &raquo;</a>
	    </div>
	    <hr>
</c:forEach>
</body>
</html>