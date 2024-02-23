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
<h2>팀 정보</h2>

<c:if test="${not empty tb}">
	<div class="col-md-4">
		<c:choose>
			<c:when test="${tb.getTeamImage() == null}">
				<img src="<c:url value='/resources/images/${tb.fileName}'/>" style="width: 50%"/>
			</c:when>
			<c:otherwise>
				<img src="<c:url value='/resources/images/${tb.fileName}'/>" style="width: 50%"/>
			</c:otherwise>
		</c:choose>
	</div>
    <div>
        <p>팀 ID: ${tb.teamId}</p>
        <p>팀 이름: ${tb.teamName}</p>
		<form:form name="addForm" method="put">    
			<a href='<c:url value="/team/result/recent?id=${tb.teamId}"/>' class="btn btn-success">최근경기결과&raquo;</a>    	
			<a href='<c:url value="/team/result/winning?id=${tb.teamId}"/>' class="btn btn-success">경기결과&raquo;</a>    			    
		    <a href='<c:url value="/team/update?id=${tb.teamId}"/>' class="btn btn-success">수정&raquo;</a>
		    <a href="<c:url value='/team/delete?id=${tb.teamId}'/>" class="btn btn-danger" onclick="return deleteConfirm('${tb.teamId}')">삭제 &raquo;</a>
		</form:form>
    </div>
    <hr>
</c:if>
</body>
</html>