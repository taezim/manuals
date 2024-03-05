<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" href="<c:url value='/resources/css/bootstrap.min.css'/>"rel='stylesheet' />
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/controllers.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="container">
		<div class="row">
			<div class="col-md-8">
				<h3>${ls.className}</h3>
				<p>가격 : ${ls.fees}원</p>
				<br>
				<p><b>상품코드</b> : <span class="badge badge-info">${ls.classId}</span>
				<p><b>상품 설명</b> : ${ls.description}
				<p><b>분류</b> : ${ls.subject}
				<p><b>재고수</b> : ${ls.venue}
				<p><b>상태</b> : ${ls.managerName}
				<p><b>누적 주문수</b> : ${ls.tel}
				<h4>평균 별점 : ${ls.auditors}점</h4>
				<p><b>상품 설명</b> : ${ls.description}
			<c:choose>
				<c:when test="${ls.startDate == null or ls.endDate == null}">
						<p>미정 / 수업 일정 조정 가능
				</c:when>
				<c:otherwise>
					<p>수업 시작일 : ${ls.startDate}
					<p>수업 종료일 : ${ls.endDate}
					<p>수업 일수 : ${ls.lessonDays}
				</c:otherwise>
			</c:choose>
				<br>
				<form:form name="addWish" method="put">
					<p><a href="javascript:addToWish('../wish/add/${ls.classId}')" class="btn btn-primary">관심 등록 &raquo;</a>
					<input type="hidden" name="category" value="lesson">
				</form:form>
				<a href="<c:url value='/lesson/regist?lessonId=${ls.classId}'/>"class="btn btn-warning">수강 신청 &raquo;</a>
				<a href="<c:url value="/lessons"/>"class="btn btn-secondary">클래스 목록 &raquo;</a>
			</div>
		</div>
	</div>
</body>
</html>