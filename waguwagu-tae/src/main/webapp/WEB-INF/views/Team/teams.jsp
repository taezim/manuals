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
	<link rel="stylesheet" href="<c:url value='/resources/css/test.css'/>"/>
	
	<script src="https://kit.fontawesome.com/c3566586b6.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="<c:url value='/resources/css/style.css' />">

<style>
    *{
      /* border:0.1px solid black; */
      list-style: none;
    }
    .heart
    {
      position: absolute;
      bottom: 5%;
      left: 3%;
      font-size: 1.2rem;
      color: rgb(79, 155, 253);
    }
    .hospital-img
    {
      position: relative;
    }
    .fa-solid
    {
      display: none;
    }
    
    .fa-regular:hover ~ .fa-solid
    {
      display: block;
    }
    .teamMatch{
    display:flex;
    }
    .tm{
    	display:flex;
    }
    .text-md-right{}

  </style>

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
	                  <li class="nav-item"><a class="nav-link" href="/waguwagu/team/result/ranks">구단랭킹</a></li>
	                  <li class="nav-item"><a class="nav-link" href="confirmation.html">나의구단</a></li>
	                </ul>
	              </li>
	              <li class="nav-item submenu dropdown">
	                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
	                  aria-expanded="false">경기</a>
	                <ul class="dropdown-menu">
	                  <li class="nav-item"><a class="nav-link" href="/waguwagu/games/add">게임등록</a></li>
	                  <li class="nav-item"><a class="nav-link" href="/waguwagu/games">경기목록</a></li>
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
	           <c:if test="${empty sessionScope.memberId }">
	            	<a href="/waguwagu/member/login">로그인</a>
	            </c:if>
	            <c:if test="${not empty sessionScope.memberId}">
				    <form action="/waguwagu/member/logout" method="post">
				        <input type="submit" value="로그아웃" style="border: none; background: none;  color:rgb(79, 155, 253)">
				    </form>
				</c:if>
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
					<h1>팀 목록</h1>
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


	<!-- ================ category section start ================= -->		  
  <section class="section-margin--small mb-5">
    <div class="container">
      <div class="row">
      
			<input class="pixel-radio" type="radio" id="all" name="location" value=" " class="radio_check">
			<input class="pixel-radio" type="radio" id="seoul" name="location" value="서울" class="radio_check">
			<input class="pixel-radio" type="radio" id="incheon" name="location" value="인천" class="radio_check">
			<input class="pixel-radio" type="radio" id="gyeonggi" name="location" value="경기" class="radio_check">
			<input class="pixel-radio" type="radio" id="gangwon" name="location" value="강원" class="radio_check">
			<input class="pixel-radio" type="radio" id="gyeongnam" name="location" value="경상남도" class="radio_check">
			<input class="pixel-radio" type="radio" id="busan" name="location" value="부산" class="radio_check">
			<input class="pixel-radio" type="radio" id="ulsan" name="location" value="울산" class="radio_check">
			<input class="pixel-radio" type="radio" id="gyeongbuk" name="location" value="경상북도" class="radio_check">
			<input class="pixel-radio" type="radio" id="daegu" name="location" value="대구" class="radio_check">
			<input class="pixel-radio" type="radio" id="junnam" name="location" value="전라남도" class="radio_check">
			<input class="pixel-radio" type="radio" id="gwangju" name="location" value="광주" class="radio_check">
			<input class="pixel-radio" type="radio" id="junbuk" name="location" value="전라북도" class="radio_check">
			<input class="pixel-radio" type="radio" id="daejeon" name="location" value="대전" class="radio_check">
			<input class="pixel-radio" type="radio" id="chungnam" name="location" value="충청남도" class="radio_check">
			<input class="pixel-radio" type="radio" id="chungbuk" name="location" value="충청북도" class="radio_check">
			<input class="pixel-radio" type="radio" id="jeju" name="location" value="제주">
      
        <div class="col-xl-3 col-lg-4 col-md-5">
	          <div class="sidebar-categories">
	            <div class="head">지역</div>
	            <ul class="main-categories">
	              <li class="common-filter">
	                <form action="#">
	                  <ul>
	                  	<li class="filter-list"><label for="all">전체보기</label></li>
	                    <li class="filter-list"><label for="seoul">서울</label></li>
	                    <li class="filter-list"><label for="incheon">인천</label></li>
	                    <li class="filter-list"><label for="gyeonggi">경기</label></li>
	                    <li class="filter-list"><label for="gangwon">강원도</label></li>
	                    <li class="filter-list"><label for="gyeongnam">경상남도</label></li>
	                    <li class="filter-list"><label for="busan">부산</label></li>
	                    <li class="filter-list"><label for="ulsan">울산</label></li>
	                    <li class="filter-list"><label for="gyeongbuk">경상북도</label></li>
	                    <li class="filter-list"><label for="daegu">대구</label></li>
	                    <li class="filter-list"><label for="junnam">전라남도</label></li>
	                    <li class="filter-list"><label for="gwangju">광주</label></li>
	                    <li class="filter-list"><label for="junbuk">전라북도</label></li>
	                    <li class="filter-list"><label for="daejeon">대전</label></li>
	                    <li class="filter-list"><label for="chungnam">충청남도</label></li>
	                    <li class="filter-list"><label for="chungbuk">충청북도</label></li>
	                  	<li class="filter-list"><label for="jeju">제주도</label></li>
	                  </ul>
	                </form>
	              </li>
	            </ul>
	          </div>
	        </div>
        <div class="col-xl-9 col-lg-8 col-md-7">
          <!-- Start Filter Bar -->
          <div class="filter-bar d-flex flex-wrap align-items-center">
            <div class="sorting">
              <select>
                <option value="1">Default sorting</option>
                <option value="1">Default sorting</option>
                <option value="1">Default sorting</option>
              </select>
            </div>
            <div class="sorting mr-auto">
              <select>
                <option value="1">Show 12</option>
                <option value="1">Show 12</option>
                <option value="1">Show 12</option>
              </select>
            </div>
            <div>
              <div class="input-group filter-bar-search">
                <input type="text" placeholder="Search">
                <div class="input-group-append">
                  <button type="button"><i class="ti-search"></i></button>
                </div>
              </div>
            </div>
          </div>
          <!-- End Filter Bar -->
			<!-- Start Best Seller -->
			<section class="lattest-product-area pb-40 category-list">
			  <div class="row">
			    <div class="">
			      <ul>
			        <c:forEach var="team" items="${teamList}">
			          <li class="d-f shadow-sm p-3 mb-5 bg-body-tertiary rounded" aria-current="true">
			            <div class="card-product d-inline-flex">
			              <div class="hospital-img" style="width: 30%;">
			                <img class="img-fluid" src="<c:url value='/resources/images/${team.fileName}'/>" alt="" width="500px">
			              </div>
			              <div class="d-flex flex-column flex-md-row">
			              	<div class="ml-3">
				                <h2 class="">${team.teamName}</h2>
				                <div class="subheading mb-3">${team.teamId}</div>
				                <p>${team.prefArea}</p>
				                <p>${team.phoneNumber}</p><br>
				                <p>${team.description}</p>
				             </div>   
			              </div>
			            </div>
			            <div class="text-md-right">
			              <a href="<c:url value='/team/team?id=${team.teamId}'/>" class="btn btn-sm btn-primary">상세보기</a>
			            </div>
			          </li>
			        </c:forEach>
			      </ul>
			    </div>
			  </div>
			</section>
			<!-- End Best Seller -->
        </div>
      </div>
    </div>
  </section>
	<!-- ================ category section end ================= -->		  
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script>
    $(document).ready(function() {
        // 라디오 버튼 클릭 이벤트 처리
        $('input[name="location"]').on('change', function() {
            // 선택된 라디오 버튼의 값 (서울, 인천, ...) 가져오기
            var selectedLocation = $('input[name="location"]:checked').val();

            // URL 동적으로 변경
            var newUrl = '/waguwagu/team/location?location=' + encodeURIComponent(selectedLocation);
            window.location.href = newUrl;

            // URL 확인
            console.log(newUrl);
            // 또는 alert로 확인
          
        });
    });
</script>

  
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