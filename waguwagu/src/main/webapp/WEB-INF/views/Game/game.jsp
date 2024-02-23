<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>      
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
      <div class="row">
         <div class="col-md-8">
                <h3>${game.gameId}</h3>
                <div>
                <img src="<c:url value='/resources/images/${game.fileName}'/>" alt="${game.teamName1} Image" width="50" height="50">
                <h2>${game.teamName1}</h2>
                <p>
                </div>vs 
                <div>
			    <c:forEach var="match" items="${game.matches}">
			    	<!--  <img src="<c:url value='/resources/images/${match.fileName}'/>" alt="${match.teamName} Image" width="50" height="50">-->
			        <img src="<c:url value='/resources/images/${match.fileName}'/>" style="width: 50" height="50"/>
			        <h2>${match.teamName}</h2>
			        <p>예약자 : ${match.userId }</p>
			    </c:forEach>
			    </div>
			    <p><b>경기일</b> : ${game.date}</p>
                <p><b>경기장</b> : ${game.stadium}</p>
                <p><b>예약자</b> : ${game.userId}</p>
                <p><b>전화번호</b> : ${game.userNumber}</p>
                <form:form name="addGame" method="put">
	               <a href="<c:url value="/games"/>"class="btn btn-secondary">목록 &raquo;</a>
	               <a href='<c:url value="/games/update?id=${game.gameId}"/>' class="btn btn-success">수정&raquo;</a>
	               <a href="<c:url value='/games/delete?id=${game.gameId}'/>" class="btn btn-danger" onclick="return deleteConfirm('${game.gameId}')">삭제 &raquo;</a>
	            </form:form>
	            <a href="<c:url value='/match/add?id=${game.gameId}'/>" class="btn btn-success">매칭</a>
	      		<a href="<c:url value='/match/update?id=${game.gameId}'/>" class="btn btn-success">매칭수정</a>
	      		<a href="<c:url value='/match/delete?id=${game.gameId}'/>" class="btn btn-danger" onclick="return deleteConfirm('${game.gameId}')">매칭취소 &raquo;</a>
                <%-- <div>
                    <!-- Output game images -->
                    <img src="<c:url value='/resources/images/${game.fileName}'/>" alt="${game.teamName1} Image" width="50" height="50">
                    <img src="<c:url value='/resources/images/${game.matches[0].fileName}'/>" alt="${game.matches[0].teamName1} Image" width="50" height="50">
                </div>
                <h2>${game.teamName1} vs ${game.matches[0].teamName}</h2>
                <br>
                <!-- Output game details -->
                <p><b>경기일</b> : ${game.date}</p>
                <p><b>경기장</b> : ${game.stadium}</p>
                <p><b>예약자</b> : ${game.userId}</p>
                <p><b>전화번호</b> : ${game.userNumber}</p>
                <br>
                <!-- Output matches -->
                <h4>Matches:</h4>
                <c:forEach var="match" items="${game.matches}">
                    <p>${match.teamName} - ${match.userName}</p>
                </c:forEach>
	            <form:form name="addGame" method="put">
	               <a href="<c:url value="/games"/>"class="btn btn-secondary">목록 &raquo;</a>
	               <a href='<c:url value="/games/update?id=${game.gameId}"/>' class="btn btn-success">수정&raquo;</a>
	               <a href="<c:url value='/games/delete?id=${game.gameId}'/>" class="btn btn-danger" onclick="return deleteConfirm('${game.gameId}')">삭제 &raquo;</a>
	            </form:form>
	            <a href="<c:url value='/match/add?id=${game.gameId}'/>" class="btn btn-success">매칭</a>
	      		<a href="<c:url value='/match/delete?id=${game.gameId}'/>" class="btn btn-danger" onclick="return deleteConfirm('${game.gameId}')">매칭취소 &raquo;</a> --%>
         </div>
      </div>
   </div>
</body>
</html>