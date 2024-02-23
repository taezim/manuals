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
<title>구단 승리 정보</title>
</head>
<body>
<h2>구단 승리 목록</h2>

<c:forEach var="winning" items="${winningList}">

    <div>
        <p>승리정보 ID: ${winning.winningId}</p>
        <p>구단 ID: ${winning.teamId}</p>
		<p>최근10경기결과 : ${recent.recent}</p>	
		<p>날짜 : ${winning.date}</p>	
		<p><a href="<c:url value="/team/result/winning?id=${winning.teamId}"/>"class="btn btn-secondary" role="button">상세정보 &raquo;</a>
		<p><a href="<c:url value='/team/result'/>" class="btn btn-secondary" role="button">목록 &raquo;</a></p>	
		
		<a href='<c:url value="/team/result/update?id=${winning.winningId}"/>' class="btn btn-success">수정&raquo;</a>    			    
	    </div>
	    <hr>
</c:forEach>
</body>
</html>