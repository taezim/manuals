<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="container">
		<div class="row">
			<div class="col-md-8">
				<h3>${ls.className}</h3>
				<p>���� : ${ls.fees}��</p>
				<br>
				<p><b>��ǰ�ڵ�</b> : <span class="badge badge-info">${ls.classId}</span>
				<p><b>��ǰ ����</b> : ${ls.description}
				<p><b>�з�</b> : ${ls.subject}
				<p><b>����</b> : ${ls.venue}
				<p><b>����</b> : ${ls.managerName}
				<p><b>���� �ֹ���</b> : ${ls.tel}
				<h4>��� ���� : ${ls.auditors}��</h4>
				<br>
				<form:form name="addLesson" method="put">
					<p><a href="javascript:addToCart('../cart/add/${ls.classId}')" class="btn btn-primary">���� ��� &raquo;</a>
					<a href="<c:url value="/cart"/>"class="btn btn-warning">���� ��û &raquo;</a>
					<a href="<c:url value="/products"/>"class="btn btn-secondary">���� ��� &raquo;</a>
					<a href='<c:url value="/products/update?id=${ls.classId}"/>' class="btn btn-success">����&raquo;</a>
					<a href="<c:url value="javascript:deleteConfirm('${ls.classId}')"/>" class="btn btn-danger">���� &raquo;</a>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>