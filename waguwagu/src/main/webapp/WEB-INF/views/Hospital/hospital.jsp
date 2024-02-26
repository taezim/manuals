<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>병원 정보</h2>

<c:if test="${not empty hospital}">
	<div class="col-md-4">
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
        <p>위치 : ${hospital.hospitalPlace }</p>
        <p>전화번호 : ${hospital.hospitalNumber }</p>
		<form:form name="addForm" method="put">        	
		    <a href='<c:url value="/hospital/update?id=${hospital.hospitalId}"/>' class="btn btn-success">수정&raquo;</a>
		    <a href="<c:url value='/hospital/delete?id=${hospital.hospitalId}'/>" class="btn btn-danger" onclick="return deleteConfirm('${hospital.hospitalId}')">삭제 &raquo;</a>
		    <a href="<c:url value='/hospital/review?id=${hospital.hospitalId}'/>" class="btn btn-success">리뷰&raquo;</a>
		    
		</form:form>
    </div>
    <hr>
</c:if>
</body>
</html>