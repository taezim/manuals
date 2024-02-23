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
            <h3>${ls.className}</h3>
            <p>가격 : ${ls.fees}원</p>
            <br>
            <p><b>상품코드</b> : <span class="badge badge-info">${ls.classId}</span>
            <p><b>상품 설명</b> : ${ls.description}
            <p><b>분류</b> : ${ls.subject}
            <p><b>재고수</b> : ${ls.venue}
            <p><b>상태</b> : ${ls.managerName}
            <p><b>누적 주문수</b> : ${ls.tel}
            <h4>평균 별점 : ${avgScore}점</h4>
            <br>
            <form:form name="addLesson" method="put">
               <p><a href="javascript:addToCart('../cart/add/${ls.classId}')" class="btn btn-primary">관심 등록 &raquo;</a>
               <a href="<c:url value="/products"/>"class="btn btn-secondary">도서 목록 &raquo;</a>
               <a href="<c:url value="/cart"/>"class="btn btn-warning">수강 신청 &raquo;</a>
               <a href='<c:url value="/lesson/review?id=${ls.classId}"/>' class="btn btn-success">리뷰 목록&raquo;</a>
               <a href='<c:url value="/lesson/update?id=${ls.classId}"/>' class="btn btn-success">수정&raquo;</a>
               <a href="<c:url value="javascript:deleteConfirm('${ls.classId}')"/>" class="btn btn-danger">삭제 &raquo;</a>
            </form:form>
         </div>
      </div>
   </div>
</body>
</html>