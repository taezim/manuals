<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>class updateqna 페이지</h3>
	<form:form modelAttribute="classupdateqna" method="post">
	    <p> 번호 : ${class123.number}
	    <p> 내용 : <form:input path="content" cols="50" rows="2" value="${class123.content}" />
	    <p> email : <form:input path="email" value="${class123.email}" />
	    <p> 날짜 : <form:input path="date" value="${class123.date}" />
	    <br><br>
	    <input type="submit" value="수정"/>
	</form:form>
</body>
</html>