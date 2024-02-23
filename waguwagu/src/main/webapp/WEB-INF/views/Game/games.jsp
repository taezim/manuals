<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value='/resources/css/bootstrap.min.css'/>"rel="stylesheet" />
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
   <c:forEach items="${list}" var="game">
      <div class="col-md-7">
         <h2> ${game.teamName1} vs  ${game.getMatches().get(0).teamName}</h2>
         <p> 경기 날짜 : ${game.date}
         <p> 경기장 : ${game.stadium}
         <a href="<c:url value='/games/game?id=${game.gameId}'/>" class="btn btn-success">상세보기</a>
      	 <a href="<c:url value='/match/add?id=${game.gameId}'/>" class="btn btn-success">매칭</a>
      	<a href="<c:url value='/match/delete?id=${game.gameId}'/>" class="btn btn-danger" onclick="return deleteConfirm('${game.gameId}')">매칭취소 &raquo;</a>
      </div>
   </c:forEach>   
</div>  
</body>
</html>