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
		<p>���̵� : ${ch.coachId}
		<p>��й�ȣ : ${ch.coachName}
		<p>������� : ${ch.certificate}
		<p>���� : ${ch.career}
		<p> ȸ����� : ${ch.description}
		<div>
			<a href='<c:url value="/manager/accept?id=${member.memberId}"/>' class="btn btn-danger">ȸ�� ����&raquo;</a>
			<!-- <a href="<c:url value="javascript:deleteMember('${member.memberId}')"/>" class="btn btn-danger">���� &raquo;</a>-->
			<a href='<c:url value="/manager/delete?id=${member.memberId}"/>' class="btn btn-danger">���� ���&raquo;</a>
		</div>
	</div>
</body>
</html>