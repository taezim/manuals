<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  <link rel="icon" href="img/Fevicon.png" type="image/png">

	<link rel="stylesheet" href="<c:url value='/resources/vendors/bootstrap/bootstrap.min.css' />">
	<link rel="stylesheet" href="<c:url value='/resources/vendors/fontawesome/css/all.min.css' />">
	<link rel="stylesheet" href="<c:url value='/resources/vendors/themify-icons/themify-icons.css' />">
	<link rel="stylesheet" href="<c:url value='/resources/vendors/linericon/style.css' />">
	<link rel="stylesheet" href="<c:url value='/resources/vendors/owl-carousel/owl.theme.default.min.css' />">
	<link rel="stylesheet" href="<c:url value='/resources/vendors/owl-carousel/owl.carousel.min.css' />">
	<link rel="stylesheet" href="<c:url value='/resources/vendors/nice-select/nice-select.css' />">
	<link rel="stylesheet" href="<c:url value='/resources/vendors/nouislider/nouislider.min.css' />">
	<script src="https://kit.fontawesome.com/c3566586b6.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="<c:url value='/resources/css/style.css' />">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<title>회원 등록</title>
</head>
<body>
	<nav class="navbar navbar-expand navbar-dark bg-dark">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="./home">Home</a>
			</div>
		</div>
	</nav>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원 등록</h1>
		</div>
	</div>
	
	<div class="container">
		<form:form modelAttribute="member" enctype="multipart/form-data" class="form-horizontal">
		<fieldset>
			<div class="form-group row">
				<label class="col-sm-2 control-label">회원ID</label>
				<div class="col-sm-3">
					<form:input path="memberId" id="username" name="username" class="form-control" />
					<div id="usernameMessage"></div>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">비밀번호</label>
				<div class="col-sm-3">
					<form:input path="password" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">회원명</label>
				<div class="col-sm-3">
					<form:input path="name" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">생년월일</label>
				<div class="col-sm-3">
					<form:input type="date" path="birth" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">주소</label>
					<div class="col-sm-3">
					    <input type="text" name="zipcode" path="address.zipcode" id="sample6_postcode" placeholder="우편번호" class="form-control" >
					    <input type="button" name="zipcode" path="address.zipcode" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="form-control" ><br>
					    <input type="text" name="streetAddress" path="address.streetAddress" id="sample6_address" placeholder="주소"><br>
					    <input type="text" name="detaileAddress" path="address.detaileAddress" id="sample6_detailAddress" placeholder="상세주소" class="form-control" >
					    <input type="text" name="extraAddress" path="address.extraAddress" id="sample6_extraAddress" placeholder="참고항목" class="form-control" >
					</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">이미지</label>
				<div class="col-sm-7">
					<%-- <form:input path="memberImage" type="file" class="form-control" /> --%>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">성별</label>
				<div class="col-sm-3">
					<form:radiobutton path="sex" value="남성" />남성
					<form:radiobutton path="sex" value="여성" />여성
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">소속구단</label>
				<div class="col-sm-3">
					<form:input path="team" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">부상정보</label>
				<div class="col-sm-5">
					<form:textarea path="injury" cols="50" rows="2" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">수강강의</label>
				<div class="col-sm-3">
					<form:input path="classId" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">코치번호</label>
				<div class="col-sm-3">
					<form:input path="teacherId" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">개인성적</label>
				<div class="col-sm-3">
					<form:input path="personalRecord" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" class="btn btn-primary" value="가입하기" />
				<input type="reset" class="btn btn-primary" value="다시쓰기" />
				</div>
			</div>
		</fieldset>
		</form:form>
		<hr>
	<footer>
		<p>&copy; Member</p>
	</footer>	
	</div>
<!-- 	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
	    $(document).ready(function () {
	        $("#username").on("blur", function () {
	            var username = $(this).val();
	            if (username) {
	                $.ajax({
	                    url: "/checkUsername",
	                    method: "GET",
	                    data: { username: username },
	                    success: function (response) {
	                        $("#usernameMessage").text(response);
	                    },
	                    error: function (xhr, status, error) {
	                        var errorMessage = xhr.responseText;
	                        $("#usernameMessage").text(errorMessage);
	                    }
	                });
	            }
	        });
	    });
	</script> -->
	
	
</body>
</html>