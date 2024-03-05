<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"rel="stylesheet" />
<title>MY REGIST</title>
</head>
<body>
<div class="container">
		<p>수강 신청 번호 : ${regist.registrationId}
		<p>클래스 이름 : ${regist.lessonId}
		<p>클래스 이름 : ${regist.lessonName}
		<p>코치 이름 : ${regist.coachId}
		<p>코치 이름 : ${regist.coachName}
		<p>코치 이름 : ${regist.studentId}
		<p>코치 이름 : ${regist.studentName}
		<p>코치 이름 : ${regist.phone}
		<p>코치 이름 : ${regist.notes}
		<p>결제 여부: ${regist.paymentStatus}
		<p>수강 신청일: ${regist.registDate}
		<a href="<c:url value='/lesson/myRegist'/>" class="btn btn-success">목록으로 돌아가기</a>
</div> 
</body>
</html>