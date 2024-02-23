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
<title>병원 정보</title>
</head>
<body>
<h2>병원 목록</h2>

<c:forEach var="hospital" items="${hospitalList}">
    <div>
		<c:choose>
			<c:when test="${hospital.getHospitalImage() == null}">
				<img src="<c:url value='/resources/images/${hospital.fileName}'/>" style="width: 50%"/>
			</c:when>
			<c:otherwise>
				<img src="<c:url value='/resources/images/${hospital.fileName}'/>" style="width: 50%"/>
			</c:otherwise>
		</c:choose>
	</div>
    <div>
        <p>병원 ID: ${hospital.hospitalId}</p>
        <p>병원 이름: ${hospital.hospitalName}</p>
        <p>위치 : ${hospital.hospitalPlace}</p>
		<p>번호 : ${hospital.hospitalNumber}</p>
		<p>진료과목 : ${hospital.hospitalSubject}</p>		
		<p><a href="<c:url value="/hospital/hospital?id=${hospital.hospitalId}"/>"class="btn btn-secondary" role="button">상세정보 &raquo;</a>
	    </div>
	    <hr>
</c:forEach>
</body>
</html>