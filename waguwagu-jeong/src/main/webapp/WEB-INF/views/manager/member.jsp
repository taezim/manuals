<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"rel="stylesheet" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/controllers.js"></script>
<meta charset="utf-8">
<title>회원 목록</title> 
</head>
<body>
<div class="col-md-4">
		<img src="<c:url value='/resources/images/${member.fileName}'/>" style="width: 10%"/>
		<p>아이디 : ${member.memberId}
		<p>비밀번호 : ${member.password}
		<p>생년월일 : ${member.birth}
		<p>성별 : ${member.sex}
		<p> 회원등급 : ${member.position}
		<div>
			<c:choose>
		      <c:when test="${member.position == '코치'}">
		         <a href='<c:url value="/manager/update?id=${member.memberId}"/>' class="btn btn-danger">회원 강등&raquo;</a>
		      </c:when>
		      <c:when test="${member.position =='선수'}">
		         <a href='<c:url value="/manager/update?id=${member.memberId}"/>' class="btn btn-success">코치 승급&raquo;</a>
		      </c:when>
		   </c:choose>
			<!-- <a href="<c:url value="javascript:deleteMember('${member.memberId}')"/>" class="btn btn-danger">삭제 &raquo;</a>-->
			<a href='<c:url value="/manager/delete?id=${member.memberId}"/>' class="btn btn-danger">회원 삭제&raquo;</a>
		</div>
	</div>
</body>
</html>