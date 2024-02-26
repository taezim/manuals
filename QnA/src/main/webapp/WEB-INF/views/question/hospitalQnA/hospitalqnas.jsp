<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"rel="stylesheet" />

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>hosptalqna 페이지 입니다.</h2>
	 <div class="container">
		<div class="row" align="center">
			<c:forEach items="${hosptalqnaList}" var="hosptalqna">
				<div class="col-md-4">
					<h3>${hosptalqna.number}</h3>
					<p>${hosptalqna.content}
						<br>${hosptalqna.email}
					<p>${hosptalqna.date}원
				</div><br>
				<p><a href="<c:url value="/hosptalquestion/hosptalqna?hosptalnumber=${hosptalqna.hosptalid}"/>"class="btn btn-secondary" role="button">상세정보 &raquo;</a><!-- 코드 추가됨 --><br>
			</c:forEach>
		</div>
	</div>
        <div>
           
         <a href="./question/hosptaladd">add</a>
</div>


</body>
</html>