<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<c:forEach items="${coachList}" var="cl">
				<div class="col-md-4">
					<c:choose>
						<c:when test="${cl.getCoachImage() == null}">
							<img src="<c:url value='/resources/images/${cl.fileName}'/>" style="width:60%"/>
						</c:when>
						<c:otherwise>
							<img src="<c:url value='/resources/images/${cl.fileName}'/>" style="width: 60%"/>
						</c:otherwise>
					</c:choose>
				</div>
		<div class="col-md-7">
			<p>코치 이름 : ${cl.coachName}
				<p align="left">${fn:substring(cl.description, 0, 100)}...
			<a href="<c:url value='/coaches/coach?id=${cl.coachId}'/>" class="btn btn-success">코치 상세보기</a>
		</div>
	</c:forEach>   
</div>  
</body>
</html>