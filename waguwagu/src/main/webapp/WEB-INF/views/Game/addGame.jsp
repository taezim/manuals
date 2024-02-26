<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"rel="stylesheet" />
<title>경기 등록</title>
</head>
<body>
   <h3>경기 등록 페이지</h3>
   <form:form modelAttribute="addGame" enctype="multipart/form-data">
      <!-- <p>  아이디 : <form:input path="gameId"/>  -->
      <p> 팀 아이디 : <form:input path="teamId1"/> <!-- path 는 DTO 객체의 변수 -->
      <p> 팀 이름 : <form:input path="teamName1"/>
      <p> 경기 날짜 : <form:input type="date" path="date"/>
      <p> 예약자 아이디 : <form:input path="userId"/>
      <p> 예약자 이름 : <form:input path="userName"/>
      <p> 전화번호 : <form:input path="userNumber"/>
      <p> 경기장 : <form:input path="stadium" />
      <p> 구단사진 : <form:input path="gameImage" type="file" class="form-control" />
         <input type="submit" value="등록"/>
   </form:form>
</body>
</html>