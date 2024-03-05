<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- form 사용을 위한 선언 -->
    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Medical</title>
	<link rel="icon" href="img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="<c:url value='/resources/vendors/bootstrap/bootstrap.min.css'/>"/>
  <link rel="stylesheet" href="<c:url value='/resources/vendors/fontawesome/css/all.min.css'/>"/>
	<link rel="stylesheet" href="<c:url value='/resources/vendors/themify-icons/themify-icons.css'/>"/>
	<link rel="stylesheet" href="<c:url value='/resources/vendors/linericon/style.css'/>"/>
  <link rel="stylesheet" href="<c:url value='/resources/vendors/nice-select/nice-select.css'/>"/>
  <link rel="stylesheet" href="<c:url value='/resources/vendors/owl-carousel/owl.theme.default.min.css'/>"/>
  <link rel="stylesheet" href="<c:url value='/resources/vendors/owl-carousel/owl.carousel.min.css'/>"/>

  <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>"/>
  <style>
	.fade{
		/* text-align: center; */
	}
	.fade-1{
		display: flex;
		align-items: center;
	}
	.breadhospital{
		background-color: transparent; 
		border-bottom: 1px solid #777;
	}
	.findRaod{
		font-size:30px;
		color:#384aeb;
	}
  </style>
</head>
<body>
	<!--================ Start Header Menu Area =================-->
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
	<section class="blog-banner-area" id="blog">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Medical</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">hospital</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->
	<div class="container">
		<nav class="bread_c" style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
			<ol class="breadcrumb breadhospital">
			  <li class="breadcrumb-item"><a href="#">병원목록</a></li>
			  <li class="breadcrumb-item active" aria-current="page">졍형외과</li>
			</ol>
		</nav>
	</div>

  <!--================Single Product Area =================-->
	<div class="product_image_area">
		<div class="container">
			<div class="row s_product_inner">
				<div class="col-lg-6">
					<div class="owl-carousel owl-theme s_Product_carousel">
						<div class="single-prd-item">
							<img class="img-fluid" src="<c:url value='/resources/img/category/hospital3.jpg" alt="'/>"/>
						 	
						</div>
                        <div class="single-prd-item">
                            <img class="img-fluid" src="<c:url value='/resources/img/category/hospital2.jpg" alt="'/>"/>
                        </div>
					</div>
				</div>
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
						<h3>${hospitalInfo.yadmNm }</h3>
						<h2>정형외과</h2>
						<ul class="list">
							<li><a class="active" href="#"><span>전화번호</span> : ${hospitalInfo.telno }</a></li>
							<li><a href="#"><span>지역</span> : ${hospitalInfo.sidoCdNm}</a></li>
						</ul>
                        
						<p>${hospitalInfo.addr }</p>
						<div class="product_count">
                            <label>예약날짜 : </label>
                            <input type="date" name="birth" id="b" min="1996-12-30"  style="width:150px;font-size:15px;">
							<a class="button primary-btn" href="#">예약</a>               
						</div>
						<div class="card_area d-flex align-items-center">
							<a class="icon_btn" href="#"><i class="lnr lnr lnr-diamond"></i></a>
							<a class="icon_btn" href="#"><i class="lnr lnr lnr-heart"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--================End Single Product Area =================-->

	<!--================Product Description Area =================-->
	<section class="product_description_area">
		<div class="container">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item">
					<a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true" onclick="handleTabClick('home-tab')">
					병원정보
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">
					QnA
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review" aria-selected="false">
					 리뷰
					 </a>
				</li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
					<p>팔꿈치 부상을 전문으로 하는 <strong>${hospitalInfo.yadmNm }</strong> 정형외과입니다.</p>
                    <div class="col-lg-12">

                    </div>
                    <div class="col-lg-9 col-md-9 blog_details">
                        <h2>${hospitalInfo.yadmNm }</h2>
                        <p class="excert">
                                MCSE boot camps have its supporters and its detractors. Some people do not understand why you should have to spend money
                                on boot camp when you can get the MCSE study materials yourself at a fraction.
                        </p>
                        <p>
                                Boot camps have its supporters and its detractors. Some people do not understand why you should have to spend money on boot
                                camp when you can get the MCSE study materials yourself at a fraction of the camp price.
                                However, who has the willpower to actually sit through a self-imposed MCSE training. who
                                has the willpower to actually sit through a self-imposed
                        </p>
                        <p>
                                Boot camps have its supporters and its detractors. Some people do not understand why you should have to spend money on boot
                                camp when you can get the MCSE study materials yourself at a fraction of the camp price.
                                However, who has the willpower to actually sit through a self-imposed MCSE training. who
                                has the willpower to actually sit through a self-imposed
                        </p>
                    </div>	
                    <div class="col-lg-12">
                        <div class="quotes">
                                MCSE boot camps have its supporters and its detractors. Some people do not understand why you should have to spend money
                                on boot camp when you can get the MCSE study materials yourself at a fraction of the camp
                                price. However, who has the willpower to actually sit through a self-imposed MCSE training.
                        </div>
                        <div class="row">
                                <div class="col-6">
                                        <img class="img-fluid" src="<c:url value='/resources/img/category/usman-yousaf-pTrhfmj2jDA-unsplash.jpg" alt="'/>"/>
                                </div>
                                <div class="col-6">
                                        <img class="img-fluid" src="<c:url value='/resources/img/category/새우아님.jpg" alt="'/>"/>
                                </div>
                                <div class="col-lg-12 mt-4">
                                        <p>
                                                MCSE boot camps have its supporters and its detractors. Some people do not understand why you should have to spend money
                                                on boot camp when you can get the MCSE study materials yourself at a fraction of
                                                the camp price. However, who has the willpower.
                                        </p>
                                        <p>
                                                MCSE boot camps have its supporters and its detractors. Some people do not understand why you should have to spend money
                                                on boot camp when you can get the MCSE study materials yourself at a fraction of
                                                the camp price. However, who has the willpower.
                                        </p>
                                </div>
                        </div>
                    </div>
				</div>
				<div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
					<div class="row">
						<div class="col-lg-6">
							<div class="comment_list">
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/review2.png" alt="">
										</div>
										<div class="media-body">
											<h4>강도영</h4>
											<h5>12th Feb, 2018 at 05:56 pm</h5>
											<a class="reply_btn" href="#">Reply</a>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
										dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
										commodo</p>
								</div>
								<div class="review_item reply">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/review2.png" alt="">
										</div>
										<div class="media-body">
											<h4>서의정</h4>
											<h5>12th Feb, 2018 at 05:56 pm</h5>
											<a class="reply_btn" href="#">Reply</a>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
										dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
										commodo</p>
								</div>
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/review2.png" alt="">
										</div>
										<div class="media-body">
											<h4>이태림</h4>
											<h5>12th Feb, 2018 at 05:56 pm</h5>
											<a class="reply_btn" href="#">Reply</a>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
										dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
										commodo</p>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="review_box">
								<h4>QnA 작성</h4>
								<form class="row contact_form" action="contact_process.php" method="post" id="contactForm" novalidate="novalidate">
									<div class="col-md-12">
										<div class="form-group">
											<input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력하세요.">
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요.">
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<input type="text" class="form-control" id="number" name="number" placeholder="전화번호를 입력하세요.">
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<textarea class="form-control" name="message" id="message" rows="1" placeholder="글을 작성하세요."></textarea>
										</div>
									</div>
									<div class="col-md-12 text-right">
										<button type="submit" value="submit" class="btn primary-btn">등록</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
					<div class="row">
						<div class="col-lg-6">
							<div class="row total_rate">
								<div class="col-6">
									<div class="box_total">
										<h5>총점</h5>
										<h4>4.0</h4>
									</div>
								</div>
								<div class="col-6">
									<div class="rating_list">
										<ul class="list">
											<li><a href="#">5 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
													 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
											<li><a href="#">4 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
													 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
											<li><a href="#">3 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
													 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
											<li><a href="#">2 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
													 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
											<li><a href="#">1 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
													 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="review_list">
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/review2.png" alt="">
										</div>
										<div class="media-body">
											<h4>서의정</h4>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
										dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
										commodo</p>
								</div>
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/review2.png" alt="">
										</div>
										<div class="media-body">
											<h4>강도영</h4>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
										dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
										commodo</p>
								</div>
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/review2.png" alt="">
										</div>
										<div class="media-body">
											<h4>이태림</h4>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
										dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
										commodo</p>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="review_box">
								<h4>리뷰작성</h4>
								<p>평점:</p>
								<ul class="list">
									<li><a href="#"><i class="fa fa-star"></i></a></li>
									<li><a href="#"><i class="fa fa-star"></i></a></li>
									<li><a href="#"><i class="fa fa-star"></i></a></li>
									<li><a href="#"><i class="fa fa-star"></i></a></li>
									<li><a href="#"><i class="fa fa-star"></i></a></li>
								</ul>
								<!-- <p>Outstanding</p> -->
				                <form action="#/" class="form-contact form-review mt-3">
				                  <div class="form-group">
				                    <input class="form-control" name="name" type="text" placeholder="이름을 입력하세요." required>
				                  </div>
				                  <div class="form-group">
				                    <input class="form-control" name="email" type="email" placeholder="이메일을 입력하세요." required>
				                  </div>
				                  <div class="form-group">
				                    <input class="form-control" name="subject" type="text" placeholder="제목을 입력하세요.">
				                  </div>
				                  <div class="form-group">
				                    <textarea class="form-control different-control w-100" name="textarea" id="textarea" cols="30" rows="5" placeholder="글을 작성하세요."></textarea>
				                  </div>
				                  <div class="form-group text-center text-md-right mt-3">
				                    <button type="submit" class="button button--active button-review">등록</button>
				                  </div>
				                </form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Product Description Area =================-->

	<!--================ Start related Product area =================-->  
	<section class="related-product-area section-margin--small mt-0">
		<div class="container">
			<div class="section-intro pb-60px">
		        <p>Popular Item in the market</p>
		        <h1>오시는 <span class="section-intro__style">길</span></h1>
		    </div>
	    	<div class="">
	    	 	<div id="map" style="width: 100%; height: 500px;" class="feature-img"></div>
                <br>
                <h2>교통 정보</h2>
                <div id="map2" style="width: 100%; height: 400px;" class="feature-img"></div>	
	    	</div>
	    	<br>
	    	<div class="d-flex justify-content-center mx-auto p-2">
	    		<a class="button primary-btn btn-check btn btn-outline-primary " style="width:200px" href="https://map.kakao.com/link/to/${hospitalInfo.yadmNm},${hospitalInfo.YPos},${hospitalInfo.XPos}" target="_blank">길찾기</a>
			</div>
        </div>
	</section>
	<!--================ end related Product area =================-->  	

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5378af335c867b376e6f09fedae7f166"></script>

	<script>
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(${hospitalInfo.YPos }, ${hospitalInfo.XPos }), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	var markerPosition  = new kakao.maps.LatLng(${hospitalInfo.YPos }, ${hospitalInfo.XPos }); 

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	
	</script>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=발급받은 APP KEY를 사용하세요"></script>
    <script>
        var mapContainer2 = document.getElementById('map2'), // 지도를 표시할 div 
            mapOption2 = {
                center: new kakao.maps.LatLng(${hospitalInfo.YPos }, ${hospitalInfo.XPos }), // 지도의 중심좌표
                level: 4 // 지도의 확대 레벨
            };

        // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
        var map2 = new kakao.maps.Map(mapContainer2, mapOption2);
    	
     	// 마커를 생성합니다
    	var marker = new kakao.maps.Marker({
    	    position: markerPosition
    	});
     	

    	// 마커가 지도 위에 표시되도록 설정합니다
    	marker.setMap(map2);
    	 // 지도에 교통정보를 표시하도록 지도타입을 추가합니다
        map2.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC); 
     // 지도에 추가된 지도타입정보를 가지고 있을 변수입니다
        var currentTypeId;

        // 버튼이 클릭되면 호출되는 함수입니다
        function setOverlayMapTypeId(maptype) {
            var changeMaptype;
            
            // maptype에 따라 지도에 추가할 지도타입을 결정합니다
            if (maptype === 'traffic') {            
                
                // 교통정보 지도타입
                changeMaptype = kakao.maps.MapTypeId.TRAFFIC;     
                
            } else if (maptype === 'roadview') {        
                
                // 로드뷰 도로정보 지도타입
                changeMaptype = kakao.maps.MapTypeId.ROADVIEW;    

            } else if (maptype === 'terrain') {
                
                // 지형정보 지도타입
                changeMaptype = kakao.maps.MapTypeId.TERRAIN;    

            } else if (maptype === 'use_district') {
                
                // 지적편집도 지도타입
                changeMaptype = kakao.maps.MapTypeId.USE_DISTRICT;           
            }
            
            // 이미 등록된 지도 타입이 있으면 제거합니다
            if (currentTypeId) {
                map.removeOverlayMapTypeId(currentTypeId);    
            }
            
            // maptype에 해당하는 지도타입을 지도에 추가합니다
            map.addOverlayMapTypeId(changeMaptype);
            
            // 지도에 추가된 타입정보를 갱신합니다
            currentTypeId = changeMaptype;        
        }
    </script>

	
	
  <script src="<c:url value='/resources/vendors/jquery/jquery-3.2.1.min.js'/>"/></script>
  <script src="<c:url value='/resources/vendors/bootstrap/bootstrap.bundle.min.js'/>"/></script>
  <script src="<c:url value='/resources/vendors/skrollr.min.js'/>"/></script>
  <script src="<c:url value='/resources/vendors/owl-carousel/owl.carousel.min.js'/>"/></script>
  <script src="<c:url value='/resources/vendors/nice-select/jquery.nice-select.min.js'/>"/></script>
  <script src="<c:url value='/resources/vendors/jquery.ajaxchimp.min.js'/>"/></script>
  <script src="<c:url value='/resources/vendors/mail-script.js'/>"/></script>
  <script src="<c:url value='/resources/js/main.js'/>"/></script>
</body>
</html>