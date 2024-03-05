<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html lang="KR">
<head>
  <title>Soccer &mdash; Website by Colorlib</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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

</head>
<body>
	<header class="header_area">
	    <div class="main_menu">
	      <nav class="navbar navbar-expand-lg navbar-light">
	        <div class="container">
	          <a class="navbar-brand logo_h" href="index.html">
	          	<img src="<c:url value='/resources/img/baseball.png'/>" alt=''/>
	          </a>
	          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
	            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	          </button>
	          <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
	            <ul class="nav navbar-nav menu_nav ml-auto mr-auto">
	              <li class="nav-item"><a class="nav-link" href="index.html">홈</a></li>
	              <li class="nav-item"><a class="nav-link" href="index.html">쇼핑</a></li>
	              <li class="nav-item active submenu dropdown">
	                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
	                  aria-expanded="false">구단</a>
	                <ul class="dropdown-menu">
	                  <li class="nav-item"><a class="nav-link" href="/waguwagu/team/add">구단등록</a></li>
	                  <li class="nav-item"><a class="nav-link" href="/waguwagu/team">구단목록</a></li>
	                  <li class="nav-item"><a class="nav-link" href="/waguwagu/games">경기목록</a></li>
	                  <li class="nav-item"><a class="nav-link" href="/waguwagu/team/result/ranks">구단랭킹</a></li>
	                  <li class="nav-item"><a class="nav-link" href="confirmation.html">나의구단</a></li>
	                </ul>
								</li>
	              <li class="nav-item submenu dropdown">
	                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
	                  aria-expanded="false">클래스</a>
	                <ul class="dropdown-menu">
	                  <li class="nav-item"><a class="nav-link" href="/waguwagu/Lesson/lessons">클래스?</a></li>
	                  <li class="nav-item"><a class="nav-link" href="/waguwagu/lessons">클래스목록</a></li>
	                </ul>
								</li>
	              <li class="nav-item submenu dropdown">
	                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
	                  aria-expanded="false">경기장</a>
	                <ul class="dropdown-menu">
	                  <li class="nav-item"><a class="nav-link" href="/waguwagu/">경기장목록</a></li>
	                  <li class="nav-item"><a class="nav-link" href="single-blog.html">경기장예약</a></li>
	                </ul>
								</li>
	              <li class="nav-item submenu dropdown">
	                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
	                  aria-expanded="false">관광</a>
	                <ul class="dropdown-menu">
	                  <li class="nav-item"><a class="nav-link" href="blog.html">맛집</a></li>
	                  <li class="nav-item"><a class="nav-link" href="single-blog.html">둘러볼곳</a></li>
	                </ul>
								</li>
								<li class="nav-item submenu dropdown">
	                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
	                  aria-expanded="false">의료</a>
	                <ul class="dropdown-menu">
	                  <li class="nav-item"><a class="nav-link" href="/waguwagu/hospitalinfo/list">병원목록</a></li>
	                  <li class="nav-item"><a class="nav-link" href="/waguwagu/Hospital/">병원예약</a></li>
	                  <li class="nav-item"><a class="nav-link" href="tracking-order.html">재활추천</a></li>
	                </ul>
	              </li>
	            </ul>
	
	            <ul class="nav-shop">
	              <li class="nav-item"><button><i class="ti-search"></i></button></li>
	              <li class="nav-item"><button><i class="ti-shopping-cart"></i><span class="nav-shop__circle">3</span></button> </li>
	              <li class="nav-item"><button><i class="fas fa-user"></i></button></li>
	            </ul>
	          </div>
	        </div>
	      </nav>
	    </div>
	  </header>
	<!--================ End Header Menu Area =================-->
	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>${tb.teamName}</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Shop Category</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->

<c:if test="${not empty tb}">
	<div class="col-md-4">
		<c:choose>
			<c:when test="${tb.getTeamImage() == null}">
				<img src="<c:url value='/resources/images/${tb.fileName}'/>" style="width: 50%"/>
			</c:when>
			<c:otherwise>
				<img src="<c:url value='/resources/images/${tb.fileName}'/>" style="width: 50%"/>
			</c:otherwise>
		</c:choose>
	</div>
    <div>
        <p>팀 ID: ${tb.teamId}</p>
        <p>팀 이름: ${tb.teamName}</p>
        <p>${tb.description }</p>
		<form:form name="addForm" method="put">    
			<a href='<c:url value="/team/result/recent?id=${tb.teamId}"/>' class="btn btn-success">최근경기결과&raquo;</a>    	
			<a href='<c:url value="/team/result/winning?id=${tb.teamId}"/>' class="btn btn-success">경기결과&raquo;</a>   
			<a href="<c:url value='/team/result/add?id=${tb.teamId}'/>" class="btn btn-success">가입신청</a> 			    
		    <a href='<c:url value="/team/update?id=${tb.teamId}"/>' class="btn btn-success">수정&raquo;</a>
		    <a href="<c:url value='/team/delete?id=${tb.teamId}'/>" class="btn btn-danger" onclick="return deleteConfirm('${tb.teamId}')">삭제 &raquo;</a>
			<a href="<c:url value='/team/result/add?id=${tb.teamId}'/>" class="btn btn-success">경기결과</a>
		</form:form>
    </div>
    <hr>
</c:if>

	<!-- ================ top product area end ================= -->		

  
  <script href="<c:url value ='/resources/js/jquery-3.3.1.min.js'/>"></script>
  <script href="<c:url value ='/resources/js/jquery-migrate-3.0.1.min.js'/>"></script>
  <script scr="<c:url value ='/resources/js/jquery-ui.js'/>"></script>
  <script scr="<c:url value ='/resources/js/popper.min.js'/>"></script>
  <script scr="<c:url value ='/resources/js/bootstrap.min.js'/>"></script>
  <script scr="<c:url value ='/resources/js/owl.carousel.min.js'/>"></script>
  <script scr="<c:url value ='/resources/js/jquery.stellar.min.js'/>"></script>
  <script scr="<c:url value ='/resources/js/jquery.countdown.min.js'/>"></script>
  <script scr="<c:url value ='/resources/js/bootstrap-datepicker.min.js'/>"></script>
  <script scr="<c:url value ='/resources/js/jquery.easing.1.3.js'/>"></script>
  <script scr="<c:url value ='/resources/js/aos.js'/>"></script>
  <script scr="<c:url value ='/resources/js/jquery.fancybox.min.js'/>"></script>
  <script scr="<c:url value ='/resources/js/jquery.sticky.js'/>"></script>
  <script scr="<c:url value ='/resources/js/jquery.mb.YTPlayer.min.js'/>"></script>

  <script scr="<c:url value ='/resources/js/main.js'/>"></script>
</body>
</html>