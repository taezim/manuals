<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="col-md-4">
		<img src="<c:url value='/resources/images/${ch.fileName}'/>" style="width: 10%"/>
		<p>아이디 : ${ch.coachId}
		<p>비밀번호 : ${ch.coachName}
		<p>생년월일 : ${ch.certificate}
		<p>성별 : ${ch.career}
		<p> 회원등급 : ${ch.description}
		<div>
			<c:choose>
		      <c:when test="${empty ch.classId}">
		        <p> 개설된 클래스가 없습니다
		      </c:when>
		      <c:when test="${not empty ch.classId}">
		         <a href='<c:url value="/lessons/lesson?id=${ch.classId}"/>' class="btn btn-success">개설된 클래스 보기&raquo;</a>
		      </c:when>
		   </c:choose>
			<!-- <a href="<c:url value="javascript:deleteMember('${member.memberId}')"/>" class="btn btn-danger">삭제 &raquo;</a>-->
			<a href='<c:url value="/manager/delete?id=${member.memberId}"/>' class="btn btn-danger">관심 등록&raquo;</a>
		</div>
	</div>
</body>
</html>